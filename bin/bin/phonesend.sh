#!/bin/bash
# send to signal
s me "$1"
# sent to phone directly if kdeconnect is reachable
mconnectctl share-url /org/mconnect/device/0 "$1"
notify-send "phonesend.sh -> \"$1\""
