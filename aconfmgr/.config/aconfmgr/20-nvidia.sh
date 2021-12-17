#  __   __     __   __   __     _____     __     ______
# /\ "-.\ \   /\ \ / /  /\ \   /\  __-.  /\ \   /\  __ \
# \ \ \-.  \  \ \ \'/   \ \ \  \ \ \/\ \ \ \ \  \ \  __ \
#  \ \_\\"\_\  \ \__|    \ \_\  \ \____-  \ \_\  \ \_\ \_\
#   \/_/ \/_/   \/_/      \/_/   \/____/   \/_/   \/_/\/_/

CheckConfig nvidia || return 0
CheckNvidiaGPU nvidia || return 0

# Drivers
AddPackage lib32-nvidia-dev-utils-tkg # NVIDIA driver utilities and libraries for 'nvidia-tkg' (32-bit)
AddPackage lib32-opencl-nvidia-dev-tkg # NVIDIA's OpenCL implemention for 'lib32-nvidia-utils-tkg'
AddPackage nvidia-dev-dkms-tkg # NVIDIA kernel module sources (DKMS)
AddPackage nvidia-dev-egl-wayland-tkg # NVIDIA EGL Wayland library (libnvidia-egl-wayland.so.1.1.7) for 'nvidia-utils-tkg'
AddPackage nvidia-dev-settings-tkg # Tool for configuring the NVIDIA graphics driver
AddPackage nvidia-dev-utils-tkg # NVIDIA driver utilities and libraries for 'nvidia-tkg'
AddPackage opencl-nvidia-dev-tkg # NVIDIA's OpenCL implemention for 'nvidia-utils-tkg'
AddPackage vdpauinfo # Command line utility for querying the capabilities of a VDPAU device
AddPackage libva-vdpau-driver # VDPAU backend for VA API
AddPackage libvdpau-va-gl # VDPAU driver with OpenGL/VAAPI backend
AddPackage libxnvctrl # NVIDIA NV-CONTROL X extension

# Tools
AddPackage nvtop # An htop like monitoring tool for NVIDIA GPUs

# WM
AddPackage --foreign wlroots-no-axrgb-assert-git # wlroots-git, with argb/xrgb8888 assert removed to make nvidia driver work

# Configs
CopyFile /etc/modprobe.d/nvidia.conf
CopyFile /etc/pacman.d/hooks/nvidia.hook
CopyFile /etc/udev/rules.d/70-nvidia.rules