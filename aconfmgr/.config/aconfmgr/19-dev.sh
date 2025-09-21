CheckConfig dev || return 0


# ASP + Dotnet
AddPackage aspnet-runtime # The ASP.NET Core runtime
AddPackage aspnet-targeting-pack # The ASP.NET Core targeting pack
AddPackage dotnet-host # A generic driver for the .NET Core Command Line Interface
AddPackage dotnet-runtime # The .NET Core runtime
AddPackage dotnet-sdk # The .NET Core SDK

# Python
AddPackage python-babel # A collection of tools for internationalizing Python applications
AddPackage python-crcmod # Module for generating objects that compute the Cyclic Redundancy Check (CRC)
AddPackage python-lockfile # Platform-independent file locking module
AddPackage python-matplotlib # A python plotting library, making publication quality plots
AddPackage python-mechanicalsoup # A Python library for automating interaction with websites.
AddPackage python-numpy # Scientific tools for Python
AddPackage python-passlib # A password hashing library for Python
AddPackage python-pip # The PyPA recommended tool for installing Python packages
AddPackage python-plyvel # A fast and feature-rich Python interface to LevelDB
AddPackage python-pyclip # Cross-platform clipboard utilities supporting both binary and text data
AddPackage python-pynvim # Python client for Neovim
AddPackage python-pyproject-api # API to interact with the python pyproject.toml based projects
AddPackage python-pyproject-metadata # PEP 621 metadata parsing
AddPackage python-pyproject-parser # Parser for pyproject.toml
AddPackage python-pyserial # Multiplatform Serial Port Module for Python
AddPackage python-pywinrm # Python library for Windows Remote Management
AddPackage python-ratelimit # API rate limit decorator.
AddPackage python-requests-credssp # HTTPS CredSSP authentication with the requests library
AddPackage python-tokenizers # Fast State-of-the-Art Tokenizers optimized for Research and Production
AddPackage python2-pip # The PyPA recommended tool for installing Python packages.
AddPackage python-service-identity # Service identity verification for pyOpenSSL
AddPackage python-updog # A replacement for Python's SimpleHTTPServer.

# Other
AddPackage gettext # GNU internationalization library
AddPackage go # Core compiler tools for the Go programming language
AddPackage --foreign shellcheck-bin # Shell script analysis tool (binary release, static)

# Java
AddPackage gradle # Powerful build system for the JVM
AddPackage icedtea-web # Additional components for OpenJDK - Browser plug-in and Web Start implementation
AddPackage jdk # Oracle Java Development Kit
AddPackage jdk17-openjdk # OpenJDK Java 17 development kit
AddPackage jdk8-openjdk # OpenJDK Java 8 development kit
AddPackage jre8-openjdk # OpenJDK Java 8 full runtime environment
AddPackage jre8-openjdk-headless # OpenJDK Java 8 headless runtime environment

# QEMU
AddPackage qemu-block-gluster # QEMU Gluster block driver
AddPackage qemu-block-iscsi # QEMU iSCSI block driver
AddPackage qemu-emulators-full # All QEMU user mode and system emulators

# TEX
AddPackage texinfo # GNU documentation system for on-line information and printed output
AddPackage texlive-basic # TeX Live - Essential programs and files
AddPackage texlive-bibtexextra # TeX Live - BibTeX additional styles
AddPackage texlive-fontsextra # TeX Live - Additional fonts
AddPackage texlive-formatsextra # TeX Live - Additional formats
AddPackage texlive-games # TeX Live - Games typesetting
AddPackage texlive-humanities # TeX Live - Humanities packages
AddPackage texlive-latexextra # TeX Live - LaTeX additional packages
AddPackage texlive-mathscience # TeX Live - Mathematics, natural sciences, computer science packages
AddPackage texlive-music # TeX Live - Music packages
AddPackage texlive-pictures # TeX Live - Graphics, pictures, diagrams
AddPackage texlive-pstricks # TeX Live - PSTricks
AddPackage texlive-publishers # TeX Live - Publisher styles, theses, etc.