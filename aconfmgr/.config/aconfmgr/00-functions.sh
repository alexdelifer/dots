DOTFILES=$(cd $(readlink -f $config_dir); git rev-parse --show-toplevel)

DeliferPrint () {
    echo -n "$(tput setaf 4)$(tput bold)"
    echo -n "===> $*"
    echo "$(tput sgr0)"
}

PrintConfig () {
    DeliferPrint 'CONFIG: '
    echo ${MODULES[*]}
}

DotfileLink () {
    DOTFILES=$(cd $(readlink -f $config_dir); git rev-parse --show-toplevel)

    NAME="$1"
    DOTPATH="$2"
    #echo "::: ${NAME}: DOTFILES: $(tput setaf 1)$(tput bold)${DOTPATH}$(tput sgr0)"

    if [[ ! " ${MODULES[*]} " =~ "${NAME}" ]]; then
        echo "::: ${NAME}: DOTFILES: $(tput setaf 1)$(tput bold)DISABLED$(tput sgr0)"
    else
        echo "::: ${NAME}: DOTFILES: $(tput setaf 2)$(tput bold)${DOTPATH}$(tput sgr0)"
        CreateLink "${DOTFILES}/${NAME}/${DOTPATH}" "${HOME}/${DOTPATH}" 
    fi

}

DotfileInstall () {
    DOTFILES=$(cd $(readlink -f $config_dir); git rev-parse --show-toplevel)
    cd $DOTFILES
    ${DOTFILES}/install.sh $@
    #cd -
}

# Usage:
# CheckConfig base || return 0
# If item is not enabled in the MODULES array, skip this sourced file
CheckConfig () {
    NAME="$1"
    if [[ ! " ${MODULES[*]} " =~ "${NAME}" ]]; then
        echo "::: ${NAME}: CONFIG: $(tput setaf 1)$(tput bold)DISABLED$(tput sgr0)"
        return 1
        echo "goodbye!"
    else
        echo "::: ${NAME}: CONFIG: $(tput setaf 2)$(tput bold)ENABLED$(tput sgr0)"
    fi
}

AddALHPRepo () {
    pushd /tmp

    if ! pacman -Q alhp-keyring &>/dev/null; then
        echo "alhp-keyring is NOT installed"
        gpg --recv-keys 8CA32F8BF3BC8088
        git clone https://aur.archlinux.org/alhp-keyring.git
        pushd alhp-keyring
        makepkg -si
        popd
    fi

    if ! pacman -Q alhp-mirrorlist &>/dev/null; then
        echo "alhp-mirrorlist is NOT installed"
        git clone https://aur.archlinux.org/alhp-mirrorlist.git
        pushd alhp-mirrorlist
        makepkg -si
        popd
    fi

    popd
}

AddPackage alhp-keyring # ALHP PGP keyring
AddPackage alhp-mirrorlist # ALHP mirror list for use by pacman
