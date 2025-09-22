#!/usr/bin/env bash
set -Eeuo pipefail

# --- Variables you can set ---
: "${DOTS_REPO:=https://github.com/alexdelifer/dots.git}"
: "${MNT:=/mnt}"
: "${USERNAME:=alex}"   # <-- Set your username here

log() { printf "\e[1;34m[bootstrap]\e[0m %s\n" "$*"; }
die() { printf "\e[1;31m[bootstrap]\e[0m %s\n" "$*" >&2; exit 1; }

[[ $EUID -eq 0 ]] || die "Run as root from the Arch ISO."

# 1) Install needed tools
pacman -Sy --noconfirm --needed git rsync arch-install-scripts archinstall

# 2) Clone dots repo into /dev/shm
WORK=/dev/shm/bootstrap
DOTS_DIR=$WORK/dots
rm -rf "$WORK"
mkdir -p "$WORK"
log "Cloning dots repo into /dev/shm…"
git clone --depth=1 "$DOTS_REPO" "$DOTS_DIR"

# 3) Run archinstall with user_configuration.json
CFG="$DOTS_DIR/archinstall/user_configuration.json"
if [[ ! -f "$CFG" ]]; then
  die "Config file not found: $CFG"
fi

log "Launching archinstall with config: $CFG"
archinstall --config "$CFG"

# 4) Copy dots repo into the new system under the non-root user's home
if [[ ! -d "$MNT/home/$USERNAME" ]]; then
  die "User home not found in /mnt: $MNT/home/$USERNAME"
fi

log "Copying dots into $MNT/home/$USERNAME/dots"
rsync -a "$DOTS_DIR" "$MNT/home/$USERNAME/dots"
chown -R "$USERNAME:$USERNAME" "$MNT/home/$USERNAME/dots"

# 5) Chroot to install aconfmgr from packages folder
PKG=$(ls "$MNT/home/$USERNAME/dots/packages"/aconfmgr-*.pkg.tar.* 2>/dev/null | head -n1)
if [[ -z "$PKG" ]]; then
  die "aconfmgr package not found in packages/"
fi

log "Chrooting into $MNT to install aconfmgr…"
arch-chroot "$MNT" pacman -U --noconfirm "/home/$USERNAME/dots/packages/$(basename "$PKG")"

log "aconfmgr installed. Stopping here as requested."
