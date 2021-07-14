# NVIM

## Install nvim
```bash
yay -S neovim-nightly-bin
```

## Install plugin manager(`packer`)

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
