#/bin/bash
read -p "Enter home paht(exemple: \"/home/user\"): " HOME_PAHT
read -p "Install vim config [y/n]: " VIM_CONF
read -p "Install git config [y/n]: " GIT_CONF
read -p "Install bash config [y/n]: " BASH_CONF
read -p "Intall tmux config [y/n]: " TMUX_CONF
read -p "Install zsh config [y/n]: " ZSH_CONF

if [[ "$VIM_CONF" = "y" ]]; then
	sudo apt-get install vim curl git -y

	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln vimrc  $HOME_PAHT/.vimrc
	vim +source$HOME_PAHT/.vimrc +PlugInstall

elif [[ "$GIT_CONF" = "y" ]]; then
	ln gitconfig $HOME_PAHT/.gitconfig
	ln gitignore_global $HOME_PAHT/.gitignore_global

elif [[ "$BASH_CONF" = "y" ]]; then
	sudo apt-get install bash -y
	ln bashrc $HOME_PAHT/.bashrc

elif [[ "$TMUX_CONF" = "y" ]]; then
	sudo apt-get install tmux git -y
	git clone https://github.com/gpakosz/.tmux.git $HOME_PAHT/.tmux
	mv $HOME_PAHT/.tmux/.tmux.conf $HOME_PAHT/.tmux.conf
	mv $HOME_PAHT/.tmux/.tmux.conf.local $HOME_PAHT/.tmux.conf.local
	# rm -rf $HOME_PAHT/.tmux

elif [[ "$ZSH_CONF" = "y" ]]; then
	sudo apt-get install zsh curl git 
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	
	echo "alias cls='clear'" >> $HOME_PAHT/.zshrc
	echo "alias sl='ls'" >> $HOME_PAHT/.zshrc
	echo "alias cd..='cd ..'" >> $HOME_PAHT/.zshrc
	echo "alias py='python3'" >> $HOME_PAHT/.zshrc
	echo "alias py3='python3'" >> $HOME_PAHT/.zshrc
	echo "alias ipy='ipython3'" >> $HOME_PAHT/.zshrc
	echo "alias ipy3='ipython3'" >> $HOME_PAHT/.zshrc

	sed -i "s/plugins=(git)/plugins=(autopep8 djando pip systemd debian git tmux docker ansible)"
	sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"simple\"" $HOME_PAHT/.zshrc
else
	echo "OK"
fi
