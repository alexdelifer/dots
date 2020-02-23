#  ______     __         __     ______     ______
# /\  __ \   /\ \       /\ \   /\  __ \   /\  ___\
# \ \  __ \  \ \ \____  \ \ \  \ \  __ \  \ \___  \
#  \ \_\ \_\  \ \_____\  \ \_\  \ \_\ \_\  \/\_____\
#   \/_/\/_/   \/_____/   \/_/   \/_/\/_/   \/_____/
#
# General
#alias e="em"
#alias nvim="em"
alias vi="nvim"
alias vim="nvim"

# Sane Defaults :)
alias rdp="xfreerdp /dynamic-resolution /h:800 /w:1280"
alias fj="firejail --apparmor --env=LD_PRELOAD='/usr/lib/libhardened_malloc.so'"
alias dig="dig +nocookie +noedns"
alias ls="ls -hF --color=auto"
alias watch="watch -c"
alias cp="cp -r"
alias scp="scp -r"
alias mkdir="mkdir -p"
alias grep='grep --color=auto'
alias systemctl='sudo systemctl'
alias userctl='/usr/bin/systemctl --user'
alias openvpn='sudo openvpn'
alias ovpn='openvpn'
alias lsblk='lsblk -o NAME,PARTLABEL,RO,TYPE,SIZE,FSUSE%,MOUNTPOINT'


# Proxychains
function p {
	# Possible Env Variables
	# SSHHOST = root@omv.delifer.ca
	# SSHPASS = hunter2
	# PORT	  = 5555
	# 
	# todo:
	# args: -t tor
	# 	-s ssh
	# 	-c config
	# 	-q quiet
	
	DEFAULT_SSHHOST="delifera@dt-delifera"
	DEFAULT_SSHPORT="22"

	DEFAULT_PORT="6666"
	PORT="${PORT:-$DEFAULT_PORT}"

	# Try to get the SSHPORT from the SSHHOST
	# you can use root@omv.delifer.ca:4747
	SSHHOST_2=$SSHHOST
	if [[ $SSHHOST == *":"* ]]; then 
		SSHPORT="$(echo $SSHHOST | cut -f2 -d:)"
		SSHHOST="$(echo $SSHHOST | cut -f1 -d:)"
	fi
	SSHPORT="${SSHPORT:-$DEFAULT_SSHPORT}"
	SSHHOST="${SSHHOST:-$DEFAULT_SSHHOST}"

	SSHCMD=(ssh -p $SSHPORT -CnfND)
	
	# Write the proxychains config at runtime :)
	CONFIG="
		strict_chain
		proxy_dns 
		remote_dns_subnet 224
		tcp_read_time_out 15000
		tcp_connect_time_out 8000
		[ProxyList]
		socks5 	127.0.0.1 $PORT"

	CONFIG=$(echo -n "$CONFIG" | sed 's/	//g')

	# Check if SSHPASS is set and if sshpass is avail
	# If SSHPASS is set, we probably want to use it.
	if [ ! -z "${SSHPASS+x}" ] && [ -x "$(command -v sshpass)" ]; then
		echo "Found SSHPASS, using that."
		SSHCMD=(sshpass -e ${SSHCMD[@]})
	fi

	# Check port and start proxy if it's closed.
	echo "Checking $PORT for open proxy."
	PORT_OPEN=$(netstat -tln | grep "$PORT")
	if [ -z "$PORT_OPEN" ]; then
		echo "Starting proxy to $SSHHOST on 127.0.0.1:$PORT."
		"${SSHCMD[@]}" "$PORT" "$SSHHOST"
		PORT_OPEN=$(netstat -tln | grep "$PORT")
	else
		echo "Proxy already running."
	fi
	echo "$PORT_OPEN"
	
	# Set SSHHOST back...
	SSHHOST=$SSHHOST_2

	# Run proxychains with our config file and command
	# Gotta put the config variable here as it's no good past 
	# it's expansion.
	rm -f /tmp/proxychains.$PORT.conf
	echo -n "$CONFIG" > /tmp/proxychains.$PORT.conf
	#PROXYCHAINS_CONF_FILE=<(echo -n "$CONFIG") proxychains ${@}
	PROXYCHAINS_CONF_FILE=/tmp/proxychains.$PORT.conf proxychains ${@}
	
}
alias start-proxy-work="ssh -CnfND 5555 dt-delifera"
alias proxy-tor="PROXYCHAINS_CONF_FILE=~/.proxychains/proxychains.tor.conf proxychains"
alias proxy-5555="PROXYCHAINS_CONF_FILE=~/.proxychains/proxychains.5555.conf proxychains"
alias proxy-6666="PROXYCHAINS_CONF_FILE=~/.proxychains/proxychains.6666.conf proxychains"
alias proxy-nam="PROXYCHAINS_CONF_FILE=~/.proxychains/proxychains.nam.conf proxychains"
alias proxy-multi="PROXYCHAINS_CONF_FILE=~/.proxychains/proxychains.multi.conf proxychains"
alias proxy-work="proxy-5555"
alias tor-new-circuit="echo -n 'Old IP: '; proxy-tor -q curl icanhazip.com; echo -n 'New IP: '; sudo killall -HUP tor; proxy-tor -q curl icanhazip.com"
alias proxy-shell-work="proxy-work -q zsh"
alias proxy-shell-tor="proxy-tor -q zsh"

