# Disable access control for the current user.
xhost +SI:localuser:$USER

# Make Java applications aware this is a non-reparenting window manager.
export _JAVA_AWT_WM_NONREPARENTING=1

# Set default cursor.
xsetroot -cursor_name left_ptr

# Set keyboard repeat rate.
# Too fast 5 me
# xset r rate 200 60

# Remap caps to super for easy pressing
setxkbmap -option caps:super 

# Uncomment the following block to use the exwm-xim module.
export XMODIFIERS=@im=exwm-xim
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
export CLUTTER_IM_MODULE=xim

# If Emacs is started in server mode, `emacsclient` is a convenient way to edit
# files in place (used by e.g. `git commit`)
export VISUAL=emacsclient
export EDITOR="$VISUAL"

nm-applet &
blueman-applet &
kdeconnect-indicator &
sxhkd &
compton &


# Finally start Emacs
exec emacs
