#  ______     ______     __    __     __     __   __     ______
# /\  ___\   /\  __ \   /\ "-./  \   /\ \   /\ "-.\ \   /\  ___\
# \ \ \__ \  \ \  __ \  \ \ \-./\ \  \ \ \  \ \ \-.  \  \ \ \__ \
#  \ \_____\  \ \_\ \_\  \ \_\ \ \_\  \ \_\  \ \_\\"\_\  \ \_____\
#   \/_____/   \/_/\/_/   \/_/  \/_/   \/_/   \/_/ \/_/   \/_____/

CheckConfig gaming || return 0

# kernels
AddPackage linux-xanmod-tt # The Linux kernel and modules with Xanmod patches
AddPackage linux-xanmod-tt-headers # Headers and scripts for building modules for the Linux Xanmod. Development branch with the Task Type CPU Scheduler by Hamad Al Marri kernel
AddPackage linux-zen # The Linux ZEN kernel and modules
AddPackage linux-zen-headers # Headers and scripts for building modules for the Linux ZEN kernel
CopyFile /etc/mkinitcpio.d/linux-xanmod-tt.preset
CopyFile /etc/mkinitcpio.d/linux-zen.preset

# apps
AddPackage steam # Valve's digital software delivery system
AddPackage lutris # Open Gaming Platform

# tools
AddPackage mangohud # A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more
AddPackage mangohud-common # Common files for mangohud and lib32-mangohud
AddPackage lib32-mangohud # A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (32-bit)
AddPackage parsec-bin # Remotely connect to a gaming pc for a low latency remote computing experience

# drivers
AddPackage vkd3d # Direct3D 12 to Vulkan translation library By WineHQ
AddPackage wii-u-gc-adapter # Tool for using the Wii U GameCube Adapter on Linux
AddPackage mesa # An open-source implementation of the OpenGL specification

# proton
AddPackage proton-caller # Run any Windows program through Proton
AddPackage proton-ge-custom-bin # A fancy custom distribution of Valves Proton with various patches
AddPackage protontricks # A simple wrapper that does winetricks things for Proton enabled games.

# libs
AddPackage lib32-gst-plugins-base # GStreamer Multimedia Framework Base Plugins (32-bit)
AddPackage lib32-gst-plugins-good # GStreamer Multimedia Framework Good Plugins (32-bit)
AddPackage lib32-gstreamer # GStreamer open-source multimedia framework core library (32-bit)
AddPackage lib32-libglvnd # The GL Vendor-Neutral Dispatch library
AddPackage lib32-libxslt # XML stylesheet transformation library (32-bit)
AddPackage lib32-openal # Cross-platform 3D audio library, software implementation (32-bit)
AddPackage vulkan-headers # Vulkan header files

AddPackage steam-native-runtime # Native replacement for the Steam runtime using system libraries

# configs
CopyFile /etc/udev/rules.d/51-gcadapter.rules
