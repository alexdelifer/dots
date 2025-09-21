# foot
# thunar
# rofi
# make
# hyprlock
# hyprwidgets
# hypridle
# sway-audio-idle-inhibit
# wob
# pactl
# polkit-gnome
# swayrd
# wl-paste
# cliphist
# spice-vdagent
# hyprpaper
# Kali theme
# sweet
# posys
# kwalletmanager5
# corectl
# firefox
# easyeffects
# clipse
# waybar
# alacritty
# light
# playerctl
# wofi-emoji
# hyprpicker
# hypr-fix-special
# grimblast
# xorg-xrandr

AddPackage hypridle # hyprland’s idle daemon
AddPackage hyprland # a highly customizable dynamic tiling Wayland compositor
AddPackage hyprlock # hyprland’s GPU-accelerated screen locking utility
AddPackage hyprpaper # a blazing fast wayland wallpaper utility with IPC controls
AddPackage hyprutils # Hyprland utilities library used across the ecosystem

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
AddPackage swayr # Swayr is a window switcher (and more) for sway
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland
AddPackage cliphist # wayland clipboard manager
AddPackage clipnotify # Polling-free clipboard notifier
AddPackage clipse # A configurable TUI clipboard manager for Unix
AddPackage spice-vdagent # Spice agent for Linux guests
AddPackage kwalletmanager # Wallet management tool
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage xorg-xrandr # Primitive command line interface to RandR extension
AddPackage ydotool # Generic command-line automation tool (no X!)
AddPackage slop # Utility to query the user for a selection and print the region to stdout
AddPackage slurp # Select a region in a Wayland compositor
AddPackage wofi # launcher for wlroots-based wayland compositors
AddPackage grim # Screenshot utility for Wayland
AddPackage maim # Utility to take a screenshot using imlib2
AddPackage wf-recorder # Screen recorder for wlroots-based compositors such as sway
AddPackage lxappearance # Feature-rich GTK+ theme switcher of the LXDE Desktop
AddPackage wev # A tool for debugging wayland events on a Wayland window, analagous to the X11 tool xev
AddPackage cage # A kiosk compositor for Wayland

AddPackage seahorse # GNOME application for managing PGP keys


AddPackage firefox # Fast, Private & Safe Web Browser
AddPackage easyeffects # Audio Effects for Pipewire applications
AddPackage waybar # Highly customizable Wayland bar for Sway and Wlroots based compositors


AddPackage kali-themes # GTK theme included with Kali Linux
AddPackage sweet-folders-icons-git # Folder icons from the Sweet GTK Theme for Linux desktop environments
AddPackage sweet-gtk-theme-dark # Light and dark colorful Gtk3.20+ theme
AddPackage --foreign posy-improved-cursors # Posy's improved cursors by Michiel de Boer, available as cursor themes.


AddPackage xdg-desktop-portal-gtk # A backend implementation for xdg-desktop-portal using GTK
AddPackage xdg-desktop-portal-hyprland # xdg-desktop-portal backend for hyprland

# sway support
AddPackage sway # Tiling Wayland compositor and replacement for the i3 window manager
AddPackage swaybg # Wallpaper tool for Wayland compositors
AddPackage swayidle # Idle management daemon for Wayland
AddPackage swayimg # A lightweight image viewer for Wayland display servers
AddPackage swaylock # Screen locker for Wayland

AddPackage --foreign wofi-calc # A simple calculator for wofi, inspired in rofi-calc.
AddPackage --foreign wofi-emoji # Emoji picker for Wayland using wofi and wtype
AddPackage --foreign sway-audio-idle-inhibit-git # Prevents swayidle from sleeping while any application is outputting or receiving audio
AddPackage --foreign xwaylandvideobridge # Utility to allow streaming Wayland windows to X applications
AddPackage --foreign flashfocus # Simple focus animations for tiling window managers


