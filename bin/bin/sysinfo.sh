#!/usr/bin/zsh

echo "BTRFS Usage: "
btrfs fi df -h /

echo ""

echo -n "PulseAudio Volume: "
pulsemixer --get-volume

