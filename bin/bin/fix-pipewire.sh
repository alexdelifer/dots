pkill -9 easyeffects

/usr/bin/systemctl --user restart pipewire pipewire-pulse wireplumber
pw-metadata -n settings 0 clock.force-quantum 512

/usr/bin/systemctl --user restart xdg-desktop-portal xdg-desktop-portal-hyprland

gtk-launch com.github.wwmm.easyeffects
