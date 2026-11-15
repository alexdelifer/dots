# ______     ______     __  __     ______     ______
#/\___  \   /\  ___\   /\ \_\ \   /\  == \   /\  ___\
#\/_/  /__  \ \___  \  \ \  __ \  \ \  __<   \ \ \____
#  /\_____\  \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\
#  \/_____/   \/_____/   \/_/\/_/   \/_/ /_/   \/_____/
#                sourcer of .zsh/*
#
# Portable across macOS and Linux. OS-specific bits live in
# ~/.zsh/05-darwin.zsh and ~/.zsh/05-linux.zsh (each returns early elsewhere).
# Machine-local, untracked overrides go in ~/.zshrc.local.

ZSH_DISABLE_COMPFIX=true
GOPATH=~/.go

for z in "$HOME"/.zsh/*.zsh; do
	source "$z"
done

# tabtab source for packages
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh

# Source bw env if exists
[[ -f ~/.bw ]] && source ~/.bw

unset KITTY_SHELL_INTEGRATION

path=("$HOME/.dotnet/tools" $path)

# Claude Code profiles: pick a config dir per context
alias claude-delifer="CLAUDE_CONFIG_DIR=$HOME/.claude-delifer claude --allow-dangerously-skip-permissions --dangerously-skip-permissions"
alias claude-solasec="CLAUDE_CONFIG_DIR=$HOME/.claude-solasec claude --allow-dangerously-skip-permissions --dangerously-skip-permissions"

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
true
