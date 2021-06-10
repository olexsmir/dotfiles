 call plug#begin('~/.vim/plugged')
  Plug 'Smirnov-O/nten.vim'
  Plug 'b3nj5m1n/kommentary'
  " Plug 'mattn/emmet-vim', {'on': 'EmmetInstall'}
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  " Plug 'editorconfig/editorconfig-vim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  " Status line && Tab line
  Plug 'hoob3rt/lualine.nvim'
  Plug 'romgrk/barbar.nvim'
  " LSP && Completion
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'jiangmiao/auto-pairs'
  " Git
  Plug 'TimUntersberger/neogit'
  Plug 'lewis6991/gitsigns.nvim'
  " File explorer
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-telescope/telescope.nvim'
  " Better syntax hl
  Plug 'sheerun/vim-polyglot'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

colo codedark
let mapleader=";"
set termguicolors

"== Tab(or spaces)
set ts=4 sw=4 sts=4
set sta et ai

"== Custom commands
com! Prettier :sil !prettier -w %
com! Term  :vs|winc L|se nonu nornu|start|term
com! Notes :Files ~/notes
com! GoFmt :sil !gofmt -w %

"== Configs
luafile $HOME/.config/nvim/lua/plugins.lua
source $HOME/.config/nvim/vimscript/config.vim
source $HOME/.config/nvim/vimscript/barbar.vim
source $HOME/.config/nvim/vimscript/emmet.vim
source $HOME/.config/nvim/vimscript/compe.vim
source $HOME/.config/nvim/vimscript/filetypes.vim
source $HOME/.config/nvim/vimscript/mappings.vim
