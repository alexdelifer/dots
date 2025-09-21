# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ______     ______     __  __     ______     ______    
#/\___  \   /\  ___\   /\ \_\ \   /\  == \   /\  ___\   
#\/_/  /__  \ \___  \  \ \  __ \  \ \  __<   \ \ \____  
#  /\_____\  \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\ 
#  \/_____/   \/_____/   \/_/\/_/   \/_/ /_/   \/_____/ 
#                sourcer of .zsh/* 

ZSH_DISABLE_COMPFIX=true
GOPATH=~/.go

for z in "$HOME"/.zsh/*.zsh; do
        source "$z"
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Source bw env if exists
[[ ! -f ~/.bw ]] || source ~/.bw

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

unset KITTY_SHELL_INTEGRATION
ITERM_SHELL_INTEGRATION_INSTALLED=Yes

POWERLEVEL9K_SHOW_RULER=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=''
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=''
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

. "$HOME/.cargo/env"
