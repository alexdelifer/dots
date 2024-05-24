CheckHostname bepis bepis || return 0

AddPackage fprintd-libfprint2 # D-Bus service to access fingerprint readers
AddPackage xf86-input-libinput # Generic input driver for the X.Org server based on libinput
AddPackage xf86-input-wacom # X.Org Wacom tablet driver
AddPackage thermald # The Linux Thermal Daemon program from 01.org
AddPackage xournalpp # Handwriting notetaking software with PDF annotation support
AddPackage intel-undervolt # Intel CPU undervolting tool

AddPackage tlp # Linux Advanced Power Management
CopyFile /etc/tlp.conf
CreateLink /etc/systemd/system/multi-user.target.wants/tlp.service /usr/lib/systemd/system/tlp.service

AddPackage throttled # Workaround for Intel throttling issues in Linux.
CopyFile /etc/systemd/system/lenovo_fix.service
CopyFile /etc/lenovo_fix.conf

# powertop
AddPackage powertop # A tool to diagnose issues with power consumption and power management
CopyFile /etc/systemd/system/powertop.service
CreateLink /etc/systemd/system/multi-user.target.wants/powertop.service /etc/systemd/system/powertop.service


AddPackage cpupower # Linux kernel tool to examine and tune power saving related features of your processor
CreateLink /etc/systemd/system/multi-user.target.wants/cpupower.service /usr/lib/systemd/system/cpupower.service

AddPackage plymouth-git # A graphical boot splash screen with kernel mode-setting support (Development version)
CopyFile /etc/plymouth/plymouthd.conf


CopyFile /etc/udev/rules.d/40-thunderbolt.rules
