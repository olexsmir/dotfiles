echo -e  "1: Fast install \n2: Manual Install"
read -p ": " INSTALL_METHOD

if [[ "$INSTALL_METHOD" == "1" ]]; then
    mv {bashrc,gitconfig,gitignore_global,tmux.conf,tmux.conf.local,vimrc,zshrc} /home/{$USER}
    cd config
    mv {htop,neofetch} /home/{$USER}/.config
    mv sublime-text-3/{"Default (Linux).sublime-keymap","Package Control.sublime-settings","Preferences.sublime-settings"} /home/{$USER}/.config/sublime-text-3/Packages/User/
if [[ "$INSTALL_METHOD" == "2" ]]; then
    read -p "Install config for Sublime Text 3 [y/n]: " SUBLIME
    read -p "Install vim config [y/n]: " VIM
    read -p "Install git config [y/n]: " GIT
    read -p "Install zsh config [y/n]: " ZSH
    read -p "Install bash config [y/n]: " BASH
    read -p "Intall tmux config [y/n]: " TMUX
    if [[ "$VIM" == "y" ]] || [[ "$VIM" == "Y" ]]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        mv vimrc ~/.vimrc
    elif [[ "$GIT" == "y" ]] || [[ "$GIT" == "Y" ]]; then
        mv gitconfig ~/.gitconfig
        mv gitignore_global ~/.gitignore_global
    elif [[ "$ZSH" == "y" ]] || [[ "$ZSH" == "Y" ]]; then
        mv zshrc ~/.zshrc
        touch /home/$USER/.env
    elif [[ "$BASH" = "y" ]] || [[ "$BASH" = "Y" ]]; then
        mv bashrc ~/.bashrc
    elif [[ "$TMUX" = "y" ]] || [[ "$TMUX" = "y" ]]; then
        mv tmux.conf ~/.tmux.conf
        mv tmux.conf.local ~/.tmux.conf.local
    elif [[ "$SUBLIME" = "y" ]] || [[ "$SUBLIME" = "Y" ]]; then
        mv ./sublime-text-3/* /home/{$USER}/.config/sublime-text-3/Packages/User
    fi
fi