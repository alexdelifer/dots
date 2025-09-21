CheckConfig system || return 0


AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel # Basic tools to build Arch Linux packages
AddPackage fakeroot # Tool for simulating superuser privileges

AddPackage linux # The Linux kernel and modules
AddPackage linux-firmware # Firmware files for Linux - Default set
AddPackage linux-headers # Headers and scripts for building modules for the Linux kernel
AddPackage linux-zen # The Linux ZEN kernel and modules
AddPackage linux-zen-headers # Headers and scripts for building modules for the Linux ZEN kernel

AddPackage mkinitcpio-firmware # Optional firmware for the default linux kernel to get rid of the annoying 'WARNING: Possibly missing firmware for module:' messages
CopyFile /etc/mkinitcpio.conf
CopyFile /etc/mkinitcpio.d/linux-zen.preset
CopyFile /etc/mkinitcpio.d/linux.preset

CopyFileTo "/etc/hosts-$HOSTNAME" /etc/hosts

CreateLink /etc/localetime /usr/share/zoneinfo/America/Toronto
CreateLink /etc/localtime ../usr/share/zoneinfo/America/Toronto

AddPackage os-prober # Utility to detect other OSes on a set of drives
AddPackage packagekit # A system designed to make installation and updates of packages easier


AddPackage chaotic-keyring # Chaotic-AUR PGP keyring
AddPackage chaotic-mirrorlist # Chaotic-AUR mirrorlist to use with Pacman
CopyFile /etc/pacman.d/blackarch-mirrorlist
CopyFile /etc/pacman.d/alhp-mirrorlist
CopyFile /etc/pacman.conf

CreateFile /etc/pacman.d/gnupg/.gpg-v21-migrated > /dev/null
CopyFile /etc/pacman.d/gnupg/crls.d/DIR.txt
CopyFile /etc/pacman.d/gnupg/gpg-agent.conf
CopyFile /etc/pacman.d/gnupg/gpg.conf
CopyFile /etc/pacman.d/gnupg/openpgp-revocs.d/3DDDBB65F821DA2F93FBF7788D35C7D2AD10C597.rev 600
CopyFile /etc/pacman.d/gnupg/private-keys-v1.d/19CE7C24FB47A8CC79E9B8D81E5C450CA99CAE73.key 600
CopyFile /etc/pacman.d/gnupg/pubring.gpg
CopyFile /etc/pacman.d/gnupg/pubring.gpg~
CreateFile /etc/pacman.d/gnupg/secring.gpg 600 > /dev/null
CopyFile /etc/pacman.d/gnupg/tofu.db
CopyFile /etc/pacman.d/gnupg/trustdb.gpg
CopyFile /etc/pacman.d/mirrorlist

CopyFile /etc/locale.conf
CopyFile /etc/locale.gen

AddPackage apparmor # Mandatory Access Control (MAC) using Linux Security Module (LSM)
AddPackage earlyoom # Early OOM Daemon for Linux
AddPackage etc-update # CLI to interactively merge .pacnew configuration files
AddPackage fwupd # Simple daemon to allow session software to update firmware
AddPackage gksu # A graphical frontend for su.
AddPackage ibus # Intelligent input bus for Linux/Unix
AddPackage kernel-modules-hook # Keeps your system fully functional after a kernel upgrade
AddPackage libtool # A generic library support script
AddPackage rng-tools # Random number generator related utilities
AddPackage rtkit # Realtime Policy and Watchdog Daemon
AddPackage sof-firmware # Sound Open Firmware
AddPackage sssd # System Security Services Daemon
AddPackage syslog-ng # Next-generation syslogd with advanced networking and filtering capabilities
AddPackage xdg-user-dirs # Manage user directories like ~/Desktop and ~/Music
AddPackage xdg-user-dirs-gtk # Creates user dirs and asks to relocalize them
AddPackage usb_modeswitch # Activating switchable USB devices on Linux.
AddPackage ffmpeg # Complete solution to record, convert and stream audio and video
AddPackage realtime-privileges # Realtime privileges for users
AddPackage libdbusmenu-gtk3 # Library for passing menus over DBus (GTK+ 3 library)
AddPackage grilo-plugins # A collection of plugins for the Grilo framework
AddPackage groff # GNU troff text-formatting system
AddPackage cpio # A tool to copy files into or out of a cpio or tar archive
AddPackage dkms # Dynamic Kernel Modules System
AddPackage arch-install-scripts # Scripts to aid in installing Arch Linux
AddPackage acpi_call # A linux kernel module that enables calls to ACPI methods through /proc/acpi/call
AddPackage systemd-resolvconf # systemd resolvconf replacement (for use with systemd-resolved)
AddPackage xdg-utils # Command line tools that assist applications with a variety of desktop integration tasks

