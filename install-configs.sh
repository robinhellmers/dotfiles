#!/bin/bash -e

echo "Creating syslinks"
ln -srf .bashrc $HOME/
ln -srf .bashrc.d $HOME/
ln -srf .inputrc $HOME/
ln -srf .tmux.conf $HOME/

if test ! -d "$HOME/.tmux/plugins/tpm"; then
	echo "Cloning tmux plugin manager"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Done"
