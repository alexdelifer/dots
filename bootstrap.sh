#!/usr/bin/env bash
set -Eeuo pipefail

# === Vars you can tweak ===
: "${DOTS_REPO:=https://github.com/alexdelifer/dots.git}"
: "${MNT:=/mnt}"
: "${USERNAME:=alex}"   # <-- set to the user you create in archinstall

log(){ printf "\e[1;34m[bootstrap]\e[0m %s\n" "$*"; }
die(){ printf "\e[1;31m[bootstrap]\e[0m %s\n" "$*" >&2; exit 1; }

[[ $EUID -eq 0 ]] || die "Run as root from the Arch ISO."

# 1) Tools (quiet-ish)
pacman -Sy --noconfirm --needed git rsync arch-install-scripts archinstall util-linux >/dev/null || \
  die "Failed to install prerequisites."

# 2) Clone to RAM
WORK=/dev/shm/bootstrap
DOTS_DIR="$WORK/dots"
rm -rf "$WORK"; mkdir -p "$WORK"
log "Cloning dots → $DOTS_DIR"
git clone --depth=1 "$DOTS_REPO" "$DOTS_DIR"

# 3) Launch archinstall TUI with a real PTY
CFG="$DOTS_DIR/archinstall/user_configuration.json"
[[ -f "$CFG" ]] || die "Missing config: $CFG"

run_archinstall() {
  export TERM=${TERM:-xterm-256color}

#   # Preferred: util-linux `script` gives us a PTY reliably
#   if command -v script >/dev/null 2>&1; then
#     log "Starting archinstall via 'script' PTY…"
#     script -qfec "archinstall --config '$CFG'" /dev/null && return 0
#     log "archinstall via 'script' returned non-zero."
#   fi

#   # Fallback 1: systemd-run with a pty
#   if command -v systemd-run >/dev/null 2>&1; then
#     log "Trying archinstall via 'systemd-run --pty'…"
#     systemd-run --quiet --pipe --pty --same-dir --wait bash -lc "archinstall --config '$CFG'" && return 0
#     log "archinstall via 'systemd-run' returned non-zero."
#   fi

  # Fallback 2: tmux, if present
  if command -v tmux >/dev/null 2>&1; then
    log "Trying archinstall in a tmux session… (exit tmux when done)"
    tmux new-session "archinstall --config '$CFG'" && return 0
    log "archinstall via 'tmux' returned non-zero."
  fi

  # Last attempt: if we already have a tty, just run it
  if [[ -t 0 && -t 1 ]]; then
    log "Running archinstall directly on current TTY…"
    archinstall --config "$CFG" && return 0
  fi

  return 1
}

log "Launching archinstall with TUI (you configure disks, passwords, etc.)"
if ! run_archinstall; then
  echo
  echo ">>> archinstall failed to start or exited with an error."
  echo "    Check logs on the live ISO: /var/log/archinstall/install.log"
  die "Could not run archinstall with a PTY."
fi

# 4) Put dots into the new system for the non-root user (numeric ownership)
TARGET_PASSWD="$MNT/etc/passwd"
[[ -f "$TARGET_PASSWD" ]] || die "Missing $TARGET_PASSWD (did archinstall finish?)"
[[ -d "$MNT/home/$USERNAME" ]] || die "User home not found: $MNT/home/$USERNAME (did archinstall create '$USERNAME'?)"

# Parse UID:GID from /mnt/etc/passwd
UID_GID="$(awk -F: -v u="$USERNAME" '$1==u{print $3 ":" $4}' "$TARGET_PASSWD")"
[[ -n "$UID_GID" ]] || die "User '$USERNAME' not found in $TARGET_PASSWD"
UID_NUM="${UID_GID%%:*}"
GID_NUM="${UID_GID##*:}"

log "Copying dots → $MNT/home/$USERNAME/dots (uid:gid ${UID_NUM}:${GID_NUM})"

# Prefer rsync --chown if supported (Arch ISO rsync usually supports it)
if rsync --help | grep -q -- '--chown'; then
  rsync -a --chown="${UID_NUM}:${GID_NUM}" "$DOTS_DIR/" "$MNT/home/$USERNAME/dots/"
else
  rsync -a "$DOTS_DIR/" "$MNT/home/$USERNAME/dots/"
  chown -R --numeric-uid-gid "${UID_NUM}:${GID_NUM}" "$MNT/home/$USERNAME/dots"
fi

# 5) Chroot and install aconfmgr from your prebuilt package
PKG=$(ls "$MNT/home/$USERNAME/dots/packages"/aconfmgr-*.pkg.tar.* 2>/dev/null | head -n1 || true)
[[ -n "$PKG" ]] || die "No aconfmgr package found in dots/packages/"

log "Installing aconfmgr inside target (arch-chroot)…"
arch-chroot "$MNT" pacman -U --noconfirm "/home/$USERNAME/dots/packages/$(basename "$PKG")"

log "aconfmgr installed. Stopping here as requested."
