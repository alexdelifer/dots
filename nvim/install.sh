#!/usr/bin/env bash
# nvim: install binary + build deps if missing, then sync plugins headlessly.
# lazy.nvim bootstraps itself; mason installs LSP servers on first real start.

case "$(uname -s)" in
Darwin)
	for p in neovim tree-sitter-cli; do brew list "$p" >/dev/null 2>&1 || brew install "$p"; done
	;;
Linux)
	sudo pacman -S --needed neovim tree-sitter-cli
	;;
esac

nvim --headless "+Lazy! sync" +qa >/dev/null 2>&1 || true
