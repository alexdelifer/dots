#  __  __     ______     ______     _____     ______     __   __
# /\ \_\ \   /\  __ \   /\  == \   /\  __-.  /\  ___\   /\ "-.\ \
# \ \  __ \  \ \  __ \  \ \  __<   \ \ \/\ \ \ \  __\   \ \ \-.  \
#  \ \_\ \_\  \ \_\ \_\  \ \_\ \_\  \ \____-  \ \_____\  \ \_\\"\_\
#   \/_/\/_/   \/_/\/_/   \/_/ /_/   \/____/   \/_____/   \/_/ \/_/

CheckConfig harden || return 0

# ucode patches
AddPackage intel-ucode # Microcode update files for Intel CPUs

# aide
AddPackage aide # A file integrity checker and intrusion detection program.
CopyFile /etc/aide.conf
CopyFile /etc/systemd/system/aidecheck.service
CopyFile /etc/systemd/system/aidecheck.timer
CreateLink /etc/systemd/system/multi-user.target.wants/aidecheck.service /etc/systemd/system/aidecheck.service
CreateLink /etc/systemd/system/multi-user.target.wants/aidecheck.timer /etc/systemd/system/aidecheck.timer


# audit
CopyFile /etc/audit/audit.rules 640
CopyFile /etc/audit/audit.rules.prev 640
CopyFile /etc/audit/rules.d/rules.rules

# sshd
CopyFile /etc/ssh/ssh_config

# sudo
CopyFile /etc/sudoers


