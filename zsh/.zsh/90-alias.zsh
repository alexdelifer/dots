#  ______     __         __     ______     ______
# /\  __ \   /\ \       /\ \   /\  __ \   /\  ___\
# \ \  __ \  \ \ \____  \ \ \  \ \  __ \  \ \___  \
#  \ \_\ \_\  \ \_____\  \ \_\  \ \_\ \_\  \/\_____\
#   \/_/\/_/   \/_____/   \/_/   \/_/\/_/   \/_____/
#
# General
alias e="em"
#alias e="emacsclient --tty -a '' -c"
alias dig="dig +nocookie +noedns"
alias nvim="em"
alias vi="nvim"
alias vim="nvim"
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
alias ls="ls -hF --color=auto"
alias ll="ls -lahF --color=auto"
alias l="ls -lahF --color=auto"
alias lsl="ls -lhF --color=auto"
alias "cd.."="cd ../"
alias up="cd ../"
alias rmrf="rm -rf"
alias psef="ps -ef"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias scp="scp -r"
alias mkdir="mkdir -p"
alias grep='grep --color=auto'

alias -g F="| fzf"
alias -g P="| peco"
alias -g E="| fzf | e"

alias zt="sudo zerotier-cli"
alias ztr='sudo systemctl restart zerotier-one'

alias fsSL="curl -fsSL"
alias mp="mpv --input-ipc-server=/tmp/mpvsocket"

alias r="whence -pm '*' | fzf | sh"
# ripped
alias fuck='sudo $(fc -ln -1)'
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
alias lx-delifera="ssh delifera@lx-delifera -t tmux a"

alias ig="lftp ftp://install:weasel@ftp.installgentoo.com"
