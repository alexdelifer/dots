#  ______     __   __     __   __
# /\  ___\   /\ "-.\ \   /\ \ / /
# \ \  __\   \ \ \-.  \  \ \ \'/
#  \ \_____\  \ \_\\"\_\  \ \__|
#   \/_____/   \/_/ \/_/   \/_/
#
#

# OS-specific env lives in 05-darwin.zsh / 05-linux.zsh

# Paths (portable)
typeset -U path fpath            # dedupe PATH/fpath entries
path+=(~/bin ~/.local/bin)
[[ -f $HOME/.cargo/env ]] && . "$HOME/.cargo/env"
fpath=(~/.zsh/completion $fpath)

# Enviroment Variables
export EDITOR="nvim"
export PAGER=less
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME=ansi            # follow the terminal palette (Night Owl)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# AI / LLM tooling

# Ollama — local LLM
export OLLAMA_CONTEXT_LENGTH=32768          # override Ollama's default 2048 context
export OLLAMA_HOST=http://127.0.0.1:11434  # keep on loopback only (CVE-2026-7482)

# Goose — agentic loop frontend
export GOOSE_PROVIDER=ollama
export GOOSE_MODEL=qwen3:14b
export GOOSE_TOOLSHIM=true      # fallback parser for models that emit prose tool calls
export GOOSE_INPUT_LIMIT=32768

# fzf config lives in 15-fzf.zsh

# Modern shell helpers
if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi


# Settings
setopt auto_cd                
setopt auto_remove_slash        
setopt chase_links              
setopt correct               
setopt extended_glob        
setopt glob_dots                
setopt print_exit_value         
setopt no_flow_control
unsetopt beep
unsetopt bg_nice
unsetopt clobber
unsetopt hist_beep
# unsetopt hup                  
unsetopt ignore_eof
unsetopt list_beep
unsetopt rm_star_silent

# oh my zsh completion.zsh

unsetopt menu_complete
unsetopt flowcontrol
#setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end




# Global Menu Stuff
# export GTK_MODULES
# export UBUNTU_MENUPROXY

# AppIndicator Support 
# export XDG_CURRENT_DESKTOP=Unity


