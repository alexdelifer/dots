#  __     ______   __  __     ______     ______     ______
# /\ \   /\__  _\ /\ \_\ \   /\  == \   /\  ___\   /\  ___\
# \ \ \  \/_/\ \/ \ \  __ \  \ \  __<   \ \  __\   \ \  __\
#  \ \_\    \ \_\  \ \_\ \_\  \ \_\ \_\  \ \_____\  \ \_____\
#   \/_/     \/_/   \/_/\/_/   \/_/ /_/   \/_____/   \/_____/

CheckConfig i3wm || return 0

AddPackage lightdm # Display manager and login screen
AddPackage lightdm-gtk-greeter # GTK+ greeter for LightDM
CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/lightdm.service

AddPackage appmenu-gtk-module # Application Menu GTK+ Module

AddPackage i3-wm # Improved dynamic tiling window manager

AddPackage i3status # Generates status bar to use with i3bar, dzen2 or xmobar
AddPackage i3status-rust # Resourcefriendly and feature-rich replacement for i3status, written in pure Rust

AddPackage hsetroot # Tool which allows you to compose wallpapers ("root pixmaps") for X. Fork by Hyriand

AddPackage alacritty # A cross-platform, GPU-accelerated terminal emulator
AddPackage autorandr # Auto-detect connected display hardware and load appropiate X11 setup using xrandr
AddPackage autotiling # Script for sway and i3 to automatically switch the horizontal / vertical window split orientation
AddPackage betterlockscreen # A simple, minimal lockscreen
AddPackage bitwarden-rofi # Wrapper for Bitwarden and Rofi
AddPackage dmenu # Generic menu for X
AddPackage j4-dmenu-desktop # A much faster replacement for i3-dmenu-desktop. Its purpose is to find .desktop files and offer you a menu to start an application using dmenu.
AddPackage lxappearance # Feature-rich GTK+ theme switcher of the LXDE Desktop
AddPackage network-manager-applet # Applet for managing network connections
AddPackage arandr # Provide a simple visual front end for XRandR 1.2.
AddPackage dunst # Customizable and lightweight notification-daemon
AddPackage rofi # A window switcher, application launcher and dmenu replacement
AddPackage rofimoji # Character picker for rofi
AddPackage scrot # Simple command-line screenshot utility for X
AddPackage thunar # Modern file manager for Xfce
AddPackage thunar-volman # Automatic management of removeable devices in Thunar
AddPackage ueberzug # Command line util which allows to display images in combination with X11
AddPackage xdotool # Command-line X11 automation tool
AddPackage xclip # Command line interface to the X11 clipboard
AddPackage xob # A lightweight volume (or anything) bar for the X Window System
AddPackage xorg-xev # Print contents of X events
AddPackage xorg-xinit # X.Org initialisation program
AddPackage xorg-xkill # Kill a client by its X resource
AddPackage xss-lock # Use external locker as X screen saver
AddPackage picom-ibhagwan-git # iBhagwan's compton|picom fork (X compositor) with dual_kawase blur and rounded corners
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage polybar # A fast and easy-to-use status bar
AddPackage flashfocus # Simple Xorg window focus animations for tiling window managers
AddPackage pasystray # PulseAudio system tray (a replacement for padevchooser)
AddPackage xcolor # Lightweight color picker for X11
AddPackage slop # Utility to query the user for a selection and print the region to stdout
AddPackage zathura # Minimalistic document viewer
AddPackage zathura-pdf-mupdf # PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)
AddPackage file-roller # Create and modify archives
AddPackage filezilla # Fast and reliable FTP, FTPS and SFTP client
AddPackage gnome-control-center # GNOME's main interface to configure various aspects of the desktop
AddPackage maim # Utility to take a screenshot using imlib2
AddPackage nautilus # Default file manager for GNOME
AddPackage vinagre # A VNC Client for the GNOME desktop


AddPackage xorg-bdftopcf # Convert X font from Bitmap Distribution Format to Portable Compiled Format
AddPackage xorg-iceauth # ICE authority file utility
AddPackage xorg-mkfontscale # Create an index of scalable font files for X
AddPackage xorg-server # Xorg X server
AddPackage xorg-sessreg # Register X sessions in system utmp/utmpx databases
AddPackage xorg-setxkbmap # Set the keyboard using the X Keyboard Extension
AddPackage xorg-smproxy # Allows X applications that do not support X11R6 session management to participate in an X11R6 session
AddPackage xorg-x11perf # Simple X server performance benchmarker
AddPackage xorg-xauth # X.Org authorization settings program
AddPackage xorg-xbacklight # RandR-based backlight control application
AddPackage xorg-xcmsdb # Device Color Characterization utility for X Color Management System
AddPackage xorg-xcursorgen # Create an X cursor file from PNG images
AddPackage xorg-xdpyinfo # Display information utility for X
AddPackage xorg-xdriinfo # Query configuration information of DRI drivers
AddPackage xorg-xgamma # Alter a monitor's gamma correction
AddPackage xorg-xhost # Server access control program for X
AddPackage xorg-xinput # Small commandline tool to configure devices
AddPackage xorg-xkbcomp # X Keyboard description compiler
AddPackage xorg-xkbevd # XKB event daemon
AddPackage xorg-xkbutils # XKB utility demos
AddPackage xorg-xlsatoms # List interned atoms defined on server
AddPackage xorg-xlsclients # List client applications running on a display
AddPackage xorg-xmodmap # Utility for modifying keymaps and button mappings
AddPackage xorg-xpr # Print an X window dump from xwd
AddPackage xorg-xprop # Property displayer for X
AddPackage xorg-xrandr # Primitive command line interface to RandR extension
AddPackage xorg-xrdb # X server resource database utility
AddPackage xorg-xrefresh # Refresh all or part of an X screen
AddPackage xorg-xset # User preference utility for X
AddPackage xorg-xsetroot # Classic X utility to set your root window background to a given pattern or color
AddPackage xorg-xvinfo # Prints out the capabilities of any video adaptors associated with the display that are accessible through the X-Video extension
AddPackage xorg-xwd # X Window System image dumping utility
AddPackage xorg-xwininfo # Command-line utility to print information about windows on an X server
AddPackage xorg-xwud # X Window System image undumping utility
