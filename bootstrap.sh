#!/usr/bin/env bash
set -Eeuo pipefail

# --- Vars you can tweak ---
: "${DOTS_REPO:=https://github.com/alexdelifer/dots.git}"
: "${MNT:=/mnt}"
: "${USERNAME:=alex}"   # set this to your user created by archinstall

log(){ printf "\e[1;34m[bootstrap]\e[0m %s\n" "$*"; }
die(){ printf "\e[1;31m[bootstrap]\e[0m %s\n" "$*" >&2; exit 1; }

[[ $EUID -eq 0 ]] || die "Run as root from the Arch ISO."

# 1) Tools
pacman -Sy --noconfirm --needed git rsync arch-install-scripts archinstall util-linux >/dev/null

# 2) Clone to RAM
WORK=/dev/shm/bootstrap
DOTS_DIR="$WORK/dots"
rm -rf "$WORK"; mkdir -p "$WORK"
log "Cloning dots → $DOTS_DIR"
git clone --depth=1 "$DOTS_REPO" "$DOTS_DIR"

# 3) Run archinstall with your repo config (under a PTY so the TUI works)
CFG="$DOTS_DIR/archinstall/user_configuration.json"
[[ -f "$CFG" ]] || die "Missing config: $CFG"

log "Launching archinstall TUI (PTY)…"
# -q quiet, -f flush, -c command, typescript to /dev/null (no file created)
script -qfc "archinstall --config '$CFG'" /dev/null

# If archinstall failed, bail early (its logs are in /var/log/archinstall/install.log on the ISO)
if [[ $? -ne 0 ]]; then
  die "archinstall exited with an error. Check /var/log/archinstall/install.log"
fi

# 4) Put dots into the new system’s non-root user home
[[ -d "$MNT/home/$USERNAME" ]] || die "User home not found at $MNT/home/$USERNAME (did archinstall create the user?)"

log "Copying dots → $MNT/home/$USERNAME/dots"
rsync -a "$DOTS_DIR" "$MNT/home/$USERNAME/dots"
chown -R "$USERNAME:$USERNAME" "$MNT/home/$USERNAME/dots"

# 5) Chroot and install aconfmgr from your prebuilt package
PKG=$(ls "$MNT/home/$USERNAME/dots/packages"/aconfmgr-*.pkg.tar.* 2>/dev/null | head -n1 || true)
[[ -n "$PKG" ]] || die "No aconfmgr package found in dots/packages/"

log "Installing aconfmgr inside target (arch-chroot)…"
arch-chroot "$MNT" pacman -U --noconfirm "/home/$USERNAME/dots/packages/$(basename "$PKG")"

log "Done. Stopping here as requested."
