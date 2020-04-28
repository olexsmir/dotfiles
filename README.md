# Dotfiles
Config for
- GIT
- VIM
- NANO
- BASH
- TMUX
- ZSH
- RANGER

#### Git
Move settings git
~~~bash
mv gitconfig ~/.gitconfig
~~~

#### Vim
Move settings vim
~~~bash
mv vimrc ~/.vimrc
~~~
Instlling [vim-plug](https://github.com/junegunn/vim-plug)
~~~bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
~~~
Open vim and enter
~~~vim
:source ~/.vimrc
:PlugInstall
~~~

#### Nano
Move settings nano
~~~bash
sudo mv nanorc /etc/nanorc
~~~

#### BASH
Move setting bash
~~~bash
mv bashrc ~/.bashrc
~~~

#### Tmux
Installing [Oh My TMUX](https://github.com/gpakosz/.tmux)
~~~bash
git clone https://github.com/gpakosz/.tmux.git
mv ~/.tmux/.tmux.conf ~
mv ~/.tmux/.tmux.conf.local ~
rm -rf ~/.tmux
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
	plugins=( autopep8 djando pip systemd debian git tmux docker ansible )
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
	alias ipy='ipython3'
	alias ipy3='ipython3'
	alias ipy2='ipython2'
~~~

|  Command   |         Art          |
|------------|----------------------|
| cls        | clear                |
| py2/3      | python2/3            |
| ipy2/3     | ipython2/3           |
| ai         | apt-get install      |
| ar         | apt-get remove       | 
| aplaybook  | ansible-playbook     |
| apull      | ansible-pull         |
| sc-stop    | systemctl stop       |
| sc-start   | systemctl start      |

