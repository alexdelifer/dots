PrintConfig

if [ ! $aconfmgr_action == "apply" ]; then
    echo "Not Applying"
    return
fi

DOTFILES=$(cd $(readlink -f $config_dir); git rev-parse --show-toplevel)
echo "$(tput setaf 4)$(tput bold):: DOTFILES$(tput sgr0)"

#DotfileLink "i3" ".config/i3"
#DotfileLink "i3" ".config/i3status"
#DotfileLink "i3" ".config/i3status-rust"

i3wm=(
    i3
    dunst
    picom
    xob
)

sway=(
    sway
    kanshi
    mako
    slop
)

base=(
    figlet
    htop
    nvim
    terminfo
    tmux
    zsh
)

graphical=(
    alacritty
    firefox
    fonts
    gtk-3.0
    icons
    mpv
    rofi
)

personal=(
    git
    bin
    ncmpcpp
    ranger
)

# if any wm is enabled
echo "$(tput setaf 4)$(tput bold)::: GRAPHICAL$(tput sgr0)"
CheckConfig i3 || CheckConfig sway || CheckConfig gnome && \
    DotfileInstall ${graphical[@]}

echo "$(tput setaf 4)$(tput bold)::: i3wm$(tput sgr0)"
CheckConfig i3 && DotfileInstall ${i3wm[@]}
echo "$(tput setaf 4)$(tput bold)::: sway$(tput sgr0)"
CheckConfig sway && DotfileInstall ${sway[@]}
echo "$(tput setaf 4)$(tput bold)::: BASE$(tput sgr0)"
CheckConfig base && DotfileInstall ${base[@]}
echo "$(tput setaf 4)$(tput bold)::: PERSONAL$(tput sgr0)"
CheckConfig personal && DotfileInstall ${personal[@]}

# go back to where we were
