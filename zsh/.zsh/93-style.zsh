#  ______     ______   __  __     __         ______
# /\  ___\   /\__  _\ /\ \_\ \   /\ \       /\  ___\
# \ \___  \  \/_/\ \/ \ \____ \  \ \ \____  \ \  __\
#  \/\_____\    \ \_\  \/\_____\  \ \_____\  \ \_____\
#   \/_____/     \/_/   \/_____/   \/_____/   \/_____/
#
zmodload -i zsh/complist

WORDCHARS=''

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'
zstyle '*' single-ignored show

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' menu no   # fzf-tab draws the menu
# case insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' rehash true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '[%d]'   # fzf-tab group headers
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
# zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
# prevent cvs files/directories
zstyle ':completion:*(all-|)files' ignore-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignore-patterns '(*/)#CVS'
# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
# activate approximate completion, but only after regular completion (_complete)
zstyle ':completion:::::' completer _complete _approximate
zstyle ':completion:*:match:*' original only
# limit to 2 errors
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:functions' ignore-patterns '_*'
# you can avoid having to complete at all in many case
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time
# completing  process IDs
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
# if you end up using a directory as argument
zstyle ':completion:*' squeeze-slashes true
# cd will never select the parent
zstyle ':completion:*:cd:*' ignore-patterns parent pwd
# let's complete known hosts and hosts from ssh's known_hosts file
basehost="0xde.ca delifer.ca"
hosts=($((
( [ -r ~/.ssh/known_hosts ] && awk '{print $1}' ~/.ssh/known_hosts | tr , '\n'); echo $basehost; ) | sort -u) )

zstyle ':completion:*' hosts $hosts

# The one and only compinit: full security check at most once a day, else cached
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) || ! -f ~/.zcompdump ]]; then
	compinit
else
	compinit -C
fi
(( $+functions[zinit] )) && zinit cdreplay -q   # replay compdefs zinit queued

# fzf-tab: fuzzy Tab completion with previews. Must load after compinit and
# before autosuggestions / syntax highlighting (those are turbo, so later).
zinit light Aloxaf/fzf-tab
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-flags --height=50%
zstyle ':fzf-tab:complete:(cd|__zoxide_z|z):*' fzf-preview 'eza -1 --color=always --icons=always $realpath'
zstyle ':fzf-tab:complete:(ls|eza|bat|cat|nvim|vim|vi):*' fzf-preview \
	'[[ -d $realpath ]] && eza -1 --color=always --icons=always $realpath || bat --color=always --style=numbers --line-range=:200 $realpath'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview 'ps -o pid,user,%cpu,%mem,command -p $word'
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff --color=always -- $realpath'
zstyle ':fzf-tab:complete:git-(log|show|checkout|switch):*' fzf-preview 'git log --oneline --graph --color=always -20 $word'
