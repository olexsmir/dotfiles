#/bin/bash
read -p "\e[31m All your git, vim, bash, tmux, zsh settings will be deleted [y/n]" CONTINUE
if [[ "$CONTINUE" == "y" ]]; then
	rm -rf ~/.vimrc ~/.vim
	rm -rf ~/.gitconfig ~/.git*
	rm -rf ~/.bashrc ~/.bash*
	rm -rf ~/.tmux ~/.tmux*
	rm -rf ~/.zshrc ~/.oh-my-zsh
	
	read -p "Install vim config [y/n]: " VIM_CONF
	read -p "Install git config [y/n]: " GIT_CONF
	read -p "Install bash config [y/n]: " BASH_CONF
	read -p "Intall tmux config [y/n]: " TMUX_CONF
	read -p "Install zsh config [y/n]: " ZSH_CONF

	cd ~/.dotfiles
	if [[ "$VIM_CONF" = "y" ]]; then
		sudo apt-get install vim vim-gui-common curl -y
		curl -fLo ~.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		ln vimrc  ~/.vimrc
		#vim +source~/.vimrc +PlugInstall
	elif [[ "$GIT_CONF" = "y" ]]; then
		ln gitconfig ~/.gitconfig
		ln gitignore_global ~/.gitignore_global
	elif [[ "$BASH_CONF" = "y" ]]; then
		sudo apt-get install bash -y
		ln bashrc ~/.bashrc
	elif [[ "$TMUX_CONF" = "y" ]]; then
		sudo apt-get install tmux -y
		git clone https://github.com/gpakosz/.tmux.git ~/.tmux
		mv ~/.tmux/.tmux.conf ~/.tmux.conf
		mv ~/.tmux/.tmux.conf.local ~/.tmux.conf.local
	elif [[ "$ZSH_CONF" = "y" ]]; then
		sudo apt-get install zsh curl -y
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		echo "alias cls='clear'" >> ~/.zshrc
		echo "alias sl='ls'" >> ~/.zshrc
		echo "alias cd..='cd ..'" >> ~/.zshrc
		echo "alias py='python3'" >> ~/.zshrc
		echo "alias py3='python3'" >> ~/.zshrc
		echo "alias ipy='ipython3'" >> ~/.zshrc
		echo "alias ipy3='ipython3'" >> ~/.zshrc
		sed -i "s/plugins=(git)/plugins=(autopep8 djando pip git tmux docker)"
		sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"simple\"" ~/.zshrc
	else
		echo ""
	fi
fi