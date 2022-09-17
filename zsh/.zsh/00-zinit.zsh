# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


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


# Theme
# Do not touch
zinit ice depth=1; zinit light romkatv/powerlevel10k

# AutoSuggest
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# Binaries
zinit ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zinit load docker/compose



zinit ice mv"httpstat.sh -> httpstat" \
        pick"httpstat" as"program"
zinit snippet \
	https://github.com/b4b4r07/httpstat/blob/master/httpstat.sh

zinit ice pick"capture.zsh" as"program"
zinit snippet \
	https://github.com/Valodim/zsh-capture-completion/blob/master/capture.zsh

# General
zinit wait lucid for \
	mafredri/zsh-async \
	supercrabtree/k

	#zdharma-continuum/history-search-multi-word \

# Completions go here
zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
	zsh-users/zsh-completions

zinit wait lucid as"completion" for \
	OMZ::plugins/docker/_docker \
    	OMZ::plugins/adb/_adb \
    	OMZ::plugins/ripgrep/_ripgrep \

zinit wait lucid atinit"zpcompinit" for \
	zdharma-continuum/fast-syntax-highlighting

zinit wait lucid for \
	OMZ::plugins/git/git.plugin.zsh \
	OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
	OMZ::plugins/colorize/colorize.plugin.zsh \
	OMZ::plugins/cp/cp.plugin.zsh \
	OMZ::plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh \
	#OMZ::plugins/vi-mode/vi-mode.plugin.zsh \ # Overloads Ctrl-R...
	#OMZ::plugins/tmux/tmux.plugin.zsh \


zinit light olets/zsh-window-title


# Zinit Packages
zinit pack for \
	ls_colors

autoload -Uz compinit
compinit

zinit cdreplay -q   # -q is for quiet; actually run all the `compdef's saved before
                    #`compinit` call (`compinit' declares the `compdef' function, so
                    # it cannot be used until `compinit' is ran; Zinit solves this
                    # via intercepting the `compdef'-calls and storing them for later
                    # use with `zinit cdreplay')

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
