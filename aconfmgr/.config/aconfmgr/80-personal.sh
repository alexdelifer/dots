#  ______   ______     ______     ______     ______     __   __     ______     __
# /\  == \ /\  ___\   /\  == \   /\  ___\   /\  __ \   /\ "-.\ \   /\  __ \   /\ \
# \ \  _-/ \ \  __\   \ \  __<   \ \___  \  \ \ \/\ \  \ \ \-.  \  \ \  __ \  \ \ \____
#  \ \_\    \ \_____\  \ \_\ \_\  \/\_____\  \ \_____\  \ \_\\"\_\  \ \_\ \_\  \ \_____\
#   \/_/     \/_____/   \/_/ /_/   \/_____/   \/_____/   \/_/ \/_/   \/_/\/_/   \/_____/

CheckConfig personal || return 0

AddPackage delifer-repo # Pacman repo delifer systems

# gui apps
AddPackage dolphin-emu # A Gamecube / Wii / Triforce emulator
AddPackage simple-scan # Simple scanning utility
AddPackage neovide-bin # No Nonsense Neovim Client in Rust (prebuilt)
AddPackage gparted # A Partition Magic clone, frontend to GNU Parted
AddPackage scrcpy # Display and control your Android device
AddPackage spacefm-git # Multi-panel tabbed file manager
AddPackage baobab # A graphical directory tree analyzer
AddPackage pavucontrol # PulseAudio Volume Control
AddPackage kitty # A modern, hackable, featureful, OpenGL-based terminal emulator
AddPackage veracrypt # Disk encryption with strong security based on TrueCrypt

# editor
AddPackage visual-studio-code-bin # Visual Studio Code (vscode)
AddPackage obsidian # Obsidian is a powerful knowledge base that works on top of a local folder of plain text Markdown files

# chat
AddPackage signal-desktop # Signal Private Messenger for Linux
AddPackage discord # All-in-one voice and text chat for gamers that's free and secure.

# browser
AddPackage firefox # Standalone web browser from mozilla.org
AddPackage google-chrome # The popular and trusted web browser by Google (Stable Channel)

# media
AddPackage mpv # a free, open source, and cross-platform media player
AddPackage vlc # Multi-platform MPEG, VCD/DVD, and DivX player
AddPackage plex-media-player # Next generation Plex Desktop Client
AddPackage plexamp-appimage # Modern music client for Plex
AddPackage spotify # A proprietary music streaming service
AddPackage spotify-tui # Spotify client for the terminal written in Rust
AddPackage projectm # Music visualizer which uses 3D accelerated iterative image based rendering
AddPackage projectm-pulseaudio # Music visualizer which uses 3D accelerated iterative image based rendering (pulseaudio)

# torrent
AddPackage transmission-cli # Fast, easy, and free BitTorrent client (CLI tools, daemon and web client)
AddPackage transmission-gtk # Fast, easy, and free BitTorrent client (GTK+ GUI)

# wine
AddPackage wine # A compatibility layer for running Windows programs
AddPackage crossover # Run Windows Programs on Linux

# obs
AddPackage obs-backgroundremoval # Background removal plugin for OBS studio (precomopiled onnxruntime)
AddPackage obs-streamfx # Bring your stream back to life with modern effects!
AddPackage obs-studio-browser # Free and open source software for video recording and live streaming. Built with browser, vst plugins.
AddPackage obs-vkcapture-git # OBS Linux Vulkan/OpenGL game capture

# kdeconnect
AddPackage kdeconnect # Adds communication between KDE and your smartphone

# syncing
AddPackage syncthing-gtk-python3 # GTK3 based GUI and notification area icon for Syncthing. Python 3 port with Debian sources.
AddPackage rslsync # Resilio Sync (ex
CopyFile /etc/systemd/system/rslsync.service
CopyFile /etc/rslsync.conf 600 rslsync rslsync
SetFileProperty /etc/rslsync.conf group rslsync
SetFileProperty /etc/rslsync.conf mode 600
SetFileProperty /etc/rslsync.conf owner rslsync

# nx
AddPackage nomachine # Remote desktop application
CopyFile /etc/pam.d/nx
CopyFile /etc/pam.d/nxlimits
CreateLink /etc/systemd/system/multi-user.target.wants/nxserver.service /usr/lib/systemd/system/nxserver.service

