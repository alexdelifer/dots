#!/usr/bin/env bash
set -Eeuo pipefail

# === Options ================================================================
: "${WORK:=/tmp/postinstall}"            # temp dir
: "${ADD_BLACKARCH:=1}"                  # set 0 to skip
: "${ADD_CHAOTIC:=1}"                    # set 0 to skip

# (Optional) Verify BlackArch strap.sh. Look up the current SHA1 on their site.
: "${BLACKARCH_STRAP_SHA1:=}"            # e.g. "bbf0a0b838aed0ec05fff2d375dd17591cbdf8aa"

# Chaotic-AUR key + keyservers
CHAOTIC_KEY="3056513887B78AEB"
CHAOTIC_KEYSRV_DEFAULT="keyserver.ubuntu.com"
CHAOTIC_KEYSRV_FALLBACK="keys.openpgp.org"

log()  { printf "\e[1;34m[repos]\e[0m %s\n" "$*"; }
warn() { printf "\e[1;33m[repos]\e[0m %s\n" "$*"; }
die()  { printf "\e[1;31m[repos]\e[0m %s\n" "$*" >&2; exit 1; }

[[ $EUID -eq 0 ]] || die "Run as root (inside the target system or arch-chroot)."
mkdir -p "$WORK"

# Ensure basics
pacman -Sy --noconfirm --needed curl gnupg sed grep awk >/dev/null

# Initialize pacman-key if needed
if [[ ! -s /etc/pacman.d/gnupg/pubring.gpg ]]; then
  log "Initializing pacman keyring…"
  pacman-key --init
fi

# --- Helpers ---------------------------------------------------------------

# Usage: pacman_conf_has chaotic-aur   (no brackets)
pacman_conf_has() {
  local repo="$1"
  if command -v pacman-conf >/dev/null 2>&1; then
    pacman-conf --repo-list | grep -qx "$repo"
  else
    grep -Eqs "^[[:space:]]*\[$repo\][[:space:]]*(#.*)?$" /etc/pacman.conf
  fi
}

# Usage: append_repo_block chaotic-aur "Include = /etc/pacman.d/chaotic-mirrorlist"
append_repo_block() {
  local repo="$1" block="$2"
  if pacman_conf_has "$repo"; then
    log "Repo [$repo] already present; skipping append."
  else
    printf "\n[%s]\n%s\n" "$repo" "$block" >> /etc/pacman.conf
    log "Appended [$repo] to /etc/pacman.conf"
  fi
}

recv_and_lsign_key() {
  # $1 keyid, $2 keyserver
  local key="$1" ks="$2"
  pacman-key --recv-key "$key" --keyserver "hkp://${ks}:80" \
    || pacman-key --recv-key "$key" --keyserver "$ks"
  pacman-key --lsign-key "$key"
}

add_blackarch() {
  if pacman_conf_has "blackarch"; then
    log "BlackArch already configured."
    return 0
  fi

  log "Adding BlackArch repo via strap.sh…"
  local strap="$WORK/strap.sh"
  curl -fsSL "https://blackarch.org/strap.sh" -o "$strap"

  if [[ -n "$BLACKARCH_STRAP_SHA1" ]]; then
    log "Verifying strap.sh SHA1…"
    echo "${BLACKARCH_STRAP_SHA1}  ${strap}" | sha1sum -c - || die "strap.sh SHA1 mismatch."
  else
    warn "Skipping strap.sh SHA1 verification (set BLACKARCH_STRAP_SHA1 to enforce)."
  fi

  chmod +x "$strap"
  "$strap"   # modifies pacman.conf, installs keyring/mirrorlist
  pacman -Sy --noconfirm
  log "BlackArch repo added."
}

add_chaotic() {
  if pacman_conf_has "chaotic-aur"; then
    log "Chaotic-AUR already configured."
    return 0
  fi

  log "Importing Chaotic-AUR primary key ($CHAOTIC_KEY)…"
  if ! recv_and_lsign_key "$CHAOTIC_KEY" "$CHAOTIC_KEYSRV_DEFAULT"; then
    warn "Default keyserver failed; trying fallback…"
    recv_and_lsign_key "$CHAOTIC_KEY" "$CHAOTIC_KEYSRV_FALLBACK" || die "Failed to import Chaotic key."
  fi

  # Install keyring & mirrorlist (idempotent: pacman -U will skip if same version installed)
  log "Installing chaotic keyring + mirrorlist…"
  pacman -U --noconfirm \
    'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
    'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

  append_repo_block "chaotic-aur" "Include = /etc/pacman.d/chaotic-mirrorlist"

  if ! pacman_conf_has "multilib"; then
    warn "multilib disabled. Some Chaotic packages may need it. Enable [multilib] if required."
  fi

  pacman -Sy --noconfirm
  log "Chaotic-AUR repo added."
}

# === Run ====================================================================
(( ADD_BLACKARCH == 1 )) && add_blackarch || log "Skipping BlackArch."
(( ADD_CHAOTIC   == 1 )) && add_chaotic   || log "Skipping Chaotic-AUR."

log "All done. You can now install packages from the new repos."
