AddPackage aconfmgr-git # A configuration manager for Arch Linux
AddPackage yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.

# kernel
AddPackage linux # The Linux kernel and modules
AddPackage linux-firmware # Firmware files for Linux
AddPackage linux-headers # Headers and scripts for building modules for the Linux kernel
AddPackage linux-zen # The Linux ZEN kernel and modules
AddPackage linux-zen-headers # Headers and scripts for building modules for the Linux ZEN kernel
AddPackage intel-ucode # Microcode update files for Intel CPUs

# arch base
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage etc-update # CLI to interactively merge .pacnew configuration files
AddPackage fakeroot # Tool for simulating superuser privileges
AddPackage pacman # A library-based package manager with dependency support
AddPackage pacman-contrib # Contributed scripts and tools for pacman systems
AddPackage reflector # A Python 3 module and script to retrieve and filter the latest Pacman mirror list.
AddPackage xdg-user-dirs # Manage user directories like ~/Desktop and ~/Music

# boot
AddPackage archiso # Tools for creating Arch Linux live and install iso images
AddPackage efibootmgr # Linux user-space application to modify the EFI Boot Manager
AddPackage kernel-modules-hook # Keeps your system fully functional after a kernel upgrade
AddPackage mkinitcpio-firmware # Optional firmware for the default linux kernel to get rid of the annoying 'WARNING: Possibly missing firmware for module:' messages
AddPackage os-prober # Utility to detect other OSes on a set of drives
AddPackage grub # GNU GRand Unified Bootloader (2)
AddPackage grub-btrfs # Include btrfs snapshots in GRUB boot options

# auth
AddPackage authselect # Tool to select system authentication and identity sources from a list of supported profiles.
AddPackage oddjob # A D-Bus service which runs odd jobs on behalf of client applications
AddPackage realmd # DBus service for joining hosts to Active Directory and FreeIPA realms
AddPackage sssd # System Security Services Daemon
AddPackage sudo # Give certain users the ability to run some commands as root
AddPackage apparmor # Mandatory Access Control (MAC) using Linux Security Module (LSM)


# cli
AddPackage file # File type identification utility
AddPackage gawk # GNU version of awk
AddPackage grep # A string search utility
AddPackage gzip # GNU compression utility
AddPackage htop # Interactive process viewer
AddPackage man-pages # Linux man pages
AddPackage man-db # A utility for reading man pages
AddPackage moreutils # A growing collection of the unix tools that nobody thought to write thirty years ago
AddPackage ncdu # Disk usage analyzer with an ncurses interface
AddPackage pciutils # PCI bus configuration space access library and tools
AddPackage pigz # Parallel implementation of the gzip file compressor
AddPackage pkgconf # Package compiler and linker metadata toolkit
AddPackage pv # A terminal-based tool for monitoring the progress of data through a pipeline
AddPackage ripgrep # A search tool that combines the usability of ag with the raw speed of grep
AddPackage rng-tools # Random number generator related utilities
AddPackage sed # GNU stream editor
AddPackage smartmontools # Control and monitor S.M.A.R.T. enabled ATA and SCSI Hard Drives
AddPackage tree # A directory listing program displaying a depth indented list of files
AddPackage usb_modeswitch # Activating switchable USB devices on Linux.
AddPackage usbutils # A collection of USB tools to query connected USB devices
AddPackage util-linux # Miscellaneous system utilities for Linux
AddPackage wget # Network utility to retrieve files from the Web
AddPackage which # A utility to show the full path of commands
AddPackage whois # Intelligent WHOIS client
AddPackage zsh # A very advanced and programmable command interpreter (shell) for UNIX
AddPackage dos2unix # Text file format converter
AddPackage findutils # GNU utilities to locate files
AddPackage downgrade # Bash script for downgrading one or more packages to a version in your cache or the A.L.A.
AddPackage duf # Disk Usage/Free Utility
AddPackage dmidecode # Desktop Management Interface table related utilities
AddPackage lynx # A text browser for the World Wide Web
AddPackage paru # Feature packed AUR helper
AddPackage screen # Full-screen window manager that multiplexes a physical terminal
AddPackage w3m # Text-based Web browser as well as pager

