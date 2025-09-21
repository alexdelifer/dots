#!/usr/bin/env bash

#  __     ______     __   __     ______     ______     ______     ______
# /\ \   /\  ___\   /\ "-.\ \   /\  __ \   /\  == \   /\  ___\   /\  ___\
# \ \ \  \ \ \__ \  \ \ \-.  \  \ \ \/\ \  \ \  __<   \ \  __\   \ \___  \
#  \ \_\  \ \_____\  \ \_\\"\_\  \ \_____\  \ \_\ \_\  \ \_____\  \/\_____\
#   \/_/   \/_____/   \/_/ \/_/   \/_____/   \/_/ /_/   \/_____/   \/_____/

IgnorePath '**.pacnew'
IgnorePath '**.pacsave'

IgnorePath '**/dkms.conf'

#IgnorePath '/etc/hostname'
IgnorePath '/etc/machine-id'
#IgnorePath '/etc/hosts'
IgnorePath '/etc/ld.so.cache'

IgnorePath '/.snapshots/*'
IgnorePath '/zfs/*'
IgnorePath '/boot/*'

IgnorePath '/etc/shells'
IgnorePath '/etc/fstab'
IgnorePath '/etc/group'
IgnorePath '/etc/group-'
IgnorePath '/etc/gshadow'
IgnorePath '/etc/gshadow-'
IgnorePath '/etc/shadow'
IgnorePath '/etc/shadow-'
IgnorePath '/etc/passwd'
IgnorePath '/etc/passwd-'
IgnorePath '/etc/zfs/*'
IgnorePath '/etc/systemd/system/zfs-*'
IgnorePath '/etc/X11/*'
#IgnorePath '/etc/pacman.d/gnupg/*'
IgnorePath '/etc/pulse/*'
IgnorePath '/etc/NX/*'
IgnorePath '/etc/vmware/*'
IgnorePath '/etc/NetworkManager/system-connections/*'
IgnorePath '/etc/docker/*'
IgnorePath '/etc/libvirt/*'
IgnorePath '/etc/lvm/*'
IgnorePath '/etc/xdg/*'
IgnorePath '/etc/ssh/ssh_host_*'
IgnorePath '/usr/NX/*'
IgnorePath '/usr/LICENSE'
IgnorePath '/etc/zcasos-info'
IgnorePath '/etc/spacefm/*'
IgnorePath '/etc/xml/catalog'
IgnorePath '/etc/.updated'

IgnorePath '/nix/*'
IgnorePath '/usr/pwntools-doc/*'

#IgnorePath '/etc/pacman.d/blackarch-mirrorlist'

#IgnorePath '/etc/systemd/system/hibernate.target'
#IgnorePath '/etc/systemd/system/suspend.target'

#IgnorePath '/etc/systemd/system/sponsorblockcast.service.d'
#IgnorePath '/etc/systemd/system/sponsorblockcast.service.d/*'
#IgnorePath '/etc/systemd/system/\\x2esnapshots.mount.wants'
#IgnorePath '/etc/systemd/system/\\x2esnapshots.mount.wants/grub-btrfs.path'

IgnorePath '/usr/bin/*'
IgnorePath '/opt/*'
IgnorePath '/usr/local/*'
IgnorePath '/var/*'
IgnorePath '/var/tmp/*'
IgnorePath '/var/lib/*'
IgnorePath '/var/log/*'
IgnorePath '/var/cache/*'
IgnorePath '/usr/lib/modules/*'
IgnorePath '/etc/ssl/certs/*'
IgnorePath '/etc/ca-certificates/extracted/*'
IgnorePath '/usr/share/*'
IgnorePath '/usr/lib/*'
IgnorePath '/usr/lib32/*'

IgnorePath '/cloud/*'
IgnorePath '/kali/*'
IgnorePath '/data/*'
IgnorePath '/homes/*'
IgnorePath '/games/*'
IgnorePath '/smb/*'
IgnorePath '/appdata/*'
IgnorePath '/backup/*'
IgnorePath '/caca/*'
IgnorePath '/propagated-mount/*'

IgnorePath '/etc/brlapi.key'
IgnorePath '/etc/crypttab'

IgnorePath '/etc/ipsec.secrets'
IgnorePath '/lost+found'
IgnorePath 'mnt_uefi'

IgnorePath /etc/pacman.d/gnupg/S.dirmngr
IgnorePath /etc/pacman.d/gnupg/S.gpg-agent.browser
IgnorePath /etc/pacman.d/gnupg/S.gpg-agent.extra
IgnorePath /etc/pacman.d/gnupg/S.gpg-agent.ssh
IgnorePath /etc/pacman.d/gnupg/S.gpg-agent
IgnorePath /etc/pacman.d/gnupg/S.keyboxd

IgnorePath /etc/hostname

IgnorePath /etc/sgml/*

IgnorePath /appdata
IgnorePath /games
IgnorePath /data
IgnorePath /homes
IgnorePath /smb
IgnorePath /net-data

IgnorePackage grub
IgnorePath /etc/default/grub
IgnorePackage samba
IgnorePath /etc/samba

IgnorePath '/etc/adjtime/*'
IgnorePath '/etc/adjtime'

IgnorePath '/etc/dconf/*'
IgnorePath '/etc/gconf/*'
IgnorePath '/etc/ipsec.d/*'
IgnorePath '/etc/java-jdk/*'
IgnorePath '/etc/multipath/*'
IgnorePath '/etc/cni/*'
IgnorePath '/etc/flatpak/*'
IgnorePath '/etc/flatpak'
IgnorePath '/etc/java-jdk/*'

IgnorePath '/opt/*'
IgnorePath '/var/lib/flatpak/*'
IgnorePath '/usr/src/'
IgnorePath '/usr/src/*'

IgnorePath '/etc/raddb/'
IgnorePath '/etc/raddb/*'

