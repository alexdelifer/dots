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
git submodule update --init spacemacs/.emacs.d
