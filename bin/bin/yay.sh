#!/bin/sh

# Use yay-bin so we don't need go deps
YAYURL="https://aur.archlinux.org/yay-bin.git"
TMPPATH="/tmp/yay"

if [ -f "$(which yay)" ]; then
        echo "YAY!"
        exit
fi

echo "yay not in PATH, installing now."

if $(git clone "$YAYURL" "$TMPPATH"); then
    cd "$TMPPATH"
    makepkg -si
    rm -rf "$TMPPATH"
else
    which git
fi

echo "See you later ;)"

