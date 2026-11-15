# History
HISTFILE=~/.zsh_history
HISTSIZE=100000                 # actually big history
SAVEHIST=100000
setopt extended_history         # timestamps + durations
setopt append_history
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
unsetopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt bang_hist
