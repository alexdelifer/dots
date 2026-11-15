#!/usr/bin/env bash
# tmux: install the binary if missing, then bootstrap tpm + plugins into
# ~/.local/share/tmux/plugins (outside the repo). Portable: macOS + Arch.

if ! command -v tmux >/dev/null 2>&1; then
	case "$(uname -s)" in
	Darwin) brew install tmux ;;
	Linux)  sudo pacman -S --needed tmux ;;
	esac
fi

TPM="$HOME/.local/share/tmux/plugins/tpm"
mkdir -p "$HOME/tmux-logs"
if [[ ! -d $TPM ]]; then
	git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM"
fi
# install_plugins reads the plugin list from the stowed tmux.conf
TMUX_PLUGIN_MANAGER_PATH="$HOME/.local/share/tmux/plugins/" "$TPM/bin/install_plugins" >/dev/null 2>&1 || true
