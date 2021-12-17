#  __  __     ______     ______     __  __     ______     ______
# /\ \_\ \   /\  __ \   /\  ___\   /\ \/ /    /\  ___\   /\  == \
# \ \  __ \  \ \  __ \  \ \ \____  \ \  _"-.  \ \  __\   \ \  __<
#  \ \_\ \_\  \ \_\ \_\  \ \_____\  \ \_\ \_\  \ \_____\  \ \_\ \_\
#   \/_/\/_/   \/_/\/_/   \/_____/   \/_/\/_/   \/_____/   \/_/ /_/

CheckConfig hacker || return 0

# reversing
AddPackage ghidra # Software reverse engineering framework

# cracking
AddPackage hydra # Very fast network logon cracker which support many different services

# pivot
AddPackage proxychains-ng # A hook preloader that allows to redirect TCP traffic of existing dynamically linked programs through one or more SOCKS or HTTP proxies
CopyFile /etc/proxychains.conf

# network recon
AddPackage nmap # Utility for network discovery and security auditing
AddPackage wireshark-cli # Network traffic and protocol analyzer/sniffer - CLI tools and data files
AddPackage wireshark-qt # Network traffic and protocol analyzer/sniffer - Qt GUI
AddPackage termshark # Terminal UI for tshark, inspired by Wireshark

# other
AddPackage impacket # Collection of classes for working with network protocols
AddPackage torbrowser-launcher # Securely and easily download, verify, install, and launch Tor Browser in Linux
AddPackage blackarch-keyring # BlackArch Linux PGP keyring.

