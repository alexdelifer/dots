
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
