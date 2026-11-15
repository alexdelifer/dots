#  macOS-only. Skipped everywhere else.
[[ $OSTYPE == darwin* ]] || return 0

export IS_MAC=1
export BROWSER=open
export CLIP_COPY=pbcopy CLIP_PASTE=pbpaste

# brew shellenv for non-login shells (e.g. an IDE terminal that skips .zprofile)
if [[ -z $HOMEBREW_PREFIX && -x /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

# Toolchains installed via brew / vendor pkgs
[[ -d /opt/homebrew/opt/dotnet/libexec ]] && export DOTNET_ROOT=/opt/homebrew/opt/dotnet/libexec
[[ -d /opt/metasploit-framework/bin ]] && path=(/opt/metasploit-framework/bin $path)

# Docker Desktop CLI completions (must be on fpath before compinit in 93-style)
[[ -d $HOME/.docker/completions ]] && fpath=($HOME/.docker/completions $fpath)

# Kill Spotify before flashrom: Spotify grabs USB devices and blocks CH341A
flashrom() {
	local spotify_was_running=false
	if pgrep -x Spotify >/dev/null 2>&1; then
		spotify_was_running=true
		killall Spotify 2>/dev/null
		sleep 0.5
	fi
	command sudo flashrom "$@"
	local rc=$?
	$spotify_was_running && { open -a Spotify &>/dev/null & }
	return $rc
}

# Handy mac helpers
alias o="open ."
alias flushdns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
