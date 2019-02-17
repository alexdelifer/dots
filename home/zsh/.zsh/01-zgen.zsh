#  ______     ______   __         __  __     ______
# /\___  \   /\  == \ /\ \       /\ \/\ \   /\  ___\
# \/_/  /__  \ \  _-/ \ \ \____  \ \ \_\ \  \ \ \__ \
#   /\_____\  \ \_\    \ \_____\  \ \_____\  \ \_____\
#   \/_____/   \/_/     \/_____/   \/_____/   \/_____/
#

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/tmux
  zgen oh-my-zsh plugins/command-not-found

  zgen load "zsh-users/zsh-autosuggestions"
  zgen load "zsh-users/zsh-completions"
  zgen load "zdharma/fast-syntax-highlighting"
  zgen load "mafredri/zsh-async"
  zgen load "https://git.delifer.ca/alex/pure"
  zgen load "zsh-users/zsh-history-substring-search"
  zgen load "junegunn/fzf"
  zgen load "liangguohuan/fzf-extends"
  zgen load "MichaelAquilina/zsh-you-should-use"
  zgen load "b4b4r07/emoji-cli"
  zgen load "mrowa44/emojify"

  # generate the init script from plugins above
  zgen save
fi