# gui toolkit
AddPackage qt5ct # Qt5 Configuration Utility
AddPackage qt6-base # A cross-platform application and UI framework
AddPackage qt6-wayland # Provides APIs for Wayland
AddPackage qt6ct # Qt 6 Configuration Utility
AddPackage tk # A windowing toolkit for use with tcl
AddPackage qt5-wayland # Provides APIs for Wayland
AddPackage qt6-scxml # None

AddPackage syncthing # Open Source Continuous Replication / Cluster Synchronization Thing

# lib32 shit
AddPackage lib32-gst-plugins-base # Multimedia graph framework (32-bit) - base plugins
AddPackage lib32-gst-plugins-good # Multimedia graph framework (32-bit) - good plugins
AddPackage lib32-gstreamer # Multimedia graph framework (32-bit) - core
AddPackage lib32-gtk2 # GObject-based multi-platform GUI toolkit (legacy, 32-bit)
AddPackage lib32-libglvnd # The GL Vendor-Neutral Dispatch library
AddPackage lib32-libxslt # XML stylesheet transformation library (32-bit)
AddPackage lib32-openal # Cross-platform 3D audio library, software implementation (32-bit)

# network
AddPackage tailscale # A mesh VPN that makes it easy to connect your devices, wherever they are.
AddPackage tor # Anonymizing overlay network.
AddPackage ntp # Network Time Protocol reference implementation
CopyFile /etc/ntp.conf

AddPackage cloudflared # Command-line client for Cloudflare Tunnel
AddPackage --foreign vpn-slice # vpnc-script replacement for easy and secure split-tunnel VPN setup
AddPackage proton-vpn-gtk-app # ProtonVPN GTK app, Maintained by Community

AddPackage --foreign asp # Arch Linux build source file management tool
AddPackage --foreign grub-hook # Pacman hook to update GRUB after a kernel update
AddPackage --foreign gss-ntlmssp # A GSSAPI Mechanism that implements NTLMSSP
AddPackage --foreign pacman-cleanup-hook # hook to cleanup pacman cache keeping only the installed plus next most recent packages

CopyFile /etc/fuse.conf
CreateDir /etc/openvpn/client 750 openvpn network
CreateDir /etc/openvpn/server 750 openvpn network

CopyFile /etc/systemd/timesyncd.conf
CreateDir /etc/timezone

CopyFile /etc/systemd/resolved.conf.d/docker.conf
CopyFile /etc/systemd/system/rclone-seedbox.service
CopyFile /etc/systemd/system/local-lan-priority.service
CopyFile /etc/systemd/system/docker.service.d/override.conf

