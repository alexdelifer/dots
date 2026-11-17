#  Per-host layer. Everything not here is shared by all three machines.
#    mele  - desktop, Arch + chaotic + blackarch, GRUB, LUKS+LVM, AMD 7900XTX
#    p14s  - ThinkPad P14s G3, Arch + chaotic + blackarch, systemd-boot, LUKS, Intel + NVIDIA T550
#    degen - Dell Pro Max 16, CachyOS repos + chaotic + blackarch, limine, LUKS (sd-encrypt), Intel Arc + NVIDIA RTX PRO 2000

DeliferPrint "Host layer: $HOST"

# --- Arch-repo hosts (mele, p14s) -----------------------------------------
if [[ $HOST == mele || $HOST == p14s ]]; then
    CopyFile /etc/pacman.conf
    AddPackage linux # The Linux kernel and modules
    AddPackage linux-headers # Headers and scripts for building modules for the Linux kernel
    AddPackage linux-zen # The Linux ZEN kernel and modules
    AddPackage linux-zen-headers # Headers and scripts for building modules for the Linux ZEN kernel
    CopyFileTo "/etc/mkinitcpio.d/$HOST/linux.preset" /etc/mkinitcpio.d/linux.preset
    CopyFileTo "/etc/mkinitcpio.d/$HOST/linux-zen.preset" /etc/mkinitcpio.d/linux-zen.preset
fi

# Every host has its own initramfs hooks (LUKS/LVM/sd-encrypt/plymouth differ)
CopyFileTo "/etc/mkinitcpio.conf-$HOST" /etc/mkinitcpio.conf

case "$HOST" in
mele)
    AddPackage linux-cachyos # CachyOS kernel (from chaotic-aur)
    AddPackage linux-cachyos-headers # Headers for linux-cachyos
    CopyFileTo /etc/mkinitcpio.d/mele/linux-cachyos.preset /etc/mkinitcpio.d/linux-cachyos.preset
    AddPackage os-prober # Utility to detect other OSes on a set of drives
    AddPackage --foreign grub-hook # Pacman hook to update GRUB after a kernel update
    CopyFile /etc/profile.d/multi-gpu.sh
    # desktop-only services
    CopyFile /etc/systemd/system/rclone-seedbox.service
    CopyFile /etc/systemd/system/local-lan-priority.service
    CopyFile /etc/systemd/system/meridian.service
    CopyFile /etc/systemd/system/opencode.service
    CreateLink /etc/systemd/system/default.target.wants/rclone-plex.service /etc/systemd/system/rclone-plex.service
    CreateLink /etc/systemd/system/multi-user.target.wants/local-lan-priority.service /etc/systemd/system/local-lan-priority.service
    CreateLink /etc/systemd/system/multi-user.target.wants/synergy.service /usr/lib/systemd/system/synergy.service
    ;;
p14s)
    # systemd-boot (entries live in /boot, ignored); Turing T550 runs the open module
    AddPackage nvidia-open-dkms # NVIDIA open kernel modules - module sources
    ;;
degen)
    CopyFileTo /etc/pacman.conf-degen /etc/pacman.conf
    IgnorePath '/etc/pacman.d/cachyos-*'   # managed by cachyos-rate-mirrors
    AddPackage cachyos-keyring # CachyOS PGP keyring
    AddPackage cachyos-mirrorlist # CachyOS mirrorlist
    AddPackage cachyos-v3-mirrorlist # CachyOS v3 mirrorlist
    AddPackage cachyos-v4-mirrorlist # CachyOS v4 mirrorlist
    AddPackage cachyos-rate-mirrors # Rank CachyOS + Arch mirrors
    AddPackage cachyos-settings # CachyOS system tuning (sysctl, udev, zram)
    AddPackage cachyos-hooks # CachyOS pacman hooks
    AddPackage chwd # CachyOS hardware detection
    AddPackage ananicy-cpp # Auto nice daemon
    AddPackage cachyos-ananicy-rules # ananicy-cpp rules
    AddPackage efibootmgr # Linux user-space application to modify the EFI Boot Manager
    AddPackage limine # Bootloader
    AddPackage limine-mkinitcpio-hook # Rebuild limine entries on kernel install
    AddPackage plymouth # Graphical boot splash (initramfs hook is in mkinitcpio.conf-degen)
    AddPackage cachyos-plymouth-bootanimation # CachyOS plymouth theme
    AddPackage linux-cachyos # CachyOS kernel
    AddPackage linux-cachyos-headers # Headers for linux-cachyos
    AddPackage linux-cachyos-nvidia-open # Prebuilt NVIDIA open modules for linux-cachyos
    AddPackage linux-cachyos-lts # CachyOS LTS kernel (fallback)
    AddPackage linux-cachyos-lts-headers # Headers for linux-cachyos-lts
    AddPackage linux-cachyos-lts-nvidia-open # Prebuilt NVIDIA open modules for linux-cachyos-lts
    AddPackage linux-firmware-nvidia # Firmware for NVIDIA GPUs
    AddPackage mkinitcpio # initramfs builder (limine hook depends on it; keep explicit)
    AddPackage cryptsetup # LUKS root - keep explicit
    ;;
esac
