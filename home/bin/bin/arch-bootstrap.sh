#!/bin/bash
clear
echo -e "\e[34m"
cat << "EOF"
 ______     ______     ______     __  __    
/\  __ \   /\  == \   /\  ___\   /\ \_\ \   
\ \  __ \  \ \  __<   \ \ \____  \ \  __ \  
 \ \_\ \_\  \ \_\ \_\  \ \_____\  \ \_\ \_\ 
  \/_/\/_/   \/_/ /_/   \/_____/   \/_/\/_/ 
                                            
 __         __     __   __     __  __     __  __    
/\ \       /\ \   /\ "-.\ \   /\ \/\ \   /\_\_\_\   
\ \ \____  \ \ \  \ \ \-.  \  \ \ \_\ \  \/_/\_\/_  
 \ \_____\  \ \_\  \ \_\\"\_\  \ \_____\   /\_\/\_\ 
  \/_____/   \/_/   \/_/ \/_/   \/_____/   \/_/\/_/ 
                                                    
EOF

# DEFAULT echo -ne "\e[39m"
# BLUE echo -e "\e[34m"
# BOLD echo -e "\e[1m"
# RESET echo -e "\e[0m"
# To be run in arch linux live iso after internet has been configured
echo -e "\e[34m"
echo -n "Checking Internet..."
echo -ne "\e[39m"
ping -q -c5 google.com > /dev/null
 
if [ $? -eq 0 ]
then
    echo -ne "\e[1m"
    echo -ne "\e[32m"
	echo " OK!"
    echo -e "\e[0m"
    echo -e "\e[39m"
else
    echo -ne "\e[1m"
    echo -ne "\e[31m"
    echo " Failed..."
    echo -e "\e[0m"
    echo -e "\e[39m"
    echo "Check your internet settings"
    exit 1
fi

echo -ne "\e[1m"
# How we booted
if [ -d /sys/firmware/efi ]; then
        echo "Booted in EFI mode!"
        bootmode="EFI"
else
        echo "Booted in Legacy BIOS mode..."
        echo "Try again in EFI mode."
        bootmode="BIOS"
        exit 1
fi

echo "Make sure you already partitioned your disk how you want it and mounted it to /mnt"
echo -ne "\e[0m"
echo ""
echo "$ fdisk /dev/sdX"
echo "$ mkfs.vfat -F32 /dev/sdXy"
echo "$ mkfs.btrfs /dev/sdXz"
echo ""
echo "$ mount /dev/sdXz /mnt"
echo "$ mkdir /mnt/boot"
echo "$ mount /dev/sdXy /mnt/boot"
echo ""
echo -ne "\e[1m"
echo "Some people may want swap too."
echo ""

findpart() { [ -e "$1" ] && df -P "$1" | awk '/^\/dev/ {print $1}' || echo "$1 not found"; }
arch_root_uuid=$(lsblk -no UUID $(findpart /mnt))

# user input

echo "Now I need some info for this install..."

echo -ne "\e[0m"
read -p $'\e[1mHostname: \e[0m' arch_hostname

while true; do
        read -sp $'\e[1mRoot Password: \e[0m' arch_root_password
        echo ""
        read -sp $'\e[1mRoot Password Again: \e[0m' arch_root_password_2
        echo ""
        [ "$arch_root_password" = "$arch_root_password_2" ] && break
        echo "Please try again"
done

read -p $'\e[1mUsername: \e[0m' arch_username

while true; do
        read -sp $'\e[1mUser Password: \e[0m' arch_password
        echo ""
        read -sp $'\e[1mUser Password Again: \e[0m' arch_password_2
        echo ""
        [ "$arch_password" = "$arch_password_2" ] && break
        echo "Please try again"
done

