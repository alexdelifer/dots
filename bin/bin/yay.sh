#!/usr/bin/env bash

# Use yay-bin so we don't need go deps
YAYURL="https://aur.archlinux.org/yay-bin.git"
YAYPATH="/tmp/yay"

if $(git clone "$YAYURL" "$YAYPATH"); then
    cd "$YAYPATH"
    makepkg -si
    rm -rf "$YAYPATH"
    echo "See you later ;)"
else
    which git
fi

