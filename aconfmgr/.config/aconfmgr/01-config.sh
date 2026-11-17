# Shared by every Arch-family box (mele, p14s, degen). Host-only bits live in
# 95-hosts.sh; hardware is auto-detected in 15-hardware.sh.
HOST=${HOSTNAME:-$(</etc/hostname)}
IS_LAPTOP=0; [[ -d /sys/class/power_supply/BAT0 || -d /sys/class/power_supply/BAT1 ]] && IS_LAPTOP=1

MODULES=(
    cli
    system
    hardware
    pipewire
    ai
    dev
    hacker
    xorg
    fonts
    hyprland
    #gnome
    gui
    harden
)

# Gaming only on the desktop
case "$HOST" in
    mele) MODULES+=(game) ;;
esac

# print the config
PrintConfig
DeliferPrint "HOST: $HOST (laptop=$IS_LAPTOP)"
