#!/bin/bash

#
# a simple way to parse shell script arguments
# 
# please edit and use to your hearts content
# 


#ENVIRONMENT="dev"
#DB_PATH="/data/db"
MYBROWSER="google-chrome"
MYTERM="alacritty"
function usage()
{
    echo "if this was a real script you would see something useful here"
    echo ""
    echo "./open.sh"
    echo "\t-h --help"
    echo ""
}
function mpvimage()
{
    mpv --geometry=50% --loop=inf "$@" &
}

notify-send "Opening $@"

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        # MPV
        *://www.youtube.com/* | \
        *://youtu.be/* | \
        *twitch.tv*)
            mpv "$@" &
            ;;
        *.gif|*.gifv | \
        *gfycat*)
            #mpv --geometry=50% --loop=inf "$@" &
            mpvimage "$@"
            ;;
        *.JPG|*.JPEG|*.jpg|*.jpeg|*.png|*.PNG|\
                *redditmedia.com*|*redd.it*)
            mpvimage "$@"
            #mpv --geometry=50% --loop=inf "$@" &
            ;;
        *reddit.com*)
            $MYTERM rtv "$@" &
            ;;
        *.doc|*.docx)
            ~/bin/winword "$@" &
            ;;
        *.csv|*.xlsx)
            ~/bin/excel "$@" &
            ;;
        *.pdf)
            zathura "$@" &
            ;;
        # Fallbacks
        http*|*.html|*.com|*.ca)
            "$MYBROWSER" "$@" &
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            echo "When in doubt, use mpv..."
            mpv "$@" &
            ;;
    esac
    shift
done

echo "Bye!" | lolcat
#echo "ENVIRONMENT is $ENVIRONMENT";
#echo "DB_PATH is $DB_PATH";