echo ""
echo -ne "\e[1m"
echo "See /usr/share/zoneinfo/* for more info"
echo -ne "\e[0m"
read -p $'\e[1mTimezone: \e[0m' -i 'America/Toronto' -e arch_timezone
read -p $'\e[1mKeymap: \e[0m' -i 'us' -e arch_keymap
read -p $'\e[1mLocale: \e[0m' -i 'en_US.UTF-8 UTF-8' -e arch_locale
echo ""
read -p $'\e[1mMirror: \e[0m' -i 'http://mirror.cedille.club/archlinux/$repo/os/$arch' -e arch_mirror
echo ""
echo -ne "\e[1m"
echo "Ready to Install!"
read -n 1 -s -r -p "Press any key to continue"
echo -ne "\e[0m"
echo ""

echo -ne "\e[1m"
echo "Setting pacman mirror to $arch_mirror"
echo -ne "\e[0m"

echo "Server = $arch_mirror" > /etc/pacman.d/mirrorlist

# Enable quality of life, -Sy is ok because who gives a fuck in a live iso
#pacman -Sy tmux

echo -ne "\e[1m"
echo "Starting pacstrap"
echo -ne "\e[0m"

# pacstrap!
pacstrap /mnt base base-devel wpa_supplicant dialog btrfs-progs git zsh vim stow curl openssl openssh xorg-xinit intel-ucode linux-headers

echo -ne "\e[1m"
echo "Setting pacman mirror to $arch_mirror inside /mnt"
echo -ne "\e[0m"

echo "Server = $arch_mirror" > /mnt/etc/pacman.d/mirrorlist

echo -e '\e[H\e[2J' > /mnt/etc/issue
echo -e '                                                            \e[1;30m| \e[34m\\s \\r' >> /mnt/etc/issue
echo -e '       \e[36;1m/\\\\                      \e[37m||     \e[36m| |                   \e[30m|' >> /mnt/etc/issue
echo -e '      \e[36m/  \\\\                     \e[37m||     \e[36m|     _               \e[30m| \e[32m\\t' >> /mnt/etc/issue
echo -e '     \e[1;36m/ \e[0;36m.. \e[1m\\\\   \e[37m//==\\\\\\\\ ||/= /==\\\\ ||/=\\\\  \e[36m| | |/ \\\\ |  | \\\\ /     \e[30m| \e[32m\\d' >> /mnt/etc/issue
echo -e '    \e[0;36m/ .  . \\\\  \e[37m||  || ||   |    ||  || \e[36m| | |  | |  |  X      \e[1;30m|' >> /mnt/etc/issue
echo -e '   \e[0;36m/  .  .  \\\\ \e[37m\\\\\\\\==/| ||   \\\\==/ ||  || \e[36m| | |  | \\\\_/| / \\\\     \e[1;30m| \e[31m\\U' >> /mnt/etc/issue
echo -e '  \e[0;36m/ ..    .. \\\\   \e[0;37mA simple, lightweight linux distribution.  \e[1;30m|' >> /mnt/etc/issue
echo -e ' \e[0;36m/_\x27        `_\\\\                                             \e[1;30m| \e[35m\\l \e[0mon \e[1;33m\\n' >> /mnt/etc/issue
echo -e ' \e[0m' >> /mnt/etc/issue
echo -e '' >> /mnt/etc/issue

echo -ne "\e[1m"
echo "Setting Timezone to $arch_timezone"
echo -ne "\e[0m"
# timezone
arch-chroot /mnt ln -sf /usr/share/zoneinfo/"$arch_timezone" /etc/localtime

echo -ne "\e[1m"
echo "Generating fstab of /mnt with UUIDs"
echo -ne "\e[0m"
# genfstab then show the user to let them edit anything
genfstab -U /mnt >> /mnt/etc/fstab
vim /mnt/etc/fstab

echo -ne "\e[1m"
echo "Setting locale to $arch_locale"
echo -ne "\e[0m"
# edit locale.gen
echo "$arch_locale" > /mnt/etc/locale.gen

echo -ne "\e[1m"
echo "Setting keymap to $arch_keymap"
echo -ne "\e[0m"
echo "KEYMAP=$arch_keymap" > /mnt/etc/vconsole.conf

# edit hostname
echo -ne "\e[1m"
echo "Setting hostname to $arch_hostname"
echo -ne "\e[0m"
echo "$arch_hostname" > /mnt/etc/hostname
echo "127.0.1.1 $arch_hostname" >> /mnt/etc/hosts

