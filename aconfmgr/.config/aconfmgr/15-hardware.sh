AddPackage mesa # Open-source OpenGL drivers
AddPackage vulkan-headers # Vulkan header files and API registry
AddPackage vulkan-tools # Vulkan tools and utilities


# Intel CPU
if grep -qi "GenuineIntel" /proc/cpuinfo; then
    echo "Intel CPU detected"
    AddPackage intel-ucode # Microcode update files for Intel CPUs

fi

# AMD CPU
if grep -qi "AuthenticAMD" /proc/cpuinfo; then
    echo "AMD CPU detected"
fi

# Intel GPU
if lspci | grep -qi "VGA.*Intel"; then
    echo "Intel GPU detected"
    AddPackage intel-gpu-tools # Tools for development and testing of the Intel DRM driver
    AddPackage libva-intel-driver # VA-API implementation for Intel G45 and HD Graphics family
    AddPackage libva-utils # Intel VA-API Media Applications and Scripts for libva
fi

# AMD GPU
if lspci | grep -qi "VGA.*AMD"; then
    echo "AMD GPU detected"
    AddPackage xf86-video-amdgpu # X.org amdgpu video driver
    AddPackage lib32-vulkan-radeon # Open-source Vulkan driver for AMD GPUs - 32-bit
    AddPackage opencl-amd # ROCm components repackaged from AMD's Ubuntu releases (ROCr runtime, ROCm runtime, HIP runtime) - This package is intended to work along with the free amdgpu stack.
    AddPackage rocm-hip-sdk # Develop applications using HIP and libraries for AMD platforms
    AddPackage vulkan-radeon # Open-source Vulkan driver for AMD GPUs
    AddPackage radeontop # View GPU utilization for total activity percent and individual blocks

    AddPackage --foreign amd-vulkan-prefixes # Select needed vulkan implementation with vk_radv, vk_amdvlk or vk_pro prefix
    AddPackage --foreign zluda # A drop-in replacement for CUDA on non-NVIDIA GPUs

fi

# NVIDIA GPU
if lspci | grep -qi "VGA.*NVIDIA"; then
    echo "NVIDIA GPU detected"
fi

# Bluetooth support
if [[ -n "$(ls /sys/class/bluetooth 2>/dev/null)" ]]; then
    echo "Bluetooth device detected"
    AddPackage blueman # GTK+ Bluetooth Manager
    AddPackage bluez # Daemons for the bluetooth protocol stack
    AddPackage bluez-hid2hci # Put HID proxying bluetooth HCI's into HCI mode
    AddPackage bluez-tools # A set of tools to manage Bluetooth devices for Linux
    AddPackage bluez-utils # Development and debugging utilities for the bluetooth protocol stack
fi

# WiFi
if ls /sys/class/net/*/wireless >/dev/null 2>&1; then
    echo "Wi-Fi adapter detected"
    AddPackage iwd # Internet Wireless Daemon
    AddPackage wireless_tools # Tools allowing to manipulate the Wireless Extensions
    AddPackage wpa_supplicant # A utility providing key negotiation for WPA wireless networks

fi

# Desktop Only
if [ ! -d /sys/class/power_supply/BAT0 ]; then
    echo "Desktop detected"
    CreateLink /etc/systemd/system/suspend.target /dev/null
    CopyFile /etc/profile.d/multi-gpu.sh
    CopyFile /etc/modules-load.d/i2c.conf
fi

AddPackage qmk # CLI tool for customizing supported mechanical keyboards.

# network
AddPackage network-manager-applet # Applet for managing network connections
AddPackage networkmanager # Network connection manager and user applications
AddPackage networkmanager-l2tp # NetworkManager VPN plugin for L2TP (with GUI)
AddPackage modem-manager-gui # Frontend for ModemManager daemon able to control specific modem functions
AddPackage modemmanager # Mobile broadband modem management service
AddPackage strongswan # Open source IPsec implementation
AddPackage openfortivpn # An open implementation of Fortinet's proprietary PPP+SSL VPN solution


# filesystem support
AddPackage lvm2 # Logical Volume Manager 2 utilities

AddPackage btrfs-progs # Btrfs filesystem utilities
AddPackage dosfstools # DOS filesystem utilities
AddPackage e2fsprogs # Ext2/3/4 filesystem utilities
AddPackage f2fs-tools # Tools for Flash-Friendly File System (F2FS)
AddPackage guestfs-tools # Tools for accessing and modifying guest disk images
AddPackage jfsutils # JFS filesystem utilities
AddPackage nfs-utils # Support programs for Network File Systems
AddPackage udftools # Linux tools for UDF filesystems and DVD/CD-R(W) drives
AddPackage ifuse # A fuse filesystem to access the contents of an iPhone or iPod Touch
AddPackage fuseiso # FUSE module to mount ISO filesystem images
AddPackage --foreign jmtpfs # FUSE and libmtp based filesystem for accessing MTP (Media Transfer Protocol) devices
