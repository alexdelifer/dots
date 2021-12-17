#  ______     ______   ______     ______   ______
# /\  == \   /\__  _\ /\  == \   /\  ___\ /\  ___\
# \ \  __<   \/_/\ \/ \ \  __<   \ \  __\ \ \___  \
#  \ \_____\    \ \_\  \ \_\ \_\  \ \_\    \/\_____\
#   \/_____/     \/_/   \/_/ /_/   \/_/     \/_____/

CheckConfig btrfs || return 0
CheckBtrfs btrfs || return 0

AddPackage btrfs-progs # Btrfs filesystem utilities
AddPackage grub-btrfs # Include btrfs snapshots in GRUB boot options
AddPackage snap-pac # Pacman hooks that use snapper to create pre/post btrfs snapshots like openSUSE's YaST
AddPackage snapper # A tool for managing BTRFS and LVM snapshots. It can create, diff and restore snapshots and provides timelined auto-snapping.
CreateLink /etc/systemd/system/timers.target.wants/snapper-cleanup.timer /usr/lib/systemd/system/snapper-cleanup.timer
CreateLink /etc/systemd/system/timers.target.wants/snapper-timeline.timer /usr/lib/systemd/system/snapper-timeline.timer
CopyFile /etc/snapper/configs/root
CopyFile /etc/conf.d/snapper
