# ~/.zshenv — read by EVERY zsh, including non-interactive `ssh mele '<cmd>'` (Paperclip agents).
# Keep it tiny and secret-free. Interactive setup lives in .zshrc / .zsh/*.zsh.
typeset -U path PATH
path=("$HOME/.local/bin" "$HOME/.npm-global/bin" "$HOME/bin" $path)
export PATH
