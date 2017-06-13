#!/bin/bash

__install() {
	# list of dotfiles
	local DOTFILES=(
		".bash_aliases"
		".bash_logout"
		".bash_prompt"
		".bash_profile"
		".bashrc"
		".dircolors"
		".gitconfig"
		".npmrc"
	);

	# create links on user's home
	for f in ${DOTFILES[@]}; do
		if [ -d ~/.dotfiles/${f} ]; then
			ln -sfv ~/.dotfiles/${f} ~/${f}
		fi
		if [ -f ~/.dotfiles/${f} ]; then
			ln -sfv ~/.dotfiles/${f} ~/${f}
		fi
	done
}

# check if ".dotfiles" folder exists
if [ ! -d ~/.dotfiles/ ]; then
	echo 'No ".dotfiles" folder detected! Aborting...';	exit 1;
fi

__install
unset __install
