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

set showmode
set showcmd

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
colorscheme OceanicNext
" Color cheme list
" Dark: adventurs, Atelier_DuneLight, colorsbox-material, colorsbox-faff, OceanicNext, gruvbox, Monokai, material
" Light: newspaper, wikipedia, Atelier_CaveLight, mac_classic
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
map <leader>tn :tabnew<cr>      " Create new tab
map <leader>to :tabonly<cr>     " Kill all tab
map <leader>tc :tabclose<cr>    " Tab kill
map <leader>1 :tabn 1<cr>       " Change tab
map <leader>2 :tabn 2<cr>       " Change tab
map <leader>3 :tabn 3<cr>       " Change tab
map <leader>4 :tabn 4<cr>       " Change tab
map <leader>5 :tabn 5<cr>       " Change tab
map <leader>6 :tabn 6<cr>       " Change tab
map <leader>7 :tabn 7<cr>       " Change tab
map <leader>8 :tabn 8<cr>       " Change tab
map <leader>9 :tabn 9<cr>       " Change tab
map <leader>0 :tablast<cr>      " Change tab

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

if has("gui_running")
    colorscheme Monokai
    set guioptions -=m
    set guioptions -=T
endif
