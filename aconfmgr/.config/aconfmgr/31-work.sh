#  __     __     ______     ______     __  __
# /\ \  _ \ \   /\  __ \   /\  == \   /\ \/ /
# \ \ \/ ".\ \  \ \ \/\ \  \ \  __<   \ \  _"-.
#  \ \__/".~\_\  \ \_____\  \ \_\ \_\  \ \_\ \_\
#   \/_/   \/_/   \/_____/   \/_/ /_/   \/_/\/_/

CheckConfig work || return 0

# compat
AddPackage flatpak # Linux application sandboxing and distribution framework (formerly xdg-app)
AddPackage freerdp # Free implementation of the Remote Desktop Protocol (RDP)

# gui apps
AddPackage evolution # Manage your email, contacts and schedule
AddPackage evolution-ews # MS Exchange integration through Exchange Web Services
AddPackage teams # Microsoft Teams for Linux is your chat-centered workspace in Office 365
AddPackage webex-bin # Webex for Linux
AddPackage onlyoffice-bin # An office suite that combines text, spreadsheet and presentation editors
AddPackage remmina # remote desktop client written in GTK+
AddPackage microsoft-edge-stable-bin # A browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier
AddPackage libreoffice-fresh # LibreOffice branch which contains new features and program enhancements

# Ansible
AddPackage python-pywinrm # Python library for Windows Remote Management
AddPackage ansible # Official assortment of Ansible collections
AddPackage ansible-lint # Checks playbooks for practices and behaviour that could potentially be improved.
AddPackage python-babel # A collection of tools for internationalizing Python applications
AddPackage python-passlib # A password hashing library for Python
AddPackage ansible-bender # Build container images using Ansible playbooks

# dev tools
AddPackage ccollab-client10 # Collaborator Client
AddPackage rpm-tools # RPM Package Manager - RPM.org fork, used in major RPM distros
AddPackage powershell-bin # A cross-platform automation and configuration tool/framework (binary package)
AddPackage conan # A distributed, open source, C/C++ package manager.
AddPackage tk # A windowing toolkit for use with tcl
AddPackage nodejs # Evented I/O for V8 javascript
AddPackage nodejs-gitlab-ci-lint # GitLab CI/CD cli to lint .gitlab-ci.yml files
AddPackage nfs-utils # Support programs for Network File Systems

# vmware
AddPackage vmware-workstation # The industry standard for running multiple operating systems as virtual machines on a single Linux PC.
CreateLink /etc/systemd/system/multi-user.target.wants/vmware-networks.service /usr/lib/systemd/system/vmware-networks.service
CreateLink /etc/systemd/system/multi-user.target.wants/vmware-usbarbitrator.service /usr/lib/systemd/system/vmware-usbarbitrator.service

# l2tp vpn
AddPackage networkmanager-l2tp # L2TP support for NetworkManager
AddPackage strongswan # Open source IPsec implementation

# zcas dns
CopyFile /etc/systemd/system/set-zcasdns.service
CreateLink /etc/systemd/system/multi-user.target.wants/set-zcasdns.service /etc/systemd/system/set-zcasdns.service
CopyFile /etc/systemd/system/set-zcasdns.timer
CreateLink /etc/systemd/system/timers.target.wants/set-zcasdns.timer /etc/systemd/system/set-zcasdns.timer
