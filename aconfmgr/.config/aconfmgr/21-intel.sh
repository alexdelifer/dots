#  __     __   __     ______   ______     __
# /\ \   /\ "-.\ \   /\__  _\ /\  ___\   /\ \
# \ \ \  \ \ \-.  \  \/_/\ \/ \ \  __\   \ \ \____
#  \ \_\  \ \_\\"\_\    \ \_\  \ \_____\  \ \_____\
#   \/_/   \/_/ \/_/     \/_/   \/_____/   \/_____/

CheckConfig intel || return 0
CheckIntelGPU intel || return 0

# Drivers
AddPackage intel-media-driver # Intel Media Driver for VAAPI — Broadwell+ iGPUs
AddPackage libva-intel-driver # VA-API implementation for Intel G45 and HD Graphics family
AddPackage libva-utils # Intel VA-API Media Applications and Scripts for libva
AddPackage xf86-video-intel # X.org Intel i810/i830/i915/945G/G965+ video drivers

CopyFile /etc/modprobe.d/i915.conf
