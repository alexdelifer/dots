#  fzf: Ctrl-R history, Ctrl-T files, Alt-C cd, ** <Tab> completion.
#  Night Owl colors. Portable: works with brew fzf (mac) and pacman fzf (Arch).
(( $+commands[fzf] )) || return 0

# fd is faster than find/ag and respects .gitignore
if (( $+commands[fd] )); then
	export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
	export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
	_fzf_compgen_path() { fd --hidden --follow --exclude .git . "$1" }
	_fzf_compgen_dir()  { fd --type d --hidden --follow --exclude .git . "$1" }
fi

# Night Owl palette
export FZF_DEFAULT_OPTS="\
--height=50% --layout=reverse --border=rounded --info=inline-right \
--prompt='Δ ' --pointer='▶' --marker='✓' --exact \
--color=bg:-1,bg+:#1d3b53,fg:#d6deeb,fg+:#ffffff,gutter:-1 \
--color=hl:#82aaff,hl+:#c792ea,query:#d6deeb,prompt:#c792ea \
--color=pointer:#c792ea,marker:#addb67,spinner:#7fdbca,info:#ecc48d \
--color=border:#5f7e97,header:#7fdbca,label:#7fdbca \
--bind='ctrl-/:toggle-preview'"

export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:300 {} 2>/dev/null || eza --tree --level=2 --color=always --icons=always {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --color=always --icons=always {} | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {2..}' --preview-window=up:3:hidden:wrap \
--bind 'ctrl-y:execute-silent(echo -n {2..} | \${CLIP_COPY:-pbcopy})+abort' \
--header 'ctrl-y: copy  ctrl-/: preview'"

# Inside tmux, Ctrl-T / Alt-C / Ctrl-R(fzf) and fzf-tab open as floating popups
if [[ -n $TMUX ]]; then
	export FZF_TMUX_OPTS='-p 80%,60%'
	zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
fi

# Key bindings + completion (fzf >= 0.48)
source <(fzf --zsh)
