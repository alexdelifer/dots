#  __  __     ______     ______     __   __     ______     __
# /\ \/ /    /\  ___\   /\  == \   /\ "-.\ \   /\  ___\   /\ \
# \ \  _"-.  \ \  __\   \ \  __<   \ \ \-.  \  \ \  __\   \ \ \____
#  \ \_\ \_\  \ \_____\  \ \_\ \_\  \ \_\\"\_\  \ \_____\  \ \_____\
#   \/_/\/_/   \/_____/   \/_/ /_/   \/_/ \/_/   \/_____/   \/_____/
#

CheckConfig kernel || return 0

# kernels
AddPackage linux # The Linux kernel and modules
AddPackage linux-headers # Headers and scripts for building modules for the Linux kernel

AddPackage linux-xanmod-tt # The Linux kernel and modules with Xanmod patches
AddPackage linux-xanmod-tt-headers # Headers and scripts for building modules for the Linux Xanmod. Development branch with the Task Type CPU Scheduler by Hamad Al Marri kernel
AddPackage linux-zen # The Linux ZEN kernel and modules
AddPackage linux-zen-headers # Headers and scripts for building modules for the Linux ZEN kernel


# tools
AddPackage efibootmgr # Linux user-space application to modify the EFI Boot Manager

# mkinitcpio configs
CopyFileTo /etc/mkinitcpio-$(cat /etc/hostname).conf /etc/mkinitcpio.conf
CopyFile /etc/mkinitcpio.d/linux-xanmod-tt.preset
CopyFile /etc/mkinitcpio.d/linux-zen.preset
CopyFile /etc/mkinitcpio.d/linux.preset
