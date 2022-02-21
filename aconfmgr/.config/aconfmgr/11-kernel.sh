#  __  __     ______     ______     __   __     ______     __
# /\ \/ /    /\  ___\   /\  == \   /\ "-.\ \   /\  ___\   /\ \
# \ \  _"-.  \ \  __\   \ \  __<   \ \ \-.  \  \ \  __\   \ \ \____
#  \ \_\ \_\  \ \_____\  \ \_\ \_\  \ \_\\"\_\  \ \_____\  \ \_____\
#   \/_/\/_/   \/_____/   \/_/ /_/   \/_/ \/_/   \/_____/   \/_____/
#

CheckConfig kernel || return 0

# vanilla kernels, see gaming for performance kernels
AddPackage linux-lts # The LTS Linux kernel and modules
AddPackage linux-lts-headers # Headers and scripts for building modules for the LTS Linux kernel

CopyFile /etc/mkinitcpio.d/linux-lts.preset

# tools
AddPackage efibootmgr # Linux user-space application to modify the EFI Boot Manager

# mkinitcpio configs
CopyFileTo /etc/mkinitcpio-$(cat /etc/hostname).conf /etc/mkinitcpio.conf

