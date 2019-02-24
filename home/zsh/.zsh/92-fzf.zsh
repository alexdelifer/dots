[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -3'"
export FZF_TMUX=1

unalias z
z() {
  if [[ -z "$*" ]]; then
    cd "$(fasd -d -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

unalias zz
zz() {
  cd "$(fasd_cd -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}

# unalias v
v() {
  if [[ -z "$*" ]]; then
          vim "$(fasd -f -t -l -b viminfo 2>&1 | fzf +s --tac --preview 'less {}')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}
pa() {
    if [[ -z "$*" ]]; then
            pacaur -S "$(pacaur -Ssq 2>&1 | fzf +s --tac)"
    fi
        echo nope
}
