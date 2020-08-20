#!/bin/bash
read -p "Your package manager[1-apt, 2-pacman]: " PACKAGE_MANAGER

if [[ "$PACKAGE_MANAGER" = "1" ]]; then
	read -p "Install vim config [y/n]: " VIM_CONF
	if [[ "$VIM_CONF" = "y" ]] || [[ "$VIM_CONF" = "Y" ]]; then
		read -p "Install GVim [y/n]:" INS_GVIM
		if [[ "$INS_GVIM" = "y" ]] || [[ "$INS_GVIM" = "Y" ]]; then
			sudo apt-get install -y vim-gui-common
		fi
		sudo apt-get install vim vim-gui-common curl -y
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		mv vimrc ~/.vimrc
	fi; read -p "Install git config [y/n]: " GIT_CONF
	if [[ "$GIT_CONF" = "y" ]] || [[ "$GIT_CONF" = "Y" ]] ; then
		mv gitconfig ~/.gitconfig
		mv gitignore_global ~/.gitignore_global
	fi; read -p "Install bash config [y/n]: " BASH_CONF
	if [[ "$BASH_CONF" = "y" ]] || [[ "$BASH_CONF" = "Y" ]]; then
		sudo apt-get install bash -y
		mv bashrc ~/.bashrc
	fi; read -p "Intall tmux config [y/n]: " TMUX_CONF
	if [[ "$TMUX_CONF" = "y" ]] || [[ "$TMUX_CONF" = "y" ]]; then
		sudo apt-get install tmux -y
		mv tmux.conf ~/.tmux.conf
		mv tmux.conf.local ~/.tmux.conf.local
	fi; read -p "Install zsh config [y/n]: " ZSH_CONF
	if [[ "$ZSH_CONF" = "y" ]] || [[ "$ZSH_CONF" = "Y" ]]; then
		sudo apt-get install zsh curl git -y
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		mv zshrc ~/.zshrc
	fi; if [[ "$VIM_CONF" = "y" ]] || [[ "$VIM_CONF" = "Y" ]]; then
		clear
		echo "vim +source~/.vimrc +PlugInstall"
		echo "For install plugins in vim"
	fi; if [[ "$ZSH_CONF" = "y" ]] || [[ "$ZSH_CONF" = "Y" ]]; then
		echo "For change shell"
		echo "chsh -s $(which zsh)"
	fi
fi

if [[ "$PACKAGE_MANAGER" = "2" ]]; then
read -p "Install vim config [y/n]: " VIM_CONF
	if [[ "$VIM_CONF" = "y" ]] || [[ "$VIM_CONF" = "Y" ]]; then
		sudo pacman -S vim -y
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		mv vimrc ~/.vimrc
	fi; read -p "Install git config [y/n]: " GIT_CONF
	if [[ "$GIT_CONF" = "y" ]] || [[ "$GIT_CONF" = "Y" ]] ; then
		sudo pacman -S git -y
		mv gitconfig ~/.gitconfig
		mv gitignore_global ~/.gitignore_global
	fi; read -p "Install bash config [y/n]: " BASH_CONF
	if [[ "$BASH_CONF" = "y" ]] || [[ "$BASH_CONF" = "Y" ]]; then
		sudo pacman -S bash -y
		mv bashrc ~/.bashrc
	fi; read -p "Intall tmux config [y/n]: " TMUX_CONF
	if [[ "$TMUX_CONF" = "y" ]] || [[ "$TMUX_CONF" = "y" ]]; then
		sudo pacman -S tmux -y
		mv tmux.conf ~/.tmux.conf
		mv tmux.conf.local ~/.tmux.conf.local
	fi; read -p "Install zsh config [y/n]: " ZSH_CONF
	if [[ "$ZSH_CONF" = "y" ]] || [[ "$ZSH_CONF" = "Y" ]]; then
		sudo pacman -S zsh curl git -y
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		mv zshrc ~/.zshrc
	fi; if [[ "$VIM_CONF" = "y" ]] || [[ "$VIM_CONF" = "Y" ]]; then
		clear
		echo "vim +source~/.vimrc +PlugInstall"
		echo "For install plugins in vim"
	fi; if [[ "$ZSH_CONF" = "y" ]] || [[ "$ZSH_CONF" = "Y" ]]; then
		echo "For change shell"
		echo "chsh -s $(which zsh)"
	fi
fi

read -p "Install config for Sublime Text 3 [y/n]: " sublime
if [[ "$sublime" = "y" ]] || [[ "$sublime" = "Y" ]]; then
    mv ./sublime/* $HOME/.config/sublime-text-3/Packages/User
fi
