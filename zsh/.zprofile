# Login-shell env. OS-specific bits are gated so this file is portable.

case "$OSTYPE" in
darwin*)
	# Homebrew first so every later check (command -v, $+commands) sees brew tools
	[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv zsh)"
	[[ -d $HOME/.docker/bin ]] && path+=("$HOME/.docker/bin")   # Docker Desktop
	;;
linux*)
	export MOZ_ENABLE_WAYLAND=1
	export MOZ_USE_XINPUT2=1
	#export QT_QPA_PLATFORM=wayland
	;;
esac

[[ -d $HOME/.dotnet/tools ]] && path+=("$HOME/.dotnet/tools")
