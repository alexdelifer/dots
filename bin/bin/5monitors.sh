#!/bin/sh

# set resolutions and pos
xrandr \
    --output DP-0 --mode 2560x1440 --pos 0x1080 --rotate normal \
    --output DP-1 --off --output HDMI-0 --off \
    --output DP-2 --mode 1920x1080 --pos 5120x1080 --rotate normal \
    --output DP-3 --off \
    --output DP-4 --primary --mode 2560x1440 --pos 2560x1080 --rotate normal \
    --output DP-5 --off \
    --output DP-1-1 --mode 1920x1080 --pos 640x0 --rotate normal \
    --output HDMI-1-1 --off \
    --output HDMI-1-2 --mode 1920x1080 --pos 5120x0 --rotate normal

# set refresh rate and xcomposite settings
nvidia-settings --load-config-only
