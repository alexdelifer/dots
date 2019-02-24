# Set user-defined locale
# export LANG=$(locale -uU)

#
# if running zsh
if [ -n "${ZSH_VERSION}" ]; then
  if [ -f "${HOME}/.zshrc" ]; then
    source "${HOME}/.zshrc"
  fi
fi
