#  ______     ______     ______     ______
# /\  == \   /\  __ \   /\  ___\   /\  ___\
# \ \  __<   \ \  __ \  \ \___  \  \ \  __\
#  \ \_____\  \ \_\ \_\  \/\_____\  \ \_____\
#   \/_____/   \/_/\/_/   \/_____/   \/_____/

CheckConfig base || return 0

# Bare Minimum
AddPackage aconfmgr-git # A configuration manager for Arch Linux
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage pacman # A library-based package manager with dependency support

# Hooks
AddPackage pacman-cleanup-hook # hook to cleanup pacman cache keeping only the installed plus next most recent packages
AddPackage grub-hook # Pacman hook to update GRUB after a kernel update
AddPackage kernel-modules-hook # Keeps your system fully functional after a kernel upgrade
AddPackage needrestart # Restart daemons after library updates.
AddPackage etc-update # CLI to interactively merge .pacnew configuration files
CreateLink /etc/systemd/system/basic.target.wants/linux-modules-cleanup.service /usr/lib/systemd/system/linux-modules-cleanup.service

# bootloader
AddPackage grub # GNU GRand Unified Bootloader (2)
AddPackage os-prober # Utility to detect other OSes on a set of drives
CopyFileTo "/etc/default/grub-$(cat /etc/hostname)" "/etc/default/grub"

# meme
AddPackage cowsay # Configurable talking cow (and a few other creatures)
AddPackage figlet # A program for making large letters out of ordinary text
AddPackage lolcat # Okay, no unicorns. But rainbows!!
AddPackage cmatrix # A curses-based scrolling 'Matrix'-like screen


# cheat
AddPackage tealdeer # A fast tldr client in Rust
AddPackage cheat # Allows you to create and view interactive cheatsheets on the command-line

# why wouldnt this be here?
AddPackage stow # Manage installation of multiple softwares in the same directory tree
AddPackage neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs
AddPackage elinks # An advanced and well-established feature-rich text mode web browser.
AddPackage file # File type identification utility
AddPackage gawk # GNU version of awk
AddPackage grep # A string search utility
AddPackage ncdu # Disk usage analyzer with an ncurses interface
AddPackage sed # GNU stream editor
AddPackage sudo # Give certain users the ability to run some commands as root
AddPackage git # the fast distributed version control system
AddPackage tmux # A terminal multiplexer
AddPackage yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.
AddPackage zsh # A very advanced and programmable command interpreter (shell) for UNIX
AddPackage mlocate # Merging locate/updatedb implementation
AddPackage whois # Intelligent WHOIS client
AddPackage which # A utility to show the full path of commands
AddPackage wget # Network utility to retrieve files from the Web
AddPackage gpart # Partition table rescue/guessing tool
AddPackage findutils # GNU utilities to locate files
AddPackage screen # Full-screen window manager that multiplexes a physical terminal
AddPackage fwupd # Simple daemon to allow session software to update firmware
AddPackage inetutils # A collection of common network programs
AddPackage iperf3 # TCP, UDP, and SCTP network bandwidth measurement tool
AddPackage iproute2 # IP Routing Utilities
AddPackage iputils # Network monitoring tools, including ping
AddPackage lvm2 # Logical Volume Manager 2 utilities
AddPackage man-db # A utility for reading man pages
AddPackage man-pages # Linux man pages
AddPackage pciutils # PCI bus configuration space access library and tools
AddPackage tree # A directory listing program displaying a depth indented list of files


# shell upgrade pack :)
AddPackage neofetch # A CLI system information tool written in BASH that supports displaying images.
AddPackage bat # Cat clone with syntax highlighting and git integration
AddPackage bpytop # Resource monitor that shows usage and stats for processor, memory, disks, network and processes
AddPackage htop # Interactive process viewer
AddPackage rclone # Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage
AddPackage ripgrep # A search tool that combines the usability of ag with the raw speed of grep
AddPackage the_silver_searcher # Code searching tool similar to Ack, but faster
AddPackage pv # A terminal-based tool for monitoring the progress of data through a pipeline.
AddPackage atool # A script for managing file archives of various types
AddPackage paru # Feature packed AUR helper
AddPackage mtr # Combines the functionality of traceroute and ping into one tool (CLI version)
AddPackage fd # Simple, fast and user-friendly alternative to find
AddPackage duf # Disk Usage/Free Utility
AddPackage exa # ls replacement
AddPackage fzf # Command-line fuzzy finder

# services
AddPackage iwd # Internet Wireless Daemon
AddPackage reflector # A Python 3 module and script to retrieve and filter the latest Pacman mirror list.
AddPackage logrotate # Rotates system logs automatically
AddPackage gammastep # Adjust the color temperature of your screen according to your surroundings.

AddPackage bitwarden-cli # The command line vault
AddPackage smartmontools # Control and monitor S.M.A.R.T. enabled ATA and SCSI Hard Drives
AddPackage openbsd-netcat # TCP/IP swiss army knife. OpenBSD variant.
AddPackage xdg-user-dirs # Manage user directories like ~/Desktop and ~/Music
AddPackage wpa_supplicant # A utility providing key negotiation for WPA wireless networks

