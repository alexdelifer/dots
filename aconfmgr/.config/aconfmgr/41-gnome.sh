#  ______     __   __     ______     __    __     ______
# /\  ___\   /\ "-.\ \   /\  __ \   /\ "-./  \   /\  ___\
# \ \ \__ \  \ \ \-.  \  \ \ \/\ \  \ \ \-./\ \  \ \  __\
#  \ \_____\  \ \_\\"\_\  \ \_____\  \ \_\ \ \_\  \ \_____\
#   \/_____/   \/_/ \/_/   \/_____/   \/_/  \/_/   \/_____/

CheckConfig gnome || return 0

AddPackage gnome-backgrounds # Background images and data for GNOME
AddPackage gnome-books # Access and organize your e-books on GNOME
AddPackage gnome-boxes # Simple GNOME application to access virtual systems
AddPackage gnome-calculator # GNOME Scientific calculator
AddPackage gnome-calendar # Simple and beautiful calendar application designed to perfectly fit the GNOME desktop
AddPackage gnome-characters # A character map application
AddPackage gnome-clocks # Clocks applications for GNOME
AddPackage gnome-color-manager # GNOME Color Profile Tools
AddPackage gnome-contacts # Contacts Manager for GNOME
AddPackage gnome-control-center # GNOME's main interface to configure various aspects of the desktop
AddPackage gnome-disk-utility # Disk Management Utility for GNOME
AddPackage gnome-firmware # Manage firmware on devices supported by fwupd
AddPackage gnome-font-viewer # A font viewer utility for GNOME
AddPackage gnome-keyring # Stores passwords and encryption keys
AddPackage gnome-logs # A log viewer for the systemd journal
AddPackage gnome-maps # A simple GNOME 3 maps application
AddPackage gnome-menus # GNOME menu specifications
AddPackage gnome-music # Music player and management application
AddPackage gnome-packagekit # Collection of graphical tools for PackageKit to be used in the GNOME desktop
AddPackage gnome-photos # Access, organize, and share your photos on GNOME
AddPackage gnome-remote-desktop # GNOME Remote Desktop server
AddPackage gnome-screenshot # Take pictures of your screen
AddPackage gnome-session # The GNOME Session Handler
AddPackage gnome-settings-daemon # GNOME Settings Daemon
AddPackage gnome-shell # Next generation desktop shell
AddPackage gnome-shell-extension-dash-to-dock # Move the dash out of the overview transforming it in a dock
AddPackage gnome-shell-extensions # Extensions for GNOME shell, including classic mode
AddPackage gnome-software # GNOME Software Tools
AddPackage gnome-software-packagekit-plugin # PackageKit support plugin for GNOME Software
AddPackage gnome-system-monitor # View current processes and monitor system state
AddPackage gnome-themes-extra # Extra Themes for GNOME Applications
AddPackage gnome-tweaks # Graphical interface for advanced GNOME 3 settings (Tweak Tool)
AddPackage gnome-user-docs # User documentation for GNOME
AddPackage gnome-user-share # Easy to use user-level file sharing for GNOME
AddPackage gnome-video-effects # Collection of GStreamer effects for GNOME
AddPackage gnome-weather # Access current weather conditions and forecasts
AddPackage chrome-gnome-shell # Native browser connector for integration with extensions.gnome.org
AddPackage epiphany # A GNOME web browser based on the WebKit rendering engine
AddPackage gvfs # Virtual filesystem implementation for GIO
AddPackage gvfs-afc # Virtual filesystem implementation for GIO (AFC backend; Apple mobile devices)
AddPackage gvfs-goa # Virtual filesystem implementation for GIO (Gnome Online Accounts backend; cloud storage)
AddPackage gvfs-google # Virtual filesystem implementation for GIO (Google Drive backend)
AddPackage gvfs-gphoto2 # Virtual filesystem implementation for GIO (gphoto2 backend; PTP camera, MTP media player)
AddPackage gvfs-mtp # Virtual filesystem implementation for GIO (MTP backend; Android, media player)
AddPackage gvfs-nfs # Virtual filesystem implementation for GIO (NFS backend)
AddPackage gvfs-smb # Virtual filesystem implementation for GIO (SMB/CIFS backend; Windows client)
AddPackage nautilus # Default file manager for GNOME
AddPackage appmenu-gtk-module # Application Menu GTK+ Module
AddPackage eog # Eye of Gnome
AddPackage gedit # GNOME Text Editor
AddPackage mutter # A window manager for GNOME
AddPackage totem # Movie player for the GNOME desktop based on GStreamer
AddPackage vino # A VNC server for the GNOME desktop
AddPackage yelp # Get help with GNOME
AddPackage --foreign gnome-shell-extension-gsconnect-git # KDE Connect implementation with GNOME Shell integration
AddPackage evince # Document viewer (PDF, PostScript, XPS, djvu, dvi, tiff, cbr, cbz, cb7, cbt)
AddPackage seahorse-nautilus # PGP encryption and signing for nautilus
AddPackage file-roller # Create and modify archives
AddPackage cheese # Take photos and videos with your webcam, with fun graphical effects
AddPackage gdm # Display manager and login screen
AddPackage garcon # Implementation of the freedesktop.org menu specification
AddPackage gksu # A graphical frontend for su
AddPackage sushi # A quick previewer for Nautilus
AddPackage python-nautilus # Python bindings for the Nautilus Extension API
AddPackage orca # Screen reader for individuals who are blind or visually impaired
AddPackage rygel # UPnP AV MediaServer and MediaRenderer
AddPackage tracker # Desktop-neutral user information store, search tool and indexer
AddPackage tracker-miners # Collection of data extractors for Tracker/Nepomuk
AddPackage tracker3-miners # Collection of data extractors for Tracker/Nepomuk
AddPackage tumbler # D-Bus service for applications to request thumbnails
AddPackage libdbusmenu-gtk3 # Library for passing menus over DBus (GTK+ 3 library)
AddPackage grilo-plugins # A collection of plugins for the Grilo framework
AddPackage gimp # GNU Image Manipulation Program


#CopyFile /etc/gdm/custom.conf