# Wine
export WINEARGS="STAGING_RT_PRIORITY_SERVER=90 STAGING_RT_PRIORITY_BASE=90 STAGING_SHARED_MEMORY=1"
alias win32="$WINEARGS WINEARCH=win32 WINEPREFIX=~/.win32 wine"
alias win64="$WINEARGS WINEARCH=win64 WINEPREFIX=~/.win64 wine"
alias win32cfg="$WINEARGS WINEARCH=win32 WINEPREFIX=~/.win32 winecfg"
alias win64cfg="$WINEARGS WINEARCH=win64 WINEPREFIX=~/.win64 winecfg"
alias win32tricks="$WINEARGS WINEARCH=win32 WINEPREFIX=~/.win32 winetricks"
alias win64tricks="$WINEARGS WINEARCH=win64 WINEPREFIX=~/.win64 winetricks"

# Git
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gd="git diff"
alias gf="git fetch"
alias gm="git merge"
alias gr="git rebase"
alias gp="git push"
alias gu="git unstage"
alias gg="git graph"
alias gco="git checkout"
alias gcs="git commit -S -m"
alias gsn="gitlab-snippet"

alias ll="ls -lahF --color=auto"
alias l="ls -lahF --color=auto"
alias lsl="ls -lhF --color=auto"
alias "cd.."="cd ../"
alias up="cd ../"
alias rmrf="rm -rf"
alias psef="ps -ef"

alias -g F="| fzf"
alias -g P="| peco"
alias -g E="| fzf | e"

alias zt="sudo zerotier-cli"
alias ztr='sudo systemctl restart zerotier-one'

alias fsSL="curl -fsSL"
alias mp="mpv --input-ipc-server=/tmp/mpvsocket"

alias r="whence -pm '*' | fzf | sh"
# ripped
# alias fuck='sudo $(fc -ln -1)'
alias ag="ag --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'"
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias pacman="sudo pacman"
alias mutt="neomutt"
alias lol="base64 </dev/urandom | lolcat"
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'
alias record="ffmpeg -f x11grab -s 3200x1800 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y" #pass a filename

alias juket="curl -fsSL https://0xde.ca/tlist.txt | tail"

# check if im tmux
if [[ -n $TMUX ]]; then
        alias fzf="fzf-tmux"
        alias tsad="printf '\033k┐(T_T)┌\033\\'"
        alias tshrug="printf '\033k┐(\`-\`)┌\033\\'"
        alias tlol="printf '\033k┐(^0^)┌\033\\'"
fi

#alias ig="lftp ftp://install:weasel@ftp.installgentoo.com"
