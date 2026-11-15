#  Linux-only (Arch / Hyprland). Skipped everywhere else.
[[ $OSTYPE == linux* ]] || return 0

export IS_LINUX=1
export MANPATH=/usr/share/man
export VAGRANT_HOME=/games/Vagrant
export BROWSER=firefox
export TERMINAL=foot
export TERMINAL_COMMAND="foot -e"
export QT_QPA_PLATFORMTHEME=qt5ct
export CLIP_COPY=wl-copy CLIP_PASTE=wl-paste

# Fix TERM
[[ $TERM == xterm-termite ]] && export TERM=xterm-256color

# Wayland (was 40-wayland.zsh)
export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_ENABLE_WAYLAND=1
#export QT_QPA_PLATFORM=wayland
#export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

# "Disable" HiDPI (was 41-hidpi.zsh)
export WINIT_HIDPI_FACTOR=1
export WINIT_X11_SCALE_FACTOR=1
export QT_FONT_DPI=96
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS=1
#export GDK_SCALE=2
#export GDK_DPI_SCALE=-1
#export XCURSOR_SIZE=48

# Linux-only aliases (moved from 90-alias.zsh)
alias rdp="xfreerdp /dynamic-resolution /h:800 /w:1280"
alias hirdp="xfreerdp /dynamic-resolution /h:1600 /w:2560 /scale:180 /scale-desktop:200"
alias fj="firejail --apparmor --env=LD_PRELOAD='/usr/lib/libhardened_malloc.so'"
alias systemctl='sudo systemctl'
alias userctl='/usr/bin/systemctl --user'
alias lsblk='lsblk -o NAME,PARTLABEL,RO,TYPE,SIZE,FSUSE%,MOUNTPOINT'
alias kali='sudo arch-chroot /kali su - kali'
alias pacman="sudo pacman"
alias ztr='sudo systemctl restart zerotier-one'
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'
alias record="ffmpeg -f x11grab -s 3200x1800 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y" #pass a filename
alias fzf-install="yay -Slq | fzf -m --preview 'yay -Si {1}' | xargs -ro yay -S"
alias fzf-remove="yay -Qeq | fzf -m --preview 'yay -Qi {1}' | xargs -ro yay -Rs"
