#  __  __     ______     __  __     ______
# /\ \/ /    /\  ___\   /\ \_\ \   /\  ___\
# \ \  _"-.  \ \  __\   \ \____ \  \ \___  \
#  \ \_\ \_\  \ \_____\  \/\_____\  \/\_____\
#   \/_/\/_/   \/_____/   \/_____/   \/_____/
#

# start typing + [Up-Arrow] - fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
# start typing + [Down-Arrow] - fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search # Down


bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word


if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi


# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-e' edit-command-line

# file rename magick
bindkey "^[m" copy-prev-shell-word # ALT-m

# open ncmpcpp on ALT-\
ncmpcppShow() { ncmpcpp <$TTY; zle redisplay; }
zle -N ncmpcppShow
bindkey '^[\' ncmpcppShow

# Alt-Up for Parent Dir
# Alt-Left for Back Dir
cdUndoKey() {
  popd
  zle       reset-prompt
  echo
  zle       reset-prompt
}

cdParentKey() {
  pushd ..
  zle      reset-prompt
  echo
  zle       reset-prompt
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey

bindkey '^ ' autosuggest-accept # accept zsh-autosuggest
bindkey '^X' fzf-completion

# bindkey '^s' emoji::cli
