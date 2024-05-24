#!/usr/bin/env bash

while [ true ]
do
	pscircle --background-color=1e2226 \
            --link-color-min=375143a0 \
            --link-color-max=375143 \
            --dot-color-min=7c762f \
            --dot-color-max=b56e46 \
            --tree-font-size=18 \
            --tree-font-color=94bfd1 \
            --tree-font-face="Iosevka Term" \
            --toplists-row-height=35 \
            --toplists-font-size=20 \
            --toplists-font-color=C8D2D7 \
            --toplists-pid-font-color=7B9098 \
            --toplists-font-face=".Helvetica Neue DeskInterface" \
            --toplists-bar-height=7 \
            --toplists-bar-background=444444 \
            --toplists-bar-color=7d54dd \
            --output-width=3840 \
            --output-height=2160 \
            --root-pid=1 \
            --dot-radius=3 \
            --link-convexity=0.5 \
            --output=/home/alex/Pictures/pscircle.png
    nitrogen --set-zoom-fill /home/alex/Pictures/pscircle.png
	sleep 5
done
