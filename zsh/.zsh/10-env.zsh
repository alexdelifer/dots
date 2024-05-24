#  ______     __   __     __   __
# /\  ___\   /\ "-.\ \   /\ \ / /
# \ \  __\   \ \ \-.  \  \ \ \'/
#  \ \_____\  \ \_\\"\_\  \ \__|
#   \/_____/   \/_/ \/_/   \/_/
#
#

export VAGRANT_HOME=/games/Vagrant
export WLR_NO_HARDWARE_CURSORS=1

# Paths
PATH=$PATH:~/bin
fpath=(~/.zsh/completion $fpath)

# Fix TERM
if [ "$TERM" = "xterm-termite" ]; then
    export TERM=xterm-256color
fi 

# Enviroment Variables
export EDITOR="nvim"
export BROWSER=firefox-nightly
export TERMINAL=alacritty
export TERMINAL_COMMAND="alacritty -e"
export PAGER=less
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Fix Alacritty?
#export MESA_LOADER_DRIVER_OVERRIDE=i965 # Iris is a buggy mess

# Enable firefox multitouch
export MOZ_USE_XINPUT2=1

# VA-API X11
export MOZ_X11_EGL=1

# QT Platform Theme
export QT_QPA_PLATFORMTHEME=qt5ct


# FASD
export _Z_DATA=~/.fasd
export FZF_DEFAULT_OPTS='--height 40% --reverse --exact'
export FZF_CTRL_T_COMMAND='ag --hidden -g "" --nocolor'


# Settings
setopt auto_cd                
setopt auto_remove_slash        
setopt chase_links              
setopt correct               
setopt extended_glob        
setopt glob_dots                
setopt print_exit_value         
setopt no_flow_control
unsetopt beep
unsetopt bg_nice
unsetopt clobber
unsetopt hist_beep
# unsetopt hup                  
unsetopt ignore_eof
unsetopt list_beep
unsetopt rm_star_silent

# oh my zsh completion.zsh

unsetopt menu_complete
unsetopt flowcontrol
#setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end




# Global Menu Stuff
# export GTK_MODULES
# export UBUNTU_MENUPROXY

# AppIndicator Support 
# export XDG_CURRENT_DESKTOP=Unity



