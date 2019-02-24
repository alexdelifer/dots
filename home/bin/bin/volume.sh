#!/bin/sh
amixer -D pulse sset Master 5%"$1";amixer -D pulse sset Master unmute
pkill -RTMIN+10 i3blocks
