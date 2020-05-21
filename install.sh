#/bin/bash
read -p "Enter home paht: " HOME_PAHT

function install_program {
	sudo apt-get install git python3 python3-pip curl vim tmux
}


function LN {
	ln bashrc $HOME_PAHT
	ln gitconfig $HOME_PAHT
	ln gitignore_global $HOME_PAHT
}

function ZSH {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	echo "alias cls='clear'" >> .zshrc
	echo "alias sl='ls'" >> .zshrc
	echo "alias cd..='cd ..'" >> .zshrc
	echo "alias py='python3'" >> .zshrc
	echo "alias py3='python3'" >> .zshrc
	echo "alias ipy='ipython3'" >> .zshrc
	echo "alias ipy3='ipython3'" >> .zshrc

	sed -i "s/plugins=(git)/plugins=(autopep8 djando pip systemd debian git tmux docker ansible)"
	sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"bureau\"" $HOME_PAHT/.zshrc
}

function TMUX {
	git clone https://github.com/gpakosz/.tmux.git
	mv $HOME_PAHT.tmux/.tmux.conf ~
	mv $HOME_PAHT.tmux/.tmux.conf.local ~
	rm -rf $HOME_PAHT.tmux
}

function VIM {
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln vimrc  $HOME_PAHT
	vim +source$HOME_PAHT/.vimrc +PlugInstall
}

install_program
LN
ZSH
TMUX
VIM
