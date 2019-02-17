#  ______   __   __     ______
# /\  ___\ /\ "-.\ \   /\  ___\
# \ \  __\ \ \ \-.  \  \ \ \____
#  \ \_\    \ \_\\"\_\  \ \_____\
#   \/_/     \/_/ \/_/   \/_____/
#

reload() {
    local f
    f=(~/.zsh/completion/*(.))
    unfunction $f:t 2>/dev/null
    autoload -U $f:t
}

# read markdown files like manpages
function md() {
    pandoc -s -f markdown -t man "$*" | man -l -
}

function t() {
  X=$#
  [[ $X -eq 0 ]] || X=X
  tmux new-session -A -s $X
}

function zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall
}
