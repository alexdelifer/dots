#!/bin/bash
# send to signal
s me "$2"
# sent to phone directly if kdeconnect is reachable
mconnectctl "$1" /org/mconnect/device/0 "$2"
notify-send "$2 sent to my phone."
