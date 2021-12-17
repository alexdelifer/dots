#  __     ______   __  __     ______     ______     ______
# /\ \   /\__  _\ /\ \_\ \   /\  == \   /\  ___\   /\  ___\
# \ \ \  \/_/\ \/ \ \  __ \  \ \  __<   \ \  __\   \ \  __\
#  \ \_\    \ \_\  \ \_\ \_\  \ \_\ \_\  \ \_____\  \ \_____\
#   \/_/     \/_/   \/_/\/_/   \/_/ /_/   \/_____/   \/_____/

CheckConfig i3wm || return 0

AddPackage gdm # Display manager and login screen

AddPackage i3-gaps # A fork of i3wm tiling window manager with more features, including gaps
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