# create user and set passwords
echo -ne "\e[1m"
echo "Create user $arch_username"
echo -ne "\e[0m"
arch-chroot /mnt useradd -m "$arch_username"

echo -ne "\e[1m"
echo "Set passwords for root and username"
echo -ne "\e[0m"
echo "$arch_username:$arch_password" | arch-chroot /mnt chpasswd
echo "root:$arch_root_password" | arch-chroot /mnt chpasswd

# configure sudo
echo -ne "\e[1m"
echo "Allow $arch_username to sudo"
echo -ne "\e[0m"
arch-chroot /mnt gpasswd -a "$arch_username" wheel
echo "root ALL=(ALL) ALL" > /mnt/etc/sudoers
echo "%wheel ALL=(ALL) ALL" >> /mnt/etc/sudoers
echo "%wheel ALL= NOPASSWD: /usr/bin/pacman" >> /mnt/etc/sudoers
echo "%wheel ALL= NOPASSWD: /usr/bin/yay" >> /mnt/etc/sudoers
echo "#includedir /etc/sudoers.d" >> /mnt/etc/sudoers


# add encrypt to hooks and btrfs to binaries
echo -ne "\e[1m"
echo "Adding encrypt to HOOKS in /etc/mkinitcpio.conf"
echo -ne "\e[0m"
sed -i 's/HOOKS=.*/HOOKS=\(base udev autodetect modconf block filesystems keyboard encrypt fsck\)/' /mnt/etc/mkinitcpio.conf

echo -ne "\e[1m"
echo "Add /usr/bin/btrfs to BINARIES in /etc/mkinitcpio.conf"
echo -ne "\e[0m"
sed -i 's/BINARIES=.*/BINARIES=\(\/usr\/bin\/btrfs\)/' /mnt/etc/mkinitcpio.conf


echo -ne "\e[1m"
echo "Install yay-bin AUR helper"
echo -ne "\e[0m"
YAYURL="https://aur.archlinux.org/yay-bin.git"
YAYPATH="/mnt/home/$arch_username/yay"

git clone "$YAYURL" "$YAYPATH"
arch-chroot -u "$arch_username" /mnt bash -c 'cd /home/$arch_username/yay && makepkg --noconfirm -sip /home/$arch_username/yay/PKGBUILD'


echo -ne "\e[1m"
echo "Enable sshd"
echo -ne "\e[0m"
arch-chroot /mnt systemctl enable sshd.service

echo -ne "\e[1m"
echo "Enable color in pacman.conf"
echo -ne "\e[0m"
sed -i 's/.*Color.*/Color/' /mnt/etc/pacman.conf

echo -ne "\e[1m"
echo "Add repo.delifer.ca"
echo -ne "\e[0m"
echo "[delifer]" >> /mnt/etc/pacman.conf
echo "SigLevel = Optional TrustAll" >> /mnt/etc/pacman.conf
echo "Server = https://repo.delifer.ca/archlinux/x86_64" >> /mnt/etc/pacman.conf

# mkinitcpio
echo -ne "\e[1m"
echo "Generate initramfs"
echo -ne "\e[0m"
arch-chroot /mnt mkinitcpio -p linux

#install systemd-boot to /mnt/boot
echo -ne "\e[1m"
echo "Installing systemd-boot to /mnt/boot"
echo -ne "\e[0m"
arch-chroot /mnt bootctl --path=/boot install


echo -ne "\e[1m"
echo "Creating default boot loader entry, you'll need to modify this depending on your partition layout..."
echo -ne "\e[0m"
mkdir -p /mnt/boot/loader/entries/
cat >/mnt/boot/loader/entries/arch.conf <<EOL
title Arch Linux
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux.img
options root=UUID=${arch_root_uuid} rw  quiet iomem=relaxed
# options rootflags=subvol=@root
# options cryptdevice=/dev/disk/by-uuid/${arch_crypt_uuid}:crypt 
EOL
vim /mnt/boot/loader/entries/arch.conf

echo "See ya!"
