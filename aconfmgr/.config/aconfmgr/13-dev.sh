#  _____     ______     __   __
# /\  __-.  /\  ___\   /\ \ / /
# \ \ \/\ \ \ \  __\   \ \ \'/
#  \ \____-  \ \_____\  \ \__|
#   \/____/   \/_____/   \/_/
# 

CheckConfig dev || return 0

# base devel
AddPackageGroup base-devel

# arch
AddPackage asp # Arch Linux build source file management tool
AddPackage archiso # Tools for creating Arch Linux live and install iso images
AddPackage --foreign aurto # A simple aur tool for managing a local 'aurto' repository

# python
AddPackage python-pip # The PyPA recommended tool for installing Python packages
AddPackage python-pynvim # Python client for Neovim
AddPackage python-lockfile # Platform-independent file locking module

# rust
AddPackage rustup # The Rust toolchain installer
#AddPackage rust # Systems programming language focused on safety, speed and concurrency

# java :(
AddPackage jdk8-openjdk # OpenJDK Java 8 development kit
AddPackage jre8-openjdk # OpenJDK Java 8 full runtime environment

# nodejs :(
AddPackage npm # A package manager for javascript

# go
AddPackage go # Core compiler tools for the Go programming language

# dotnet
AddPackage dotnet-host # A generic driver for the .NET Core Command Line Interface
AddPackage dotnet-runtime # The .NET Core runtime
AddPackage dotnet-sdk # The .NET Core SDK

# shell
AddPackage --foreign shellcheck-bin # Shell script analysis tool (binary release)

# android
AddPackage android-tools # Android platform tools

# cpp
AddPackage cmake # A cross-platform open-source make system
AddPackage cppcheck # A tool for static C/C++ code analysis
AddPackage flawfinder # Searches through source code for potential security flaws
AddPackage git-lfs # Git extension for versioning large files
AddPackage gitlab-runner # The official GitLab CI runner written in Go
#AddPackage --foreign codeclimate # Command line interface for the Code Climate analysis platform. It allows you to run Code Climate engines on your local machine inside of Docker containers. Make sure that your current user belongs to docker group and that docker is running.

AddPackage aspnet-runtime # The ASP.NET Core runtime
AddPackage aspnet-targeting-pack # The ASP.NET Core targeting pack
AddPackage gitleaks # Audit Git repos for secrets and keys.
AddPackage jupyterlab # JupyterLab computational environment
AddPackage linux-zen-headers # Headers and scripts for building modules for the Linux ZEN kernel
AddPackage powershell # A cross-platform automation and configuration tool/framework (latest release)
AddPackage python-semgrep # Lightweight static analysis for many languages.

AddPackage mame-tools # Port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support (tools)
AddPackage restic # Fast, secure, efficient backup program
AddPackage qdirstat # Qt-based directory statistics (KDirStat/K4DirStat without any KDE - from the original KDirStat author)
