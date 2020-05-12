call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'           " ColorChemes pack
Plug 'airblade/vim-gitgutter'           " Git indecator
Plug 'kien/ctrlp.vim'                   " Search file
Plug 'ap/vim-css-color', {'for': 'css'} " CSS color
call plug#end()

set number		    " Number line
syntax on		    " Support syntax
set mouse=a		    " Mousr support
set ruler		    " Cursor position
set hidden		    " hidden buffers
set smartindent		" hidden buffers
set t_Co=256		" Enable 265 colors
set encoding=utf-8	" Use utf-8 encoding

set cursorline		" The line with the cursor will be highlighted
set wrap	    	" Line wrapping
set nobackup		" Disable backup files
set noswapfile		" Disable *.swp files
set history=1000	" History size 1000 edits
set autoread		" Auto reade file for edit

" Tab
set tabstop=4		" Tab size 4
set shiftwidth=4    " Tab size 4
set expandtab		" Tab consist of space
set smarttab        " Tab consist of space

" Search
set incsearch		" Highlighted
set ignorecase		" Highlighted
set smartcase		" Smart Rigger

" ColoerCheme
set background=dark
colorscheme gruvbox
" Color cheme list
" Dark: adventurs, Atelier_DuneLight, colorsbox-material, colorsbox-faff, OceanocNext, gruvbox, Monokai, vmaterial
" Light: newspaper, newspaper, wikipedia, Atelier_CaveLight, mac_classic
" Outher: off

""""""""""
" MAPING "
""""""""""
let mapleader=','	" Leader key

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Russian letters
map ш i
map м v
map ч x
map в d
map р h
map п g
map о j
map л k
map д l
