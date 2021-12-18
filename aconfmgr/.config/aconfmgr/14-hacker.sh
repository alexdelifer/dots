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

AddPackage macchanger # A small utility to change your NIC's MAC address
AddPackage wifite # Tool to attack multiple WEP and WPA encrypted networks at the same time
AddPackage wireless_tools # Tools allowing to manipulate the Wireless Extensions
AddPackage tor # Anonymizing overlay network.
CreateLink /etc/systemd/system/multi-user.target.wants/tor.service /usr/lib/systemd/system/tor.service
AddPackage terminator # Terminal emulator that supports tabs and grids
AddPackage socat # Multipurpose relay
AddPackage scapy # Powerful interactive packet manipulation program written in Python (tools)
AddPackage reaver # Brute force attack against Wifi Protected Setup
AddPackage rdesktop # An open source client for Windows Remote Desktop Services
AddPackage bully # Retrieve WPA/WPA2 passphrase from a WPS enabled access point


AddPackage python-crcmod # Cyclic Redundancy Check (CRC) implementation in Python.
AddPackage python-pyserial # Multiplatform Serial Port Module for Python
AddPackage python-requests-credssp # HTTPS CredSSP authentication with the requests library
AddPackage python-requests-kerberos # A kerberos of useful classes and functions to be used with python-requests.

AddPackage bettercap # Swiss army knife for network attacks and monitoring
AddPackage bettercap-caplets # Bettercap scripts (caplets) and proxy modules
AddPackage bettercap-ui # Official Bettercap's Web UI.

AddPackage hashcat # Multithreaded advanced password recovery utility
AddPackage hcxdumptool # Small tool to capture packets from wlan devices
AddPackage hcxtools # Portable solution for capturing wlan traffic and conversion to hashcat and John the Ripper formats
AddPackage pixiewps # Offline bruteforce of the WPS pin exploiting the low or non-existing entropy of some APs

AddPackage gss-ntlmssp # A GSSAPI Mechanism that implements NTLMSSP
AddPackage cowpatty # Wireless WPA/WPA2 PSK handshake cracking utility

AddPackage armitage # A graphical cyber attack management tool for Metasploit.
AddPackage netdiscover # An active/passive address reconnaissance tool, mainly developed for those wireless networks without dhcp server, when you are wardriving. It can be also used on hub/switched networks.


AddPackage bridge-utils # Utilities for configuring the Linux ethernet bridge
AddPackage arp-scan # A tool that uses ARP to discover and fingerprint IP hosts on the local network
AddPackage aircrack-ng # Key cracker for the 802.11 WEP and WPA-PSK protocols

AddPackage dislocker # Read BitLocker encrypted volumes under Linux.

# dkms
AddPackage pfring-dkms # Linux kernel module for packet capture at wirespeed.
AddPackage rtl88xxau-aircrack-dkms-git # Aircrack-ng kernel module for Realtek 88XXau (USB adapters only) network cards (8811au, 8812au and 8821au chipsets) with monitor mode and injection support

AddPackage veil # A tool designed to generate metasploit payloads that bypass common anti-virus solutions.
AddPackage wesng # Windows Exploit Suggester - Next Generation.

AddPackage pyrit # The famous WPA precomputed cracker
AddPackage pcredz # A tool that extracts credit card numbers, NTLM(DCE-RPC, HTTP, SQL, LDAP, etc), Kerberos (AS-REQ Pre-Auth etype 23), HTTP Basic, SNMP, POP, SMTP, FTP, IMAP, and more from a pcap file or from a live interface.


AddPackage metasploit # Advanced open-source platform for developing, testing, and using exploit code
