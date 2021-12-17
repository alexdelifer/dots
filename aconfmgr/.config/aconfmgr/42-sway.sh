#  ______     __     __     ______     __  __
# /\  ___\   /\ \  _ \ \   /\  __ \   /\ \_\ \
# \ \___  \  \ \ \/ ".\ \  \ \  __ \  \ \____ \
#  \/\_____\  \ \__/".~\_\  \ \_\ \_\  \/\_____\
#   \/_____/   \/_/   \/_/   \/_/\/_/   \/_____/

CheckConfig sway || return 0

AddPackage kanshi # Dynamic output configuration for Wayland WMs
AddPackage sway-git # Tiling Wayland compositor and replacement for the i3 window manager
AddPackage xorg-xwayland-git # Run X clients under Wayland (git version)
