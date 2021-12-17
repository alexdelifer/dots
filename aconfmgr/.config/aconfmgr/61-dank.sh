#  _____     ______     ______     __  __     ______   ______     ______
# /\  __-.  /\  ___\   /\  ___\   /\ \/ /    /\__  _\ /\  __ \   /\  == \
# \ \ \/\ \ \ \  __\   \ \___  \  \ \  _"-.  \/_/\ \/ \ \ \/\ \  \ \  _-/
#  \ \____-  \ \_____\  \/\_____\  \ \_\ \_\    \ \_\  \ \_____\  \ \_\
#   \/____/   \/_____/   \/_____/   \/_/\/_/     \/_/   \/_____/   \/_/

CheckHostname dank dank || return 0

CopyFile /etc/udev/rules.d/usb-power.rules

CreateLink /etc/systemd/system/multi-user.target.wants/restart-gdm-on-boot.service /etc/systemd/system/restart-gdm-on-boot.service
CopyFile /etc/systemd/system/restart-gdm-on-boot.service
