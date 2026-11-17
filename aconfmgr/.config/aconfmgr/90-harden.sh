CheckConfig harden || return 0


CreateFile /etc/at.allow 600 > /dev/null
CreateFile /etc/cron.allow 600 > /dev/null

CopyFile /etc/audit/audit.rules 640
CopyFile /etc/audit/audit.rules.prev 640
CopyFile /etc/audit/rules.d/rules.rules
CopyFile /etc/authselect/authselect.conf
CopyFile /etc/authselect/dconf-db
CopyFile /etc/authselect/dconf-locks
CopyFile /etc/authselect/fingerprint-auth
CopyFile /etc/authselect/nsswitch.conf
CopyFile /etc/authselect/password-auth
CopyFile /etc/authselect/postlogin
CopyFile /etc/authselect/smartcard-auth
CopyFile /etc/authselect/system-auth

CopyFile /etc/pam.d/login
CopyFile /etc/pam.d/passwd

CopyFile /etc/security/limits.conf
CopyFile /etc/security/limits.d/01-coredump.conf
CreateFile /etc/security/limits.d/10.hardcore.conf > /dev/null
CopyFile /etc/security/pwquality.conf

CopyFile /etc/ssh/ssh_config
CopyFile /etc/ssh/sshd_config

CopyFile /etc/sudoers
CopyFile /etc/sudoers.d/01-logs.conf

CopyFile /etc/sysctl.d/01-coredump.conf
CopyFile /etc/sysctl.d/10-network-tuning.conf
CopyFile /etc/sysctl.d/20-ping.conf
CopyFile /etc/sysctl.d/51-bpfjit-harden.conf
CopyFile /etc/sysctl.d/51-fs-protect.conf
CopyFile /etc/sysctl.d/52-perf-harden.conf
CopyFile /etc/sysctl.d/53-kptr-restrict.conf
CopyFile /etc/sysctl.d/54-dmesg-restrict.conf
CopyFile /etc/sysfs.conf

CopyFile /etc/systemd/system/systemd-logind.service.d/hidepid.conf
