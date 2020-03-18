# Dotfiles


Config for
- GIT
- VIM
- BASH
- TMUX
- ZSH

#### Vim
Instlling [vim-plug](https://github.com/junegunn/vim-plug)
~~~bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
~~~

#### Tmux
Installing [OhMyTMUX](https://github.com/gpakosz/.tmux)
~~~bash
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
~~~

#### Zsh
Installing [Oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
~~~bash
sudo apt-get install zsh curl git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
~~~

Configuring zsh
- Theme
~~~bash
vim ~/.zshrc
	ZSH_THEME="bureau"
~~~
- Plugins
~~~bash
vim ~/.zshrc
	plugins=( autopep8 django pip git systemd debian )
~~~
- Alias
~~~bash
vim ~/.zshrc
	alias cls='clear'
	alias sl='ls'
	alias cd..='cd ..'
	alias py='python3'
	alias py3='python3'
	alias py2='python2'
	alias gor='go run'
	alias gob='go build'
~~~
