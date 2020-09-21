# Dot files

Config for

- Git
- Vim
- Bash
- Tmux
- Zsh

### Install

Install [oh my zsh](https;//ohmyz.sh)

~~~bash
sudo pacman -S git curl zsh # Arch/Mnjaro
sudo apt-get install git curl zsh # Debian/Ubuntu/Mint
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
chsh -s $(which zsh)
~~~

Install config

~~~bash
git clone https://github.com/Smirnov-O/dotfiles
cd dotfiles
bash install.sh
~~~

Install plugin in vim

~~~bash
vim +source~/.vimrc +PlugInstall
~~~



### Screen-shot

---

[Oh my ZSH](https://github.com/ohmyzsh/ohmyzsh)

[Oh my Tmux](https://github.com/gpakosz/.tmux)