# filesystems
AddPackage btrfs-progs # Btrfs filesystem utilities
AddPackage f2fs-tools # Tools for Flash-Friendly File System (F2FS)
AddPackage jfsutils # JFS filesystem utilities
AddPackage lvm2 # Logical Volume Manager 2 utilities
AddPackage nfs-utils # Support programs for Network File Systems
AddPackage nilfs-utils # A log-structured file system supporting continuous snapshotting (userspace utils)
AddPackage ntfs-3g # NTFS filesystem driver and utilities
AddPackage reiserfsprogs # Reiserfs utilities
AddPackage e2fsprogs # Ext2/3/4 filesystem utilities
AddPackage dosfstools # DOS filesystem utilities
AddPackage udftools # Linux tools for UDF filesystems and DVD/CD-R(W) drives
AddPackage gpart # Partition table rescue/guessing tool
AddPackage guestfs-tools # Tools for accessing and modifying guest disk images
AddPackage iotop # View I/O usage of processes

# bluetooth
AddPackage bluez # Daemons for the bluetooth protocol stack
AddPackage bluez-hid2hci # Put HID proxying bluetooth HCI's into HCI mode
AddPackage bluez-tools # A set of tools to manage Bluetooth devices for Linux
AddPackage bluez-utils # Development and debugging utilities for the bluetooth protocol stack

# networking
AddPackage bridge-utils # Utilities for configuring the Linux ethernet bridge
AddPackage dnsmasq # Lightweight, easy to configure DNS forwarder and DHCP server
AddPackage iproute2 # IP Routing Utilities
AddPackage iptables-nft # Linux kernel packet control tool (using nft interface)
AddPackage iputils # Network monitoring tools, including ping
AddPackage iwd # Internet Wireless Daemon
AddPackage inetutils # A collection of common network programs
AddPackage modemmanager # Mobile broadband modem management service
AddPackage modem-manager-gui # Frontend for ModemManager daemon able to control specific modem functions
AddPackage network-manager-applet # Applet for managing network connections
AddPackage networkmanager # Network connection manager and user applications
AddPackage networkmanager-l2tp # L2TP support for NetworkManager
AddPackage strongswan # Open source IPsec implementation
AddPackage wpa_supplicant # A utility providing key negotiation for WPA wireless networks
AddPackage iperf3 # TCP, UDP, and SCTP network bandwidth measurement tool

# daemons
AddPackage openssh # SSH protocol implementation for remote login, command execution and file transfer
AddPackage openssh-askpass # A plasma-like passphrase dialog for ssh.
AddPackage sshpass # Fool ssh into accepting an interactive password non-interactively
AddPackage acpi # Client for battery, power, and thermal readings

AddPackage rtkit # Realtime Policy and Watchdog Daemon
AddPackage realtime-privileges # Realtime privileges for users
AddPackage samba # SMB Fileserver and AD Domain server
AddPackage syslog-ng # Next-generation syslogd with advanced networking and filtering capabilities
AddPackage logrotate # Rotates system logs automatically
AddPackage mlocate # Merging locate/updatedb implementation
AddPackage earlyoom # Early OOM Daemon for Linux
AddPackage flatpak # Linux application sandboxing and distribution framework (formerly xdg-app)
AddPackage fwupd # Simple daemon to allow session software to update firmware
AddPackage ntp # Network Time Protocol reference implementation
AddPackage packagekit # A system designed to make installation and updates of packages easier
AddPackage libportal-qt5 # GIO-style async APIs for most Flatpak portals - Qt 5 backend
AddPackage libdbusmenu-gtk3 # Library for passing menus over DBus (GTK+ 3 library)

# drivers
AddPackage broadcom-bt-firmware-git # Broadcom bluetooth firmware.
