#!/bin/bash

COMMAND="$*"

# Wayland gamescope
#COMMAND="gamescope -w 2560 -h 1440 -b -r 60 -- $COMMAND"

# NVIDIA Prime-run
COMMAND="prime-run $COMMAND"

# Feral gamemode
COMMAND="gamemoderun $COMMAND"


echo $COMMAND

eval "$COMMAND"

