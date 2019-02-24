#  ______     __   __     __   __
# /\  ___\   /\ "-.\ \   /\ \ / /
# \ \  __\   \ \ \-.  \  \ \ \'/
#  \ \_____\  \ \_\\"\_\  \ \__|
#   \/_____/   \/_/ \/_/   \/_/
#
# AppMenu Garbage


if [ -z "$UBUNTU_MENUPROXY" ]; then
    UBUNTU_MENUPROXY=1
fi

if [ "$TERM" = "xterm-termite" ]; then
    export TERM=xterm-256color
fi 


export GTK_MODULES
export UBUNTU_MENUPROXY

# Enviroment Variables
export CLICOLOR=1 #what is this from again?
export EDITOR="vim"
export BROWSER=firefox
export TERMINAL=alacritty
export PAGER=less

fpath=(~/.zsh/completion $fpath)

# begin hidpi hell
#export QT_AUTO_SCREEN_SCALE_FACTOR=-1 
export QT_QPA_PLATFORMTHEME=gtk2 
#export GDK_SCALE=2 
#export GDK_DPI_SCALE=-1 
#export XCURSOR_SIZE=48 
export WINIT_HIDPI_FACTOR=1.0

export _Z_DATA=~/.fasd
#export LANG="en_US"
#export LC_ALL="en_US.UTF-8"
export FZF_DEFAULT_OPTS='--height 40% --reverse --exact'
export FZF_CTRL_T_COMMAND='ag --hidden -g "" --nocolor'

# Have less display colours
# from: https://wiki.archlinux.org/index.php/Color_output_in_console#man
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

[ -f /usr/bin/source-highlight-esc.sh ] && export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s" 
export LESS='-R '

#if [[ -n $TMUX ]]; then
#       export FZF_TMUX=1
#fi

# Vi Mode
set -o vi

# History
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=1024                   # big history
SAVEHIST=1024                   # big history
setopt append_history           
setopt hist_ignore_all_dups     
unsetopt hist_ignore_space      
setopt hist_reduce_blanks       
setopt hist_verify              
setopt inc_append_history      
setopt share_history            
setopt bang_hist                

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


eval $(dircolors -b $HOME/.dircolors)

#ls_colors="~/dotfiles/src/even-better-ls/ls_colors_generator.py"
#[ -f "$ls_colors" ] && export LS_COLORS=$($ls_colors)