CreateLink /etc/systemd/system/timers.target.wants/fstrim.timer /usr/lib/systemd/system/fstrim.timer
CreateLink /etc/systemd/system/basic.target.wants/linux-modules-cleanup.service /usr/lib/systemd/system/linux-modules-cleanup.service
CreateLink /etc/systemd/system/bluetooth.service.wants/bluetooth-autoconnect.service /usr/lib/systemd/system/bluetooth-autoconnect.service
CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.Avahi.service /usr/lib/systemd/system/avahi-daemon.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.ModemManager1.service /usr/lib/systemd/system/ModemManager.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.oom1.service /usr/lib/systemd/system/systemd-oomd.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.resolve1.service /usr/lib/systemd/system/systemd-resolved.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/default.target.wants/rclone-plex.service /etc/systemd/system/rclone-plex.service
CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/gdm.service
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CreateLink /etc/systemd/system/multi-user.target.wants/ModemManager.service /usr/lib/systemd/system/ModemManager.service
CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
CreateLink /etc/systemd/system/multi-user.target.wants/avahi-daemon.service /usr/lib/systemd/system/avahi-daemon.service
CreateLink /etc/systemd/system/multi-user.target.wants/docker.service /usr/lib/systemd/system/docker.service
CreateLink /etc/systemd/system/multi-user.target.wants/libvirtd.service /usr/lib/systemd/system/libvirtd.service
CreateLink /etc/systemd/system/multi-user.target.wants/local-lan-priority.service /etc/systemd/system/local-lan-priority.service
CreateLink /etc/systemd/system/multi-user.target.wants/nmb.service /usr/lib/systemd/system/nmb.service
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateLink /etc/systemd/system/multi-user.target.wants/rtkit-daemon.service /usr/lib/systemd/system/rtkit-daemon.service
CreateLink /etc/systemd/system/multi-user.target.wants/smb.service /usr/lib/systemd/system/smb.service
CreateLink /etc/systemd/system/multi-user.target.wants/sshd.service /usr/lib/systemd/system/sshd.service
CreateLink /etc/systemd/system/multi-user.target.wants/sssd.service /usr/lib/systemd/system/sssd.service
CreateLink /etc/systemd/system/multi-user.target.wants/synergy.service /usr/lib/systemd/system/synergy.service
CreateLink /etc/systemd/system/multi-user.target.wants/syslog-ng@default.service /usr/lib/systemd/system/syslog-ng@.service
CreateLink /etc/systemd/system/multi-user.target.wants/systemd-oomd.service /usr/lib/systemd/system/systemd-oomd.service
CreateLink /etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service /usr/lib/systemd/system/NetworkManager-wait-online.service
CreateLink /etc/systemd/system/sockets.target.wants/avahi-daemon.socket /usr/lib/systemd/system/avahi-daemon.socket
CreateLink /etc/systemd/system/sockets.target.wants/libvirtd-ro.socket /usr/lib/systemd/system/libvirtd-ro.socket
CreateLink /etc/systemd/system/sockets.target.wants/libvirtd.socket /usr/lib/systemd/system/libvirtd.socket
CreateLink /etc/systemd/system/sockets.target.wants/virtlockd.socket /usr/lib/systemd/system/virtlockd.socket
CreateLink /etc/systemd/system/sockets.target.wants/virtlogd.socket /usr/lib/systemd/system/virtlogd.socket
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-resolved.service /usr/lib/systemd/system/systemd-resolved.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/timers.target.wants/logrotate.timer /usr/lib/systemd/system/logrotate.timer
CreateLink /etc/systemd/system/timers.target.wants/snapper-cleanup.timer /usr/lib/systemd/system/snapper-cleanup.timer
CreateLink /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service /usr/lib/systemd/user/xdg-user-dirs-update.service
CreateLink /etc/systemd/user/pipewire-session-manager.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/pipewire.service.wants/wireplumber.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/pulseaudio.service.wants/pulseaudio-bluetooth-autoconnect.service /usr/lib/systemd/user/pulseaudio-bluetooth-autoconnect.service
CreateLink /etc/systemd/user/sockets.target.wants/gcr-ssh-agent.socket /usr/lib/systemd/user/gcr-ssh-agent.socket
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire-pulse.socket /usr/lib/systemd/user/pipewire-pulse.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket

CopyFile /etc/udev/rules.d/11-android.rules
CopyFile /etc/udev/rules.d/51-gcadapter.rules
CopyFile /etc/udev/rules.d/60-steam-vr.rules
CopyFile /etc/udev/rules.d/99-nzxt-hue.rules
CopyFile /etc/udev/rules.d/99-platformio-udev.rules

CopyFile /etc/sssd/sssd.conf 640 '' sssd
CopyFile /etc/krb5.conf
CopyFile /etc/krb5.keytab 600
CreateLink /etc/nsswitch.conf /etc/authselect/nsswitch.conf

CreateLink /etc/os-release ../usr/lib/os-release
CreateLink /etc/resolv.conf /run/systemd/resolve/stub-resolv.conf

CopyFile /etc/udisks2/mount_options.conf
CopyFile /etc/vconsole.conf

CopyFile /etc/skel/.bashrc
CopyFile /etc/skel/.config/dconf/user
CopyFile /etc/skel/.config/gtk-3.0/bookmarks
CopyFile /etc/skel/.config/gtk-3.0/settings.ini
CopyFile /etc/skel/.config/terminator/config
CopyFile /etc/skel/.face
CopyFile /etc/skel/.xinitrc
CopyFile /etc/skel/.zshrc