# NVIM

## Install nvim
```bash
# From AUR
yay -S neovim-nightly-bin

# From pacman
sudo pacman -S neovim
```

## Install plugin manager(`vim-plug`)
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Install LSP servers
```bash
# Go(gopls)
go get golang.org/x/tools/gopls@latest

# Efm (linters)
go get github.com/mattn/efm-langserver

# Python(pyls)
pip install python-language-server

# JS/TS
nvim +"LspInstall typescript"

# Lua
nvim +"LspInstall lua"
```
