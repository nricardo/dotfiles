#!/bin/bash

__install() {
	# list of dotfiles
	local DOTFILES=(
		".dircolors"
		".bash_aliases"
		".bash_logout"
		".bash_prompt"
		".bash_profile"
		".bashrc"
		".gitconfig"
		".npmrc"
	);

	# change to user's home folder
	cd $HOME

	# create links on user's home
	for f in ${DOTFILES[@]}; do
		if [ -e ${HOME}/.dotfiles/${f} ]; then
			ln -nfsv ${HOME}/.dotfiles/${f} ${f}
		fi
	done

	# go back to where we where
	cd -
}

# check if ".dotfiles" folder exists
if [ ! -d ${HOME}/.dotfiles/ ]; then
	echo 'No ".dotfiles" folder detected! Aborting...';
	exit 1;
fi

__install
unset __install
