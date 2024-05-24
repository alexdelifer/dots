#!/bin/bash

export DOTNET_ROOT="C:\Program Files\dotnet" 
export PULSE_LATENCY_MSEC=90 
export DXVK_ENABLE_NVAPI=1 
export PROTON_HIDE_NVIDIA_GPU=0 
export PROTON_ENABLE_NVAPI=1 
export WINEDEBUG="-all" 
export WINEPREFIX="/data/WINE_PREFIX/wine64" 
export WINE_BINARY="/home/alex/.config/steamtinkerlaunch/proton/custom/GE-Proton8-23/files/bin/wine" 

if [[ $WINETRICKS == 1 ]]
then
  echo "winetricks"
  export WINE_BINARY="winetricks -q"
fi

$WINE_BINARY "$@"
