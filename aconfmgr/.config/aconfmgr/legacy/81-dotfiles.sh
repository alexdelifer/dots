PrintConfig


DOTFILES=$(cd $(readlink -f $config_dir); git rev-parse --show-toplevel)
echo "$(tput setaf 4)$(tput bold):: DOTFILES$(tput sgr0)"

i3wm=(
    i3
    dunst
    picom
    xob
    autorandr
    flashfocus
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
    btop
    cava
    ranger
    zathura
)

graphical=(
    alacritty
    firefox
    fonts
    gtk
    icons
    mpv
    rofi
)

personal=(
    git
    bin
    ncmpcpp
    cloudflare
)

if [ ! $aconfmgr_action == "apply" ]; then
    echo "Not Applying"
    return
fi

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
