#  _____     ______     ______     __  __     ______   ______     ______
# /\  __-.  /\  ___\   /\  ___\   /\ \/ /    /\__  _\ /\  __ \   /\  == \
# \ \ \/\ \ \ \  __\   \ \___  \  \ \  _"-.  \/_/\ \/ \ \ \/\ \  \ \  _-/
#  \ \____-  \ \_____\  \/\_____\  \ \_\ \_\    \ \_\  \ \_____\  \ \_\
#   \/____/   \/_____/   \/_____/   \/_/\/_/     \/_/   \/_____/   \/_/

CheckHostname dank dank || return 0

CopyFile /etc/udev/rules.d/usb-power.rules

CopyFile /etc/systemd/system/restart-lightdm-on-boot.service



CreateLink /etc/systemd/system/hibernate.target /dev/null
CreateLink /etc/systemd/system/suspend.target /dev/null
