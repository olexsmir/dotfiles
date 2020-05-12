#!/bin/bash
read -p "Enter user path: " PATH_HOME

echo "Install program"
sudo apt-get install vim git bash tmux zsh curl

echo "Move settings git"
mv gitconfig PATH_HOME/.gitconfig

echo "Vim configuration"
mv vimrc PATH_HOME/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PATH_HOME/.vimrc +PlugInstall

echo "Move settings bash"
mv bashrc PATH_HOME/.bashrc

echo "TMUX"
git clone https://github.com/gpakosz/.tmux.git
mv ~/.tmux/.tmux.conf ~
mv ~/.tmux/.tmux.conf.local ~
rm -rf ~/.tmux

echo "ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "alias cls='clear'" >> PATH_HOME/.zshrc
echo "alias sl='ls'" >> PATH_HOME/.zshrc
echo "alias cd..='cd ..'" >> PATH_HOME/.zshrc
echo "alias cd..='cd ..'" >> PATH_HOME/.zshrc
echo "alias py='python3'" >> PATH_HOME/.zshrc
echo "alias py3='python3'" >> PATH_HOME/.zshrc
echo "alias ipy='ipython3'" >> PATH_HOME/.zshrc
echo "alias ipy='python3'" >> PATH_HOME/.zshrc

set -i "s~ZSH_THEME="robbyrussell"~ZSH_THEME="bureau"~g" PATH_HOME/.zshrc
set -i "s~plugins=(git)~plugins=(autopep8 djando pip systemd debian git tmux docker ansible)~g" PATH_HOME/.zshrc
