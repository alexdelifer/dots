#! /bin/bash

if [[ $(id -u) -gt 0 ]]; then
	SUDO='sudo'
else
	SUDO=''
fi

# install vim package
if [[ $(uname) == 'Linux' ]]; then

	if ! command -v emacs >/dev/null 2>&1; then
		if [[ $(uname) =~ (.*)Debian(.*) ]]; then
			$SUDO apt-get install -y emacs
		elif [[ $(uname) =~ (.*)Ubuntu(.*) ]]; then
			$SUDO apt-get install -y emacs
		elif [[ $(uname) =~ (.*)Linux(.*) ]]; then
			$SUDO pacman -S emacs
		fi
	fi

elif [[ $(uname) == 'Darwin' ]] && ! brew list | grep -q vim; then
	brew install emacs
fi

# retrieve the Vundle submodule
git submodule update --init doom/.emacs.d

# install vim plugins with Vundle
if [[ $? -eq 0 ]]; then
	# if either stdin or stdout is missing, redirect output
	if [[ ! -t 0 || ! -t 1 ]]; then
        y | doom/.emacs.d/bin/doom quickstart &>/dev/null
	else
        doom/.emacs.d/bin/doom quickstart
	fi
fi
