#  ______     ______   ______
# /\___  \   /\  ___\ /\  ___\
# \/_/  /__  \ \  __\ \ \___  \
#   /\_____\  \ \_\    \/\_____\
#   \/_____/   \/_/     \/_____/

CheckConfig zfs || return 0
CheckZfs zfs || return 0

AddPackage zfs-dkms # Kernel modules for the Zettabyte File System.
CreateLink /etc/systemd/system/multi-user.target.wants/zfs.target /usr/lib/systemd/system/zfs.target
CreateLink /etc/systemd/system/zfs.target.wants/zfs-import.target /usr/lib/systemd/system/zfs-import.target
CreateLink /etc/systemd/system/zfs.target.wants/zfs-mount.service /usr/lib/systemd/system/zfs-mount.service