# rclone
#mkdir -p /cloud/Plex
CopyFile /etc/systemd/system/rclone-plex.service '' alex alex
CreateLink /etc/systemd/system/default.target.wants/rclone-plex.service /etc/systemd/system/rclone-plex.service

# modem
AddPackage usb_modeswitch # Activating switchable USB devices on Linux.
AddPackage modem-manager-gui # Frontend for ModemManager daemon able to control specific modem functions
AddPackage modemmanager # Mobile broadband modem management service
CreateLink /etc/systemd/system/dbus-org.freedesktop.ModemManager1.service /usr/lib/systemd/system/ModemManager.service
CreateLink /etc/systemd/system/multi-user.target.wants/ModemManager.service /usr/lib/systemd/system/ModemManager.service


# cli tools
AddPackage btop # A monitor of system resources, bpytop ported to C++
AddPackage youtube-dl # A command-line program to download videos from YouTube.com and a few more sites
AddPackage yt-dlp # A youtube-dl fork with additional features and fixes
AddPackage w3m # Text-based Web browser as well as pager
AddPackage vulkan-tools # Vulkan Utilities and Tools
AddPackage pigz # Parallel implementation of the gzip file compressor
AddPackage sl # Steam Locomotive runs across your terminal when you type "sl" as you meant to type "ls".
AddPackage perl-image-exiftool # Reader and rewriter of EXIF informations that supports raw files
AddPackage odt2txt # extracts the text out of OpenDocument Texts
AddPackage cava # Console-based Audio Visualizer for Alsa
AddPackage corrupter-git # Simple image glitcher suitable for producing nice looking i3lock backgrounds
AddPackage ranger # Simple, vim-like file manager
AddPackage toilet # Free replacement for the FIGlet utility.
AddPackage cht.sh-git # The only cheat sheet you need (command line client for cheat.sh)
AddPackage mediainfo # Supplies technical and tag information about a video or audio file (CLI interface)
AddPackage util-linux # Miscellaneous system utilities for Linux
AddPackage usbutils # A collection of USB tools to query connected USB devices
AddPackage woeusb-ng # Simple tool that enable you to create your own usb stick with Windows installer.
AddPackage sysprof # Kernel based performance profiler
AddPackage speedtest-cli # Command line interface for testing internet bandwidth using speedtest.net
AddPackage socat # Multipurpose relay
AddPackage s-tui # Terminal UI stress test and monitoring tool
AddPackage aria2 # Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink
AddPackage dmg2img # A CLI tool to uncompress Apple's compressed DMG files to the HFS+ IMG format
AddPackage dos2unix # Text file format converter
AddPackage ffmpeg # Complete solution to record, convert and stream audio and video
AddPackage minicom # A serial communication program
AddPackage mosh # Mobile shell, surviving disconnects with local echo and line editing
AddPackage lynx # A text browser for the World Wide Web
AddPackage pacman-contrib # Contributed scripts and tools for pacman systems
AddPackage caffeine-ng # Status bar application able to temporarily inhibit the screensaver and sleep mode.

# services
AddPackage sponsorblockcast-git # Skip Youtube sponsor segments on all LAN Chromecasts
CreateLink /etc/systemd/system/multi-user.target.wants/sponsorblockcast.service /usr/lib/systemd/system/sponsorblockcast.service
AddPackage packagekit # A system designed to make installation and updates of packages easier
AddPackage syncthing # Open Source Continuous Replication / Cluster Synchronization Thing
AddPackage mconnect-git # KDE Connect protocol implementation in Vala/C for non-KDE desktops

# docker
AddPackage docker # Pack, ship and run any application as a lightweight container
AddPackage docker-compose # Fast, isolated development environments using Docker
CreateLink /etc/systemd/system/multi-user.target.wants/docker.service /usr/lib/systemd/system/docker.service

# postmarketos
AddPackage pmbootstrap # Sophisticated chroot/build/flash tool to develop and install postmarketOS

# gpg
AddPackage seahorse # GNOME application for managing PGP keys.

# v4l2loopback
AddPackage v4l2loopback-dkms # v4l2-loopback device – module sources
AddPackage v4l2loopback-utils # v4l2-loopback device – utilities only

