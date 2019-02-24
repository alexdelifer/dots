#!/bin/bash
delifer=true
if [ -z "$1" ];then
        stream="https://radio.delifer.ca/mopidy"
else
        stream="$1"
        delifer=false
fi
tcat="cat"
if [ -f "/usr/bin/lolcat" ]; then
        tcat="lolcat"
fi
if [ $delifer ]; then
        test
fi

$tcat << "EOF"
   __     __  __     __  __     ______
  /\ \   /\ \/\ \   /\ \/ /    /\  ___\
 _\_\ \  \ \ \_\ \  \ \  _"-.  \ \  __\
/\_____\  \ \_____\  \ \_\ \_\  \ \_____\
\/_____/   \/_____/   \/_/\/_/   \/_____/
EOF
#echo "Stream: $stream" | "$tcat"
echo -n "Using: "
which mpv
if [ "$?" = "1" ]; then
        echo -n "Then let's try: "
        which mplayer
        if [ "$?" = "1"]; then
                echo "mpv is the answer <3"
                sudo pacman -S mpv youtube-dl lolcat
                echo "run me again!"
                exit
        else
                mplayer -playlist "$stream"
        fi

else
        echo "Press [ENTER] to restart stream." | "$tcat"
        mpv --loop-playlist --quiet --input-ipc-server=/tmp/mpvsocket "$stream"
fi

# I wonder if we can sneak lolcat in...
# Always read what you source
