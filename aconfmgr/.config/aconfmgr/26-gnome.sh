AddPackage cheese # Take photos and videos with your webcam, with fun graphical effects
AddPackage file-roller # Create and modify archives
AddPackage gedit # GNOME Text Editor
AddPackage eog # Eye of Gnome: An image viewing and cataloging program
AddPackage gnome-firmware # Manage firmware on devices supported by fwupd
AddPackage gnome-terminal # The GNOME Terminal Emulator
AddPackage gnome-video-effects # Collection of GStreamer effects for GNOME
AddPackage seahorse # GNOME application for managing PGP keys.
AddPackage vinagre # A VNC Client for the GNOME desktop
AddPackage ibus # Intelligent input bus for Linux/Unix

CreateLink /etc/udev/rules.d/61-gdm.rules /dev/null
CopyFile /etc/dconf/db/gdm
CopyFile /etc/dconf/db/gdm.d/95-gdm-settings
CopyFile /etc/dconf/profile/gdm