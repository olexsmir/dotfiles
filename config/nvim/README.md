# NVIM

## Install nvim
```bash
yay -S neovim-nightly-bin
```

## Install plugin manager(`packer`)
```bash
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Install LSP servers
```bash
# Go(gopls)
go get golang.org/x/tools/gopls@latest

# Python(pyls)
pip install python-language-server

# JS/TS
nvim +"LspInstall typescript"
```
