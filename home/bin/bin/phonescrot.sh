#!/bin/bash
scrot "$1" /tmp/phonescrot.png
"$2"-signal.sh -a /tmp/phonescrot.png -m ""
rm /tmp/phonescrot.png
