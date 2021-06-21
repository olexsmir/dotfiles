call plug#begin('~/.vim/plugged')
  Plug 'b3nj5m1n/kommentary'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'kyazdani42/nvim-tree.lua', {'on': 'NvimTreeToggle'}
  Plug 'junegunn/fzf.vim', {'on': ['Files', 'GFiles']}
  " Appereance
  Plug 'Smirnov-O/nten.vim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'romgrk/barbar.nvim'
  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'hrsh7th/nvim-compe'
  Plug 'jiangmiao/auto-pairs'
  " Git
  Plug 'TimUntersberger/neogit'
  Plug 'lewis6991/gitsigns.nvim'
  " Syntax
  Plug 'sheerun/vim-polyglot'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Plug 'mattn/emmet-vim', {'on': 'EmmetInstall'}
  " Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

colo codedark
let mapleader=";"

"== Config
set termguicolors        " GUI colors
set nu rnu nocul         " Line numbers & cursor line highlight
set nolbr nowrap         " Line wrap
set mouse=a mh           " Mouse
set history=500          " Set history size
set autoread             " Auto read file on change
set hidden               " Change buffet without warning
set visualbell t_vb=     " Disable sounds
set pumheight=8          " Maximum items in pop up
set modeline             " Enable modeline
set nosmd                " Disable show mode
set nobk noswf noudf     " Swap files
set is ic scs            " Search
set spr                  " Split
set enc=utf-8 fenc=utf-8 " Encoding
set scrolloff=3          " Scroll padding
set list listchars=tab:\|·,trail:~,space:·
set completeopt=menuone,noselect

"== Netrw file tree
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_dirhistmax = 0

"== Tab(or spaces)
set ts=4 sw=4 sts=4
set sta et ai

"== Custom commands
com! Prettier :sil !prettier -w %
com! Term  :vs|winc L|se nonu nornu|start|term
com! GoFmt :sil !gofmt -w %
com! Black :sil !black %

"== Emmet
" let g:user_emmet_mode = 'i'
" let g:user_emmet_expandabbr_key ='<c-j>'
" au FileType html,jst,pug,vue,css,less,scss :EmmetInstall

"== Filetypes
au FileType go setl noet
au FileType javascript,yaml,json setl et ts=2 sw=2 sts=4
au FileType python setl et ts=4 sw=4 sts=4 ai

"== Config's
lua require'config'
so $HOME/.config/nvim/vimscript/barbar.vim
so $HOME/.config/nvim/vimscript/mappings.vim