# libvirt
AddPackage bridge-utils # Utilities for configuring the Linux ethernet bridge
AddPackage qemu-arch-extra # QEMU for foreign architectures
AddPackage qemu-block-gluster # QEMU GlusterFS block module
AddPackage qemu-block-iscsi # QEMU iSCSI block module
AddPackage qemu-block-rbd # QEMU RBD block module
AddPackage virt-manager # Desktop user interface for managing virtual machines
AddPackage iptables-nft # Linux kernel packet control tool (using nft interface)
CreateLink /etc/systemd/system/multi-user.target.wants/libvirtd.service /usr/lib/systemd/system/libvirtd.service
CreateLink /etc/systemd/system/sockets.target.wants/libvirtd-ro.socket /usr/lib/systemd/system/libvirtd-ro.socket
CreateLink /etc/systemd/system/sockets.target.wants/libvirtd.socket /usr/lib/systemd/system/libvirtd.socket
CreateLink /etc/systemd/system/sockets.target.wants/virtlockd.socket /usr/lib/systemd/system/virtlockd.socket
CreateLink /etc/systemd/system/sockets.target.wants/virtlogd.socket /usr/lib/systemd/system/virtlogd.socket
#CopyFile /etc/libvirt/qemu/networks/default.xml
#CreateDir /etc/libvirt/secrets 700

# keybase
AddPackage keybase # CLI tool for GPG with keybase.io
AddPackage keybase-gui # GUI frontend for GPG with keybase.io
AddPackage kbfs # The Keybase filesystem

# filesystems
AddPackage udevil # Mount and unmount without password
AddPackage exfat-utils # Utilities for exFAT file system
AddPackage f2fs-tools # Tools for Flash-Friendly File System (F2FS)
AddPackage curlftpfs # A filesystem for acessing FTP hosts based on FUSE and libcurl.
AddPackage gphotofs # FUSE filesystem module to mount your camera as a filesystem on Linux.
AddPackage jfsutils # JFS filesystem utilities
AddPackage jmtpfs # FUSE and libmtp based filesystem for accessing MTP (Media Transfer Protocol) devices
AddPackage nilfs-utils # A log-structured file system supporting continuous snapshotting (userspace utils)
AddPackage ntfs-3g # NTFS filesystem driver and utilities
AddPackage reiserfsprogs # Reiserfs utilities
AddPackage udftools # Linux tools for UDF filesystems and DVD/CD-R(W) drives
AddPackage fuseiso # FUSE module to mount ISO filesystem images
AddPackage ifuse # A fuse filesystem to access the contents of an iPhone or iPod Touch
AddPackage hfsprogs # User space utils for create and check Apple HFS/HFS+ filesystem
AddPackage ntfs3-dkms # NTFS3 is fully functional NTFS Read-Write driver. The driver works with NTFS versions up to 3.1.
AddPackage e2fsprogs # Ext2/3/4 filesystem utilities
AddPackage dosfstools # DOS filesystem utilities
AddPackage darling-dmg-git # FUSE module for .dmg files (containing an HFS+ filesystem)

# mutt
AddPackage neomutt # A version of mutt with added features
AddPackage msmtp # A mini smtp client
AddPackage offlineimap # Synchronizes emails between two repositories
AddPackage notmuch # Notmuch is not much of an email program
AddPackage notmuch-mutt # The mail indexer
AddPackage notmuch-vim # Vim plugins for notmuch
AddPackage gmailieer # Fast fetch and two-way tag synchronization between notmuch and GMail
AddPackage afew # Initial tagging script for notmuch mail
AddPackage alot # Terminal-based MUA for the notmuch mail system
AddPackage davmail # a POP/IMAP/SMTP/Caldav/LDAP gateway for the exchange service

# smb
AddPackage samba # SMB Fileserver and AD Domain server
CopyFile /etc/samba/smb.conf
CreateLink /etc/systemd/system/multi-user.target.wants/smb.service /usr/lib/systemd/system/smb.service
CreateLink /etc/systemd/system/multi-user.target.wants/nmb.service /usr/lib/systemd/system/nmb.service




















AddPackage chaotic-keyring # Chaotic-AUR PGP keyring
AddPackage chaotic-mirrorlist # Chaotic-AUR mirrorlist to use with Pacman






