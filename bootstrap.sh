#!/usr/bin/env bash
set -Eeuo pipefail

: "${DOTS_REPO:=https://github.com/alexdelifer/dots.git}"
: "${WORK:=/dev/shm/archmini}"
: "${MNT:=/mnt}"
: "${EDITOR:=vim}"  # change to nano if you prefer

log(){ printf "\e[1;34m[bootstrap]\e[0m %s\n" "$*"; }
warn(){ printf "\e[1;33m[bootstrap]\e[0m %s\n" "$*"; }
die(){ printf "\e[1;31m[bootstrap]\e[0m %s\n" "$*" >&2; exit 1; }

[[ $EUID -eq 0 ]] || die "Run as root from the Arch ISO."

# 0) prereqs kept tiny
pacman -Sy --noconfirm --needed git stow rsync arch-install-scripts archinstall >/dev/null

# 1) workspace in RAM
DOTS_DIR="$WORK/dots"
POST="$WORK/99-post-chroot.sh"
CFG_DIR="$WORK/archinstall"
CFG_JSON="$CFG_DIR/user_config.json"
mkdir -p "$WORK" "$CFG_DIR"

# 2) clone dots (aconfmgr config & prebuilt pkg live here)
if [[ -d "$DOTS_DIR/.git" ]]; then
  log "Updating dots in RAM…"
  git -C "$DOTS_DIR" pull --ff-only || warn "Non-FF; keeping current."
else
  log "Cloning dots → $DOTS_DIR"
  git clone --depth=1 "$DOTS_REPO" "$DOTS_DIR"
fi

# 3) archinstall config: use repo copy if present, else make a tiny template
REPO_CFG="$DOTS_DIR/archinstall/user_config.json"
if [[ -f "$REPO_CFG" ]]; then
  cp -f "$REPO_CFG" "$CFG_JSON"
else
  cat >"$CFG_JSON" <<'JSON'
{
  "version": 1,
  "profile": "minimal",                  // e.g. "minimal" or "desktop"
  "hostname": "arch",
  "locale": "en_US.UTF-8",
  "keyboard-layout": "us",
  "timezone": "America/Toronto",
  "mirror-region": ["Canada","United States"],
  "bootloader": "grub",                  // or "systemd-boot"
  "root-password": "CHANGE_ME",          // recommend: set blank, archinstall will prompt
  "users": [
    { "username": "alex", "password": "CHANGE_ME", "sudo": true }
  ],
  "packages": ["base","linux","linux-firmware","networkmanager","git","stow"],
  "services": ["NetworkManager"],
  "disk-config": {
    "device": "/dev/nvme0n1",
    "partitions": [
      { "type": "efi",  "size": "512M", "mountpoint": "/boot" },
      { "type": "swap", "size": "8G" },
      { "type": "btrfs","size": "100%", "mountpoint": "/", "subvolumes": ["@","@home","@pkg"] }
    ],
    "erase": true,                       // DANGER: wipes the disk if true
    "encrypt": false
  }
}
JSON
  # remove comments (archinstall expects pure JSON)
  sed -i 's,//.*$,,' "$CFG_JSON"
fi

# 4) let the user edit the config before installing
log "Opening archinstall config for edits: $CFG_JSON"
$EDITOR "$CFG_JSON"

# 5) run archinstall with the edited config
log "Running: archinstall --config $CFG_JSON"
archinstall --config "$CFG_JSON"

# 6) after archinstall, /mnt should be mounted; stage dots + post-chroot
if mountpoint -q "$MNT"; then
  log "Staging repo and post-chroot into $MNT…"
  install -d -m 0755 "$MNT/root"
  rsync -a --delete "$DOTS_DIR" "$MNT/root/.dotfiles"
else
  warn "$MNT is not mounted by archinstall? If you used a different mount path, adjust below."
  die "Cannot continue without a mounted target at $MNT."
fi

# 7) tiny post-chroot to install your prebuilt aconfmgr and apply config, then stow
cat > "$POST" <<'EOS'
#!/usr/bin/env bash
set -Eeuo pipefail
log(){ printf "\e[1;32m[post-chroot]\e[0m %s\n" "$*"; }
die(){ printf "\e[1;31m[post-chroot]\e[0m %s\n" "$*" >&2; exit 1; }

DOTS_DIR=/root/.dotfiles
ACONF_PKG="$(ls -1 "$DOTS_DIR"/packages/aconfmgr-*.pkg.tar.* 2>/dev/null | head -n1)"
ACONF_DIR="$DOTS_DIR/aconfmgr"

# a) install your prebuilt aconfmgr package
if [[ -n "$ACONF_PKG" && -f "$ACONF_PKG" ]]; then
  pacman -U --noconfirm "$ACONF_PKG"
else
  die "Prebuilt aconfmgr package not found under $DOTS_DIR/packages/"
fi

# b) apply aconfmgr config
if [[ -d "$ACONF_DIR" ]]; then
  log "Applying aconfmgr config…"
  aconfmgr -c "$ACONF_DIR" apply -y
else
  die "aconfmgr config dir not found at $ACONF_DIR"
fi

# c) stow dotfiles (skip non-stow dirs)
log "Stowing dotfiles…"
cd "$DOTS_DIR"
mapfile -t PKGS < <(find . -mindepth 1 -maxdepth 1 -type d \
  ! -name '.git' ! -name 'packages' ! -name 'aconfmgr' ! -name 'archinstall' -printf '%P\n')
if ((${#PKGS[@]})); then
  stow -t / -v "${PKGS[@]}"
else
  log "No stow packages detected; skipping."
fi

log "All done. You can reboot."
EOS
install -m 0755 "$POST" "$MNT/root/99-post-chroot.sh"

cat <<EOF

===============================================================================
Install steps complete.

Next (inside the ISO still):
  arch-chroot $MNT /root/99-post-chroot.sh

Then reboot.
===============================================================================
EOF

log "Finished."