#  Plugins (zinit). Prompt is Starship (02-theme.zsh).
#  compinit runs once, in 93-style.zsh; fzf-tab loads right after it.

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma-continuum/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

# Extra completion defs: loaded now (not turbo) so they're on fpath before compinit
zinit ice blockf
zinit light zsh-users/zsh-completions

# Binaries
if [[ $OSTYPE == linux* ]]; then
	zinit ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
	zinit load docker/compose
fi

zinit ice pick"capture.zsh" as"program"
zinit snippet \
	https://github.com/Valodim/zsh-capture-completion/blob/master/capture.zsh

# Turbo (deferred until after first prompt): these wrap ZLE widgets, so they
# must load after fzf-tab, which turbo guarantees.
zinit wait lucid atload'_zsh_autosuggest_start' for \
	zsh-users/zsh-autosuggestions

zinit wait lucid for \
	zdharma-continuum/fast-syntax-highlighting \
	mafredri/zsh-async \
	supercrabtree/k

zinit wait lucid for \
	OMZ::plugins/git/git.plugin.zsh \
	OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
	OMZ::plugins/colorize/colorize.plugin.zsh \
	OMZ::plugins/cp/cp.plugin.zsh \
	OMZ::plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh
	#OMZ::plugins/vi-mode/vi-mode.plugin.zsh   # Overloads Ctrl-R...

zinit light olets/zsh-window-title

# LS_COLORS (used by eza, completion menus)
zinit pack for ls_colors

# Autosuggestions: history first, then completion engine
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#5f7e97'
