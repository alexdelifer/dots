#  __   __     __   __   __     _____     __     ______
# /\ "-.\ \   /\ \ / /  /\ \   /\  __-.  /\ \   /\  __ \
# \ \ \-.  \  \ \ \'/   \ \ \  \ \ \/\ \ \ \ \  \ \  __ \
#  \ \_\\"\_\  \ \__|    \ \_\  \ \____-  \ \_\  \ \_\ \_\
#   \/_/ \/_/   \/_/      \/_/   \/____/   \/_/   \/_/\/_/

CheckConfig nvidia || return 0
CheckNvidiaGPU nvidia || return 0

# Drivers
AddPackage nvidia-settings # Tool for configuring the NVIDIA graphics driver
AddPackage nvidia-dkms # NVIDIA drivers - module sources
AddPackage nvidia-utils # NVIDIA drivers utilities
AddPackage opencl-nvidia # OpenCL implemention for NVIDIA
AddPackage vdpauinfo # Command line utility for querying the capabilities of a VDPAU device
AddPackage libva-vdpau-driver # VDPAU backend for VA API
AddPackage libvdpau-va-gl # VDPAU driver with OpenGL/VAAPI backend
AddPackage libxnvctrl # NVIDIA NV-CONTROL X extension
AddPackage lib32-nvidia-cg-toolkit # NVIDIA Cg libraries
AddPackage lib32-nvidia-utils # NVIDIA drivers utilities (32-bit)
AddPackage lib32-opencl-nvidia # OpenCL implemention for NVIDIA (32-bit)

# Tools
AddPackage nvtop # An htop like monitoring tool for NVIDIA GPUs

# Configs
CopyFile /etc/modprobe.d/nvidia.conf
CopyFile /etc/pacman.d/hooks/nvidia.hook
CopyFile /etc/udev/rules.d/70-nvidia.rules