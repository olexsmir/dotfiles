call plug#begin('~/.vim/plugged')
  " LSP && Completion
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim', {'on': 'EmmetInstall'}
  " File explorer
  Plug 'junegunn/fzf.vim'
  Plug 'kyazdani42/nvim-tree.lua'
  " Git
  Plug 'lewis6991/gitsigns.nvim'
  " Theme
  Plug 'Smirnov-O/nten.vim'
  " Status line && Tab line
  Plug 'hoob3rt/lualine.nvim'
  Plug 'romgrk/barbar.nvim'
  " Better syntax hl
  Plug 'sheerun/vim-polyglot'
  Plug 'norcalli/nvim-colorizer.lua'
  " Other
  Plug 'nvim-lua/plenary.nvim'
call plug#end()

colo codedark
let mapleader=";"

"== Tab(or spaces)
set ts=4 sw=4 sts=4
set sta et ai

"== Custom commands
com! Prettier :sil !prettier -w %
com! Term  :vs|winc L|se nonu nornu|start|term
com! Notes :Files ~/notes
com! GoFmt :sil !gofmt -w %

"== Configs
source $HOME/.config/nvim/vimscript/config.vim
source $HOME/.config/nvim/vimscript/barbar.vim
source $HOME/.config/nvim/vimscript/emmet.vim
source /home/sasha/.config/nvim/vimscript/compe.vim
source $HOME/.config/nvim/vimscript/mappings.vim
luafile $HOME/.config/nvim/lua/n-compe.lua
luafile $HOME/.config/nvim/lua/n-lualine.lua
luafile $HOME/.config/nvim/lua/n-nvimtree.lua
luafile $HOME/.config/nvim/lua/n-gitsigns.lua
luafile $HOME/.config/nvim/lua/n-colorizer.lua

"== Custom setting for another files
au FileType python,elm setl sw=4 ts=4 sts=2
au FileType javascript,html,vue,jst,pug,css,less,scss,json,yaml,lua setl sw=2 ts=2 sts=2
au FileType go setl noet sw=4 ts=4 sts=2
