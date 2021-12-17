PrintConfig () {
    echo -n "$(tput setaf 4)$(tput bold)"
    echo -n "::: DESKTOP: "
    echo -n "$(tput sgr0)"
    echo $DESKTOP_HOSTNAME
    echo -n "$(tput setaf 4)$(tput bold)"
    echo -n "::: LAPTOP: "
    echo -n "$(tput sgr0)"
    echo $LAPTOP_HOSTNAME
    echo -n "$(tput setaf 4)$(tput bold)"
    echo -n "::: CONFIG: "
    echo -n "$(tput sgr0)"
    echo ${MODULES[*]}
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

CheckHostname () {
    NAME="$1"
    CHK_HOSTNAME="$2"
    HOSTNAME="$(cat /etc/hostname)"
    if [[ ! "${HOSTNAME}" =~ "${CHK_HOSTNAME}" ]]; then
        echo "::: ${NAME}: HOSTNAME: $(tput setaf 3)$(tput bold)NOT DETECTED$(tput sgr0)"
        return 1
        echo "goodbye!"
    else
        echo "::: ${NAME}: HOSTNAME: $(tput setaf 2)$(tput bold)DETECTED$(tput sgr0)"
    fi
}

CheckNvidiaGPU() {
    NAME="$1"
    NVIDIA=$(lspci | grep ' NVIDIA ')
    if [ -z "$NVIDIA" ]; then
        echo "::: ${NAME}: HARDWARE: $(tput setaf 3)$(tput bold)NOT FOUND$(tput sgr0)"
        return 1
    else
        echo "::: nvidia: HARDWARE: $(tput setaf 2)$(tput bold)DETECTED$(tput sgr0)"
    fi
}

CheckIntelGPU() {
    NAME="$1"
    INTEL=$(lspci | grep ' Intel Corporation HD Graphics ')
    if [ -z "$INTEL" ]; then
        echo "::: ${NAME}: HARDWARE: $(tput setaf 3)$(tput bold)NOT FOUND$(tput sgr0)"
        return 1
    else
        echo "::: ${NAME}: HARDWARE: $(tput setaf 2)$(tput bold)DETECTED$(tput sgr0)"
    fi
}

CheckBtrfs() {
    NAME="$1"
    BTRFS=$(/usr/bin/lsblk -f | grep btrfs)
    if [ -z "$BTRFS" ]; then
        echo "::: ${NAME}: FILESYSTEM: $(tput setaf 3)$(tput bold)NOT FOUND$(tput sgr0)"
        return 1
    else
        echo "::: ${NAME}: FILESYSTEM: $(tput setaf 2)$(tput bold)DETECTED$(tput sgr0)"
    fi
}

CheckZfs() {
    NAME="$1"
    ZFS=$(/usr/bin/lsblk -f | grep zfs)
    if [ -z "$ZFS" ]; then
        echo "::: ${NAME}: FILESYSTEM: $(tput setaf 3)$(tput bold)NOT FOUND$(tput sgr0)"
        return 1
    else
        echo "::: ${NAME}: FILESYSTEM: $(tput setaf 2)$(tput bold)DETECTED$(tput sgr0)"
    fi
}