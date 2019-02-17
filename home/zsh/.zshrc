# ______     ______     __  __     ______     ______    
#/\___  \   /\  ___\   /\ \_\ \   /\  == \   /\  ___\   
#\/_/  /__  \ \___  \  \ \  __ \  \ \  __<   \ \ \____  
#  /\_____\  \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\ 
#  \/_____/   \/_____/   \/_/\/_/   \/_/ /_/   \/_____/ 
#                sourcer of .zsh/* 

#PATH=~/bin:/usr/bin:~/.gem/ruby/2.4.0/bin:~/.go/bin:~/.local/bin/:$PATH

#fpath=(~/src/sh-manpage-completions/completions/zsh $fpath)

ZSH_DISABLE_COMPFIX=true

GOPATH=~/.go



[ -f /etc/profile.d/lesspipe.sh ] && source /etc/profile.d/lesspipe.sh

fasd_cache="$HOME/.fasd-init-zsh"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

#source ~/.zsh/keys.zsh # to be sure
unalias s

bindkey -e
for z in "$HOME"/.zsh/*.zsh; do
        source "$z"
done
reload # reload completions


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/doc/find-the-command/ftc.zsh
