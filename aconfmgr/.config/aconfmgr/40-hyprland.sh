CheckConfig hyprland || return 0


AddPackage hypridle # hyprland's idle daemon
AddPackage hyprland # a highly customizable dynamic tiling Wayland compositor
AddPackage hyprlock # hyprland's GPU-accelerated screen locking utility
AddPackage hyprpaper # a blazing fast wayland wallpaper utility with IPC controls
AddPackage hyprutils # Hyprland utilities library used across the ecosystem
AddPackage hyprpicker # A no-nonsense Wayland color picker
AddPackage hyprsunset # Blue-light filter / gamma adjuster for Hyprland
AddPackage --foreign hyprland-contrib # Community scripts for Hyprland (includes grimblast)

AddPackage greetd # Generic greeter daemon
AddPackage greetd-gtkgreet # GTK based greeter for greetd
AddPackage greetd-tuigreet # A console UI greeter for greetd
CopyFile /etc/greetd/config.toml

AddPackage foot # Fast, lightweight, and minimalistic Wayland terminal emulator
AddPackage alacritty # A cross-platform, GPU-accelerated terminal emulator
AddPackage thunar # Modern, fast and easy-to-use file manager for Xfce
AddPackage thunar-volman # Automatic management of removable drives and media for Thunar
AddPackage rofi # A window switcher, application launcher and dmenu replacement
AddPackage rofimoji # Emoji, unicode and general character picker for rofi and rofi-likes
AddPackage mako # Lightweight notification daemon for Wayland
AddPackage wob # A lightweight overlay volume/backlight/progress/anything bar for Wayland
AddPackage polkit-gnome # Legacy polkit authentication agent for GNOME
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland
AddPackage cliphist # wayland clipboard manager
AddPackage clipnotify # Polling-free clipboard notifier
AddPackage clipse # A configurable TUI clipboard manager for Unix
AddPackage spice-vdagent # Spice agent for Linux guests
AddPackage kwalletmanager # Wallet management tool
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage xorg-xrandr # Primitive command line interface to RandR extension
AddPackage ydotool # Generic command-line automation tool (no X!)
AddPackage slurp # Select a region in a Wayland compositor
AddPackage grim # Screenshot utility for Wayland
AddPackage wf-recorder # Screen recorder for wlroots-based compositors
AddPackage lxappearance # Feature-rich GTK+ theme switcher of the LXDE Desktop
AddPackage wev # A tool for debugging wayland events on a Wayland window
AddPackage brightnessctl # Read and control device brightness
AddPackage qalculate-gtk # A multi-purpose desktop calculator
AddPackage corectrl # Control AMD GPU and CPU parameters
AddPackage systembus-notify # DBus notification bridge for system-level events
AddPackage ddcutil # Control monitor settings via DDC/CI
AddPackage i2c-tools # Userspace tools for the I2C bus (required by ddcutil)

AddPackage seahorse # GNOME application for managing PGP keys

AddPackage firefox # Fast, Private & Safe Web Browser
AddPackage easyeffects # Audio Effects for Pipewire applications
AddPackage waybar # Highly customizable Wayland bar for Wlroots based compositors

AddPackage kali-themes # GTK theme included with Kali Linux
AddPackage sweet-folders-icons-git # Folder icons from the Sweet GTK Theme for Linux desktop environments
AddPackage sweet-gtk-theme-dark # Light and dark colorful Gtk3.20+ theme
AddPackage --foreign posy-improved-cursors # Posy's improved cursors by Michiel de Boer, available as cursor themes.

AddPackage xdg-desktop-portal-gtk # A backend implementation for xdg-desktop-portal using GTK
AddPackage xdg-desktop-portal-hyprland # xdg-desktop-portal backend for hyprland

AddPackage --foreign xwaylandvideobridge # Utility to allow streaming Wayland windows to X applications
