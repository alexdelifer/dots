#  __  __     __   __     ______     ______     ______     ______   ______     _____
# /\ \/\ \   /\ "-.\ \   /\  ___\   /\  __ \   /\  == \   /\__  _\ /\  ___\   /\  __-.
# \ \ \_\ \  \ \ \-.  \  \ \___  \  \ \ \/\ \  \ \  __<   \/_/\ \/ \ \  __\   \ \ \/\ \
#  \ \_____\  \ \_\\"\_\  \/\_____\  \ \_____\  \ \_\ \_\    \ \_\  \ \_____\  \ \____-
#   \/_____/   \/_/ \/_/   \/_____/   \/_____/   \/_/ /_/     \/_/   \/_____/   \/____/


# unsorted

CopyFile /etc/pacman.d/delifer
CopyFile /etc/.updated
CopyFile /etc/hosts
CopyFile /etc/pacman.d/mirrorlist

# systemd
CopyFile /etc/systemd/system.conf
CopyFile /etc/systemd/user.conf



# Wed Apr  6 05:09:46 PM EDT 2022 - Unknown packages


AddPackage aspnet-runtime # The ASP.NET Core runtime
AddPackage aspnet-targeting-pack # The ASP.NET Core targeting pack
AddPackage atool # A script for managing file archives of various types
AddPackage gitleaks # Audit Git repos for secrets and keys.
AddPackage jupyterlab # JupyterLab computational environment
AddPackage linux-zen-headers # Headers and scripts for building modules for the Linux ZEN kernel
AddPackage mame-tools # Port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support (tools)
AddPackage nvidia-settings # Tool for configuring the NVIDIA graphics driver
AddPackage powershell # A cross-platform automation and configuration tool/framework (latest release)
AddPackage python-semgrep # Lightweight static analysis for many languages.
AddPackage qdirstat # Qt-based directory statistics (KDirStat/K4DirStat without any KDE - from the original KDirStat author)
AddPackage restic # Fast, secure, efficient backup program


# Wed Apr  6 05:09:47 PM EDT 2022 - Missing packages


RemovePackage powershell-bin
RemovePackage udevil


# Wed Apr  6 05:09:47 PM EDT 2022 - Unknown foreign packages


AddPackage --foreign autorestic-bin # High level CLI utility for restic
AddPackage --foreign udevil # Mount and unmount without password


# Wed Apr  6 05:09:47 PM EDT 2022 - Missing foreign packages


RemovePackage --foreign atool


# Wed Apr  6 05:09:47 PM EDT 2022 - Extra files


RemoveFile /etc/systemd/system/sockets.target.wants/clamav-daemon.socket
RemoveFile /etc/systemd/system/multi-user.target.wants/zerotier-one.service
RemoveFile /etc/systemd/system/multi-user.target.wants/clamav-freshclam.service
RemoveFile /etc/systemd/system/multi-user.target.wants/clamav-daemon.service
RemoveFile /etc/systemd/system/multi-user.target.wants/clamav-clamonacc.service


# Wed Apr  6 05:09:47 PM EDT 2022 - New / changed files


CopyFile /etc/hosts
CopyFile /etc/pacman.d/hooks/nvidia.hook


# Fri Apr  8 07:32:05 PM EDT 2022 - Unknown foreign packages


AddPackage --foreign codeclimate # Command line interface for the Code Climate analysis platform. It allows you to run Code Climate engines on your local machine inside of Docker containers. Make sure that your current user belongs to docker group and that docker is running.


# Fri Apr  8 07:32:05 PM EDT 2022 - Extra files


RemoveFile /etc/pacman.d/chaotic-mirrorlist


# Fri Apr  8 07:32:05 PM EDT 2022 - New / changed files


CopyFile /etc/.updated


# Fri Apr  8 07:39:12 PM EDT 2022 - New / changed files


CreateFile /etc/pacman.d/gnupg/.gpg-v21-migrated > /dev/null
CopyFile /etc/pacman.d/gnupg/crls.d/DIR.txt
CopyFile /etc/pacman.d/gnupg/gpg-agent.conf
CopyFile /etc/pacman.d/gnupg/gpg.conf
CopyFile /etc/pacman.d/gnupg/openpgp-revocs.d/DA6476052541196B46CB41B314650D7CDFE59073.rev 600
CopyFile /etc/pacman.d/gnupg/private-keys-v1.d/C395A3E9D1D2C919B3C139D773FE7B1B080D9F41.key 600
CopyFile /etc/pacman.d/gnupg/pubring.gpg
CopyFile /etc/pacman.d/gnupg/pubring.gpg~
CreateFile /etc/pacman.d/gnupg/secring.gpg 600 > /dev/null
CopyFile /etc/pacman.d/gnupg/tofu.db
CopyFile /etc/pacman.d/gnupg/trustdb.gpg


# Fri Apr  8 07:39:12 PM EDT 2022 - New file properties


SetFileProperty /etc/pacman.d/gnupg/crls.d mode 700
SetFileProperty /etc/pacman.d/gnupg/openpgp-revocs.d mode 700
SetFileProperty /etc/pacman.d/gnupg/private-keys-v1.d mode 700
