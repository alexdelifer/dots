#!/bin/bash
dotfiles="$HOME"/dotfiles
stowee="$1"
#if [-f "$(which stow)"]; then
which stow

mkdir "$dotfiles"/"$(basename $stowee)"
mv "$stowee" "$dotfiles/$(basename $stowee)/"
cd "$dotfiles"
stow -v -R -t "$HOME" "$(basename $stowee)"
