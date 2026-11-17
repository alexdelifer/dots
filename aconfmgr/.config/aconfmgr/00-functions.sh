DOTFILES=$(cd $(readlink -f $config_dir); git rev-parse --show-toplevel)

DeliferPrint () {
    echo -n "$(tput setaf 4 2>/dev/null || true)$(tput bold 2>/dev/null || true)"
    echo -n "===> $*"
    echo "$(tput sgr0 2>/dev/null || true)"
}

PrintConfig () {
    DeliferPrint 'CONFIG: '
    echo ${MODULES[*]}
}

DotfileLink () {
    DOTFILES=$(cd $(readlink -f $config_dir); git rev-parse --show-toplevel)

    NAME="$1"
    DOTPATH="$2"
    #echo "::: ${NAME}: DOTFILES: $(tput setaf 1 2>/dev/null || true)$(tput bold 2>/dev/null || true)${DOTPATH}$(tput sgr0 2>/dev/null || true)"

    if [[ ! " ${MODULES[*]} " =~ "${NAME}" ]]; then
        echo "::: ${NAME}: DOTFILES: $(tput setaf 1 2>/dev/null || true)$(tput bold 2>/dev/null || true)DISABLED$(tput sgr0 2>/dev/null || true)"
    else
        echo "::: ${NAME}: DOTFILES: $(tput setaf 2 2>/dev/null || true)$(tput bold 2>/dev/null || true)${DOTPATH}$(tput sgr0 2>/dev/null || true)"
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
        echo "::: ${NAME}: CONFIG: $(tput setaf 1 2>/dev/null || true)$(tput bold 2>/dev/null || true)DISABLED$(tput sgr0 2>/dev/null || true)"
        return 1
        echo "goodbye!"
    else
        echo "::: ${NAME}: CONFIG: $(tput setaf 2 2>/dev/null || true)$(tput bold 2>/dev/null || true)ENABLED$(tput sgr0 2>/dev/null || true)"
    fi
}
