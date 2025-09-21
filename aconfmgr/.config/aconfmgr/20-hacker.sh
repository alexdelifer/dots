AddPackage blackarch-keyring # BlackArch Linux PGP keyring.


AddPackage aircrack-ng # Key cracker for the 802.11 WEP and WPA-PSK protocols
AddPackage arp-scan # A tool that uses ARP to discover and fingerprint IP hosts on the local network
AddPackage armitage # A graphical cyber attack management tool for Metasploit.
AddPackage bettercap # Swiss army knife for network attacks and monitoring
AddPackage bettercap-caplets # Bettercap scripts (caplets) and proxy modules
AddPackage bettercap-ui # Official Bettercap's Web UI.
AddPackage burpsuite # An integrated platform for performing security testing of web applications (free edition)
AddPackage chirp-next # GUI tool for programming ham radios
AddPackage chipsec # Platform Security Assessment Framework.
AddPackage clamav # Anti-virus toolkit for Unix
AddPackage cmseek # CMS (Content Management Systems) Detection and Exploitation suite.
AddPackage coercer # Coerce a Windows server to authenticate on an arbitrary machine through 15 methods.
AddPackage dislocker # Read/write BitLocker-encrypted volumes
AddPackage donut # Generates x86, x64 or AMD64+x86 P.I. shellcode loading .NET Assemblies from memory.
AddPackage feroxbuster # A fast, simple, recursive content discovery tool written in Rust.
AddPackage ffuf # Fast web fuzzer written in Go.
AddPackage flare-floss # Obfuscated String Solver - Automatically extract obfuscated strings from malware.
AddPackage flawfinder # Searches through source code for potential security flaws
AddPackage ghidra # Software reverse engineering framework
AddPackage hackrf # Driver for HackRF, allowing general purpose software defined radio (SDR)
AddPackage hashcat # Multithreaded advanced password recovery utility
AddPackage hcxdumptool # Small tool to capture packets from wlan devices
AddPackage hcxtools # Portable solution for capturing wlan traffic and conversion to hashcat and John the Ripper formats
AddPackage impacket # Collection of classes for working with network protocols
AddPackage jd-gui # A standalone graphical utility that displays Java source codes of .class files.
AddPackage jad # Java decompiler
AddPackage john # John the Ripper password cracker
AddPackage jython # An implementation of the Python language written in Java
AddPackage macchanger # A small utility to change your NIC's MAC address
AddPackage masscan # TCP port scanner, spews SYN packets asynchronously, scanning entire Internet in under 5 minutes
AddPackage metasploit # Advanced open-source platform for developing, testing, and using exploit code
AddPackage mitm6 # Pwning IPv4 via IPv6.
AddPackage nbtscan # Scan networks searching for NetBIOS information
AddPackage onesixtyone # An SNMP scanner that sends multiple SNMP requests to multiple IP addresses
AddPackage pcredz # A tool that extracts credit card numbers and more from a pcap file or from a live interface.
AddPackage proxychains-ng # A hook preloader that allows to redirect TCP traffic of existing dynamically linked programs through one or more SOCKS or HTTP proxies
AddPackage pwgen # Password generator for creating easily memorable passwords
AddPackage pwninit # Automate starting binary exploit challenges
AddPackage python-pwntools # CTF framework and exploit development library
AddPackage qflipper # Desktop application for updating Flipper Zero firmware via PC
AddPackage radare2 # Open-source tools to disasm, debug, analyze and manipulate binary files
AddPackage reaver # Brute force attack against Wifi Protected Setup
AddPackage recon-ng # A full-featured Web Reconnaissance framework written in Python.
AddPackage responder # A LLMNR and NBT-NS poisoner, with built-in HTTP/SMB/MSSQL/FTP/LDAP rogue authentication server supporting NTLMv1/NTLMv2/LMv2 (multirelay version).
AddPackage samdump2 # Dump password hashes from a Windows NT/2k/XP installation
AddPackage seclists # A collection of multiple types of lists used during security assessments.
AddPackage skiptracer # OSINT python2 webscraping framework. Skipping the needs of API keys.
AddPackage snallygaster # Tool to scan for secret files on HTTP servers.
AddPackage spiderfoot # The Open Source Footprinting Tool.
AddPackage wireshark-cli # Network traffic and protocol analyzer/sniffer - CLI tools and data files
AddPackage wireshark-qt # Network traffic and protocol analyzer/sniffer - Qt GUI
AddPackage sqlmap # Automatic SQL injection and database takeover tool
AddPackage socat # Multipurpose relay
AddPackage semgrep # Lightweight static analysis for many languages.
AddPackage scapy # Powerful interactive packet manipulation program written in Python (tools)
AddPackage r2ghidra # Deep ghidra decompiler integration for radare2 and iaito
AddPackage pixiewps # Offline bruteforce of the WPS pin exploiting the low or non-existing entropy of some APs
AddPackage osslsigncode # A small tool that implements part of the functionality of the Microsoft tool signtool.exe.
AddPackage one_gadget # The best tool for finding one gadget RCE in libc.so.6
AddPackage nmap # Utility for network discovery and security auditing
AddPackage bully # Retrieve WPA/WPA2 passphrase from a WPS enabled access point
AddPackage hping # A command-line oriented TCP/IP packet assembler/analyzer.
AddPackage pcileech # Tool, which uses PCIe hardware devices to read and write from the target system memory.
AddPackage wifite # Tool to attack multiple WEP and WPA encrypted networks at the same time
AddPackage atlas # Open source tool that can suggest sqlmap tampers to bypass WAF/IDS/IPS.
AddPackage binwalk # Tool for searching a given binary image for embedded files
AddPackage cowpatty # Wireless WPA/WPA2 PSK handshake cracking utility
AddPackage dnsmasq # Lightweight, easy to configure DNS forwarder and DHCP server
AddPackage openbsd-netcat # TCP/IP swiss army knife. OpenBSD variant.
AddPackage termshark # Terminal UI for tshark, inspired by Wireshark
AddPackage testssl.sh # Testing TLS/SSL encryption
AddPackage vbindiff # displays files in hexadecimal and ASCII (or EBCDIC) and highlight the differences between them
AddPackage wesng # Windows Exploit Suggester - Next Generation.
AddPackage whatweb # Next generation web scanner that identifies what websites are running.
AddPackage bandit # Python security linter from OpenStack Security
AddPackage pyrit # The famous WPA precomputed cracker.
AddPackage sdrpp # The bloat-free SDR receiver.
AddPackage uefi-firmware-parser # Parse BIOS/Intel ME/UEFI firmware related structures: Volumes, FileSystems, Files, etc.
AddPackage zaproxy # Integrated penetration testing tool for finding vulnerabilities in web applications
AddPackage netdiscover # An active/passive address reconnaissance tool, mainly developed for those wireless networks without dhcp server, when you are wardriving. It can be also used on hub/switched networks.
AddPackage websockify # WebSocket to TCP proxy/bridge.
AddPackage uefitool-git # UEFI firmware image viewer and editor and utilities


AddPackage --foreign ruby-evil-winrm # Evil-WinRM
AddPackage --foreign rockyou # The popular "rockyou" password list from OWASP SecLists project
AddPackage --foreign readpe # PE file analysis toolkit
AddPackage --foreign objconv # Object file converter and disassembler
AddPackage --foreign burpsuite-pro # An integrated platform for performing security testing of web applications (professional edition)

CopyFile /etc/proxychains.conf