# cli utils
AddPackage rar # A command-line port of the rar compression utility
AddPackage xdg-user-dirs-gtk # Creates user dirs and asks to relocalize them
AddPackage dmidecode # Desktop Management Interface table related utilities
AddPackage downgrade # Bash script for downgrading one or more packages to a version in your cache or the A.L.A.
AddPackage gettext # GNU internationalization library
AddPackage ibus # Next Generation Input Bus for Linux
AddPackage highlight # Fast and flexible source code highlighter (CLI version)
AddPackage acpi # Client for battery, power, and thermal readings

# firmware
AddPackage linux-firmware # Firmware files for Linux
AddPackage mkinitcpio-firmware # Optional firmware for the default linux kernel to get rid of the annoying 'WARNING

# Network Manager
AddPackage networkmanager # Network connection manager and user applications
CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
CreateLink /etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service /usr/lib/systemd/system/NetworkManager-wait-online.service
CopyFile /etc/NetworkManager/conf.d/dns.conf
CopyFile /etc/resolv.conf

# ZeroTier
AddPackage zerotier-one # Creates virtual Ethernet networks of almost unlimited size.
CreateLink /etc/systemd/system/multi-user.target.wants/zerotier-one.service /etc/systemd/system/zerotier-one.service
CopyFile /etc/systemd/system/zerotier-one.service

# ZRam
AddPackage zramd # Automatically setup swap on zram ✨
CreateLink /etc/systemd/system/multi-user.target.wants/zramd.service /usr/lib/systemd/system/zramd.service
CopyFile /etc/systemd/zram-generator.conf

# OOMd
AddPackage earlyoom # Early OOM Daemon for Linux
CreateLink /etc/systemd/system/dbus-org.freedesktop.oom1.service /usr/lib/systemd/system/systemd-oomd.service
CreateLink /etc/systemd/system/multi-user.target.wants/systemd-oomd.service /usr/lib/systemd/system/systemd-oomd.service
CreateLink /etc/systemd/system/multi-user.target.wants/earlyoom.service /usr/lib/systemd/system/earlyoom.service


# openssh
AddPackage openssh
AddPackage sshpass # Fool ssh into accepting an interactive password non-interactively
CreateLink /etc/systemd/system/multi-user.target.wants/sshd.service /usr/lib/systemd/system/sshd.service
CreateLink /etc/systemd/user/sockets.target.wants/gcr-ssh-agent.socket /usr/lib/systemd/user/gcr-ssh-agent.socket

# systemd internals
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateLink /etc/systemd/system/dbus-org.freedesktop.resolve1.service /usr/lib/systemd/system/systemd-resolved.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CreateLink /etc/systemd/system/multi-user.target.wants/systemd-resolved.service /usr/lib/systemd/system/systemd-resolved.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service /usr/lib/systemd/user/xdg-user-dirs-update.service
CreateLink /etc/systemd/user/sockets.target.wants/dirmngr.socket /usr/lib/systemd/user/dirmngr.socket

# Logging
AddPackage syslog-ng # Next-generation syslogd with advanced networking and filtering capabilities
CreateLink /etc/systemd/system/multi-user.target.wants/syslog-ng@default.service /usr/lib/systemd/system/syslog-ng@.service
CreateLink /etc/systemd/system/timers.target.wants/logrotate.timer /usr/lib/systemd/system/logrotate.timer

# gpg
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-browser.socket /usr/lib/systemd/user/gpg-agent-browser.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-extra.socket /usr/lib/systemd/user/gpg-agent-extra.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-ssh.socket /usr/lib/systemd/user/gpg-agent-ssh.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent.socket /usr/lib/systemd/user/gpg-agent.socket
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket

# Fuse
CopyFile /etc/fuse.conf
CopyFile /etc/fuse.original.conf

# pacman
CopyFile /etc/pacman.conf
CopyFile /etc/pacman.d/mirrorlist

# sysctl
CopyFile /etc/sysctl.d/10-network-tuning.conf
CopyFile /etc/sysctl.d/20-ping.conf

# fancy issue
CopyFile /etc/issue

# basic shit
CopyFileTo /etc/hostname-$(cat /etc/hostname) /etc/hostname
CopyFileTo /etc/hosts-$(cat /etc/hostname) /etc/hosts

CopyFile /etc/vconsole.conf

CopyFile /etc/skel/.bashrc
CopyFile /etc/skel/.config/dconf/user
CopyFile /etc/skel/.config/gtk-3.0/bookmarks
CopyFile /etc/skel/.config/gtk-3.0/settings.ini
CopyFile /etc/skel/.config/terminator/config
CopyFile /etc/skel/.face
CopyFile /etc/skel/.xinitrc
CopyFile /etc/skel/.zshrc

CopyFile /etc/locale.conf
CopyFile /etc/locale.gen
CreateLink /etc/localetime /usr/share/zoneinfo/America/Toronto
CreateLink /etc/localtime ../usr/share/zoneinfo/America/Toronto

CopyFile /etc/mailcap
CopyFile /etc/mime.types
CreateLink /etc/os-release ../usr/lib/os-release

CreateFile /etc/.pwd.lock 600 > /dev/null
CopyFile /etc/.updated
CopyFile /etc/adjtime
CopyFile /etc/dconf/db/ibus
CopyFile /etc/gconf/gconf.xml.defaults/%gconf-tree.xml
