#  atuin: Ctrl-R → atuin search (SQLite history, per-dir/host/session filters).
#  Loaded after 15-fzf.zsh so it takes Ctrl-R from fzf; Ctrl-T / Alt-C stay fzf.
#  Up arrow stays zsh prefix search (20-keys.zsh).
(( $+commands[atuin] )) || return 0

# Newer atuin defaults to ~/.atuin for config+data; keep config in the stowed
# XDG dir (atuin stow package). History DB stays in ~/.atuin/data.
export ATUIN_CONFIG_DIR="$HOME/.config/atuin"

eval "$(atuin init zsh --disable-up-arrow)"
