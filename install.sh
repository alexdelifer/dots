#!/bin/bash

usage='Usage: ./install.sh [-n] [-f] [-q] app1 [app2 app3 ..]

	-n   dry-run; no filesystem changes
	-f   force overwrite of existing symlinks
'

DRY_RUN=0
FORCE=0

while getopts 'nf' opts
do
	case $opts in
		n ) DRY_RUN=1;;
		f ) FORCE=1;;
		* ) echo "$usage"
			exit 1;;
	esac
done
shift $((OPTIND-1))


# retrieve all repo submodules
git submodule update --init --recursive

# initialise OSX with missing homebrew
if [[ $(uname) == 'Darwin' ]]; then
	if ! command -v brew >/dev/null 2>&1; then
		./osx/homebrew.sh --init
	fi
fi

# determine if sudo necessary
if [[ $(id -u) -gt 0 ]]; then
	SUDO='sudo'
else
	SUDO=''
fi

# ensure stow is available
if ! command -v stow >/dev/null 2>&1; then
	if [[ $(uname) == 'Darwin' ]]; then
		brew install stow
	else
		# not everything is arch linux...
		sudo pacman -Syu stow
	fi
fi

function delete_symlinks {
	for filename in $1; do
		if [[ -f $HOME/$filename || -L $HOME/$filename ]]; then
			echo "Deleting file $HOME/$filename"
			if [[ $DRY_RUN -eq 0 ]]; then
				rm -f "$HOME/$filename"
			fi
		fi
	done
}

for app in "$@"; do
	echo "$app :: Started"
	if [[ $FORCE -eq 1 ]]; then
		# forcefully delete any conflicts in stow
		IFS=$(echo -en "\n\b")

		# check stow version
		VERSION=$(stow -V | awk '/stow/ {print $5}')
		if [[ ${VERSION:0:1} -eq 1 ]]; then
			# v.1.3.3
			# parse stow's conficts
			CONFLICTS=$(stow -c "$app" 2>&1 | awk '/CONFLICT/ {print $4}')
			delete_symlinks "$CONFLICTS"
		else
			# v2.2.0
			# remove existing symlinks
			# remove files which would be replaced with symlinks
			# remove symlinks which belong to other packages (which may cause trouble later but ho hum)
			CONFLICTS=$(stow -nv "$app" 2>&1 | awk '/\* existing target is/ {print $NF}')
			echo "$CONFLICTS"
			delete_symlinks "$CONFLICTS"
		fi
	fi

	# use per-app install.sh, or just symlink with stow
	if [[ -f $app/install.sh ]]; then
		echo "$app :: $app/install.sh"
		"./$app/install.sh" $FORCE $DRY_RUN &
	fi

	# per-app install scripts can return 255 to indicate that the
	# stow step should be skipped here

	if [[ ! $? -eq 255 ]]; then
		# restow when force flag supplied
		if [[ $FORCE -eq 1 ]]; then RESTOW='--restow'; else RESTOW=''; fi
		if [[ $DRY_RUN -eq 1 ]]; then DR='-n'; else DR=''; fi

		# use stow to create symlinks in $HOME
		stow -v \
		--ignore='README' \
		--ignore='install.sh' \
		--ignore='post-install.sh' \
		--ignore='.md$' \
		"$app" $RESTOW \
		--target="$HOME" $DR > /dev/null

		if [[ $? -ne 0 && $DRY_RUN -eq 0 ]]; then
			echo 'Stow returned a non-zero result. You may want to re-run with -f (force)'
		fi
	fi

    # use per-app post-install.sh, useful when something needs to be stowed first.
    if [[ -f $app/post-install.sh ]]; then
		echo "$app :: $app/post-install.sh"
        "./$app/post-install.sh" $FORCE $DRY_RUN &
    fi

	echo "$app :: Done"

done

sleep 0.5
echo "Waiting for background jobs..."
wait < <(jobs -p)
#test -f fail && echo Calculation failed.
#rm fail