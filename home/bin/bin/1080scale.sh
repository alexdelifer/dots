#!/bin/bash
# 3200x1800 + 1920x1080 + 2x2
#  A    B      C    D     E F
# --panning (CxE)x(DxF)+A+0(0 height offset)
# --scale ExF
# --right-of

xrandr --output eDP-1 \
	--auto \
	--output HDMI-1 \
	--auto \
	--panning 3840x2160+3200+0 \
	--scale 2x2 --right-of eDP-1

nitrogen --restore
pkill compton
compton -b &
