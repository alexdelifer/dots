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
AddPackage aurto # A simple aur tool for managing a local 'aurto' repository

# python
AddPackage python-pip # The PyPA recommended tool for installing Python packages
AddPackage python-pynvim # Python client for Neovim
AddPackage python-lockfile # Platform-independent file locking module

# rust
AddPackage rust # Systems programming language focused on safety, speed and concurrency

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
AddPackage shellcheck-bin # Shell script analysis tool (binary release)
