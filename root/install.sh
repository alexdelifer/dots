#! /bin/bash

# bail if not Linux
if [[ $(uname) != 'Linux' ]] ; then
	exit 255
fi

if [[ $1 -eq 1 ]]; then RESTOW='--restow'; else RESTOW=''; fi
if [[ $2 -eq 1 ]]; then DRY_RUN='-n'; else DRY_RUN=''; fi


# stow some handy scripts from morgant/tools-osx into ~/bin
# add more by symlinking them into dotfiles/osx/bin
cd "$HOME/dots/root" || exit 2
sudo stow -v issue $RESTOW --target="/" "$DRY_RUN"


# skip stow in top-level install.sh
exit 255
