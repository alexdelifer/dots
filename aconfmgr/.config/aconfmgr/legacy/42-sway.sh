#  ______     __     __     ______     __  __
# /\  ___\   /\ \  _ \ \   /\  __ \   /\ \_\ \
# \ \___  \  \ \ \/ ".\ \  \ \  __ \  \ \____ \
#  \/\_____\  \ \__/".~\_\  \ \_\ \_\  \/\_____\
#   \/_____/   \/_/   \/_/   \/_/\/_/   \/_____/

CheckConfig sway || return 0

AddPackage sway # Tiling Wayland compositor and replacement for the i3 window manager
AddPackage swayidle # Idle management daemon for Wayland
AddPackage swaylock # Screen locker for Wayland
AddPackage kanshi # Dynamic output configuration for Wayland WMs
#AddPackage sway-git # Tiling Wayland compositor and replacement for the i3 window manager
AddPackage xorg-xwayland-git # Run X clients under Wayland (git version)
AddPackage --foreign ydotool-git # Generic command-line automation tool (no X!), works on Wayland
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland
AddPackage wob # A lightweight overlay volume/backlight/progress/anything bar for Wayland
AddPackage waybar # Highly customizable Wayland bar for Sway and Wlroots based compositors
AddPackage wayvnc # VNC server for wlroots-based Wayland compositors
AddPackage grim # Screenshot utility for Wayland
