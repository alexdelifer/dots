CheckConfig bluetooth || return 0

# bluetooth
AddPackage blueman # GTK+ Bluetooth Manager
AddPackage bluetooth-support # Metapkg containing needed packages for using Bluetooth
AddPackage bluez-hid2hci # Put HID proxying bluetooth HCI's into HCI mode
AddPackage bluez-tools # A set of tools to manage Bluetooth devices for Linux
AddPackage bluez-utils # Development and debugging utilities for the bluetooth protocol stack
CreateLink /etc/systemd/system/bluetooth.service.wants/bluetooth-autoconnect.service /usr/lib/systemd/system/bluetooth-autoconnect.service
CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/user/pulseaudio.service.wants/pulseaudio-bluetooth-autoconnect.service /usr/lib/systemd/user/pulseaudio-bluetooth-autoconnect.service
