#!/bin/bash -e

install-nvim() {
	version=v0.6.1
	dirname=nvim-linux64
	installpath=$HOME/.local/$dirname
	tarfile=$dirname.tar.gz
	url=https://github.com/neovim/neovim/releases/download/$version/$tarfile
	binpath=$HOME/.local/bin
	
	mkdir -p $binpath
	
	if test -d "$installpath"; then
		echo "nvim $version is already installed"
		return
	fi
	
	if test ! -d "$dirname"; then
		if [ ! -f "$tarfile" ]; then
			wget $url
		fi
		tar -xzvf $tarfile
		rm $tarfile
	fi
	
	mv $dirname $installpath
	ln -srf $installpath/bin/* $binpath
}

install-astrovim() {
	if test "$(git -C ~/.config/nvim remote get-url origin)" == "https://github.com/kabinspace/AstroVim"; then
		echo astrovim is already installed;
		return
  	fi
  mkdir -p ~/.config
	git clone https://github.com/kabinspace/AstroVim ~/.config/nvim
  mkdir -p ~/.config/nvim/lua/user
	ln -srf ./astrovim/init.lua ~/.config/nvim/lua/user/
	nvim +PackerSync
}

install-dependencies-ubuntu() {
	sudo apt install -y python3-pip clangd gcc unzip
	pip3 install pynvim
}

install-nvim
install-astrovim
