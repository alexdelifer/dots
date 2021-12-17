#! /bin/bash

if [[ $(uname) == 'Darwin' ]]; then
	# I don't use tmux on OSX
	return
fi

if [[ $(id -u) -gt 0 ]]; then
	SUDO='sudo'
else
	SUDO=''
fi

if ! command -v tmux >/dev/null 2>&1; then

	# install tmux package
	if [[ $(uname) == 'Linux' ]]; then
		if [[ $(id -u) -gt 0 ]]; then
			$SUDO pacman -S tmux
		else
			pacman -S tmux
		fi
	fi
fi

nohup script -q -O /dev/null tmux -f tmux/.tmux.conf new-session \
	"tmux run-shell tmux/.tmux/plugins/tpm/bindings/install_plugins" \
	</dev/null >/dev/null 2>&1 & 
