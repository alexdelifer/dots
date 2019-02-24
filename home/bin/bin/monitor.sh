#!/bin/bash
sudo ip link set "$@" down
sudo iwconfig "$@" mode monitor
sudo macchanger -r "$@"
sudo ip link set "$@" up
