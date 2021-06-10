# NVIM

## Install nvim
```bash
yay -S neovim-nightly-bin
```

## Install plugin manager(`vim-plug`)
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Install LSP servers
```bash
# tsserver(JS/TS)
npm i -g typescript typescript-language-server

# Go(gopls)
go get golang.org/x/tools/gopls@latest

# Python(pyls)
pip install python-language-server
```
