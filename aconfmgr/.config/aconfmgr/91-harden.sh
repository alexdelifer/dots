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
CopyFile /etc/ssh/sshd_config

# sudo
CopyFile /etc/sudoers

# authselect
AddPackage authselect # Authselect is a tool to select system authentication and identity sources from a list of supported profiles.
CopyFile /etc/authselect/authselect.conf
CopyFile /etc/authselect/dconf-db
CopyFile /etc/authselect/dconf-locks
CopyFile /etc/authselect/fingerprint-auth
CopyFile /etc/authselect/nsswitch.conf
CopyFile /etc/authselect/password-auth
CopyFile /etc/authselect/postlogin
CopyFile /etc/authselect/smartcard-auth
CopyFile /etc/authselect/system-auth
CopyFile /etc/dconf/db/distro
CreateLink /etc/dconf/db/distro.d/20-authselect /etc/authselect/dconf-db
CreateLink /etc/dconf/db/distro.d/locks/20-authselect /etc/authselect/dconf-locks
CreateLink /etc/nsswitch.conf /etc/authselect/nsswitch.conf
CreateLink /etc/pam.d/fingerprint-auth /etc/authselect/fingerprint-auth
CreateLink /etc/pam.d/password-auth /etc/authselect/password-auth
CreateLink /etc/pam.d/postlogin /etc/authselect/postlogin
CreateLink /etc/pam.d/smartcard-auth /etc/authselect/smartcard-auth
CreateLink /etc/pam.d/system-auth /etc/authselect/system-auth
CopyFile /etc/security/pwquality.conf


# clamav
AddPackage clamav # Anti-virus toolkit for Unix
CreateLink /etc/systemd/system/multi-user.target.wants/clamav-clamonacc.service /usr/lib/systemd/system/clamav-clamonacc.service
CreateLink /etc/systemd/system/multi-user.target.wants/clamav-daemon.service /usr/lib/systemd/system/clamav-daemon.service
CreateLink /etc/systemd/system/multi-user.target.wants/clamav-freshclam.service /usr/lib/systemd/system/clamav-freshclam.service
CreateLink /etc/systemd/system/multi-user.target.wants/iptables.service /usr/lib/systemd/system/iptables.service
CreateLink /etc/systemd/system/sockets.target.wants/clamav-daemon.socket /usr/lib/systemd/system/clamav-daemon.socket

# firewall
AddPackage firewalld # Firewall daemon with D-Bus interface
CreateLink /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service /usr/lib/systemd/system/firewalld.service
CreateLink /etc/systemd/system/multi-user.target.wants/firewalld.service /usr/lib/systemd/system/firewalld.service

# cron & at
CreateFile /etc/at.allow 600 > /dev/null
CreateFile /etc/cron.allow 600 > /dev/null

# filesystems
CopyFile /etc/modprobe.d/98-filesystems.conf
CopyFile /etc/udisks2/mount_options.conf
CopyFile /etc/sysctl.d/51-fs-protect.conf

# coredumps
CopyFile /etc/security/limits.d/01-coredump.conf
CopyFile /etc/sysctl.d/01-coredump.conf

# sudo logs
CopyFile /etc/sudoers.d/01-logs.conf

# bpfjit
CopyFile /etc/sysctl.d/51-bpfjit-harden.conf

# metrics
CopyFile /etc/sysctl.d/52-perf-harden.conf
CopyFile /etc/sysctl.d/53-kptr-restrict.conf
CopyFile /etc/sysctl.d/54-dmesg-restrict.conf

# hidepid
CopyFile /etc/systemd/system/systemd-logind.service.d/hidepid.conf

