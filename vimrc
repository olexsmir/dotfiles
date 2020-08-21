call plug#begin('~/.vim/plugged')
    Plug 'jiangmiao/auto-pairs'
    Plug 'flazz/vim-colorschemes'
    Plug 'itchyny/lightline.vim'
    Plug'junegunn/goyo.vim'
    Plug 'pangloss/vim-javascript', {'for': 'js'}
    Plug 'mattn/emmet-vim', {'for': 'html'}
call plug#end()

set nocompatible    " be iMproved
set laststatus=2

set number         " Number line
"set relativenumber " Number line

syntax on           " Support syntax
set ruler           " Cursor position
set t_Co=256        " Enable 265 colors

set mouse=a         " Mouse support
set mousehide       " Mouse hide 

set encoding=utf-8  " Use utf-8 encoding

set fileencodings=utf8,cp1251

"set cursorline      " The line with the cursor will be highlighted
set wrap            " Line wrappingv
set linebreak       " Line wrappingv

set nobackup        " Disable backup files
set noswapfile      " Disable *.swp files
set history=50      " History size 1000 edits
set autoread        " Auto reade file for edit

set showmode
set showcmd

" Tab
set tabstop=4       " Tab size 4
set shiftwidth=4    " Tab size 4
set softtabstop=4   " Tab size 4
set expandtab       " Tab consist of space
set smarttab
set autoindent

" Search
set incsearch       " Highlighted
set ignorecase      " Highlighted
set smartcase       " Smart Rigger

" Buffers
set hidden
set smartindent	

set visualbell t_vb=    " Mute Vim

" ColoerCheme
set background=dark
colorscheme OceanicNext

" Lightline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }
let g:dcrpc_autostart = 1


" Goyo
let g:goyo_width = 125
let g:goyo_height = '100%'


""""""""""
" MAPING "
""""""""""
let mapleader=','   " Leader key

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tabs
map <leader>tn :tabnew<CR>      " Create new tab
map <leader>tc :tabclose<CR>    " Tab kill
map <leader>1 :tabn 1<CR>       " Change tab
map <leader>2 :tabn 2<CR>       " Change tab
map <leader>3 :tabn 3<CR>       " Change tab
map <leader>4 :tabn 4<CR>       " Change tab
map <leader>5 :tabn 5<CR>       " Change tab
map <leader>6 :tabn 6<CR>       " Change tab
map <leader>7 :tabn 7<CR>       " Change tab
map <leader>8 :tabn 8<CR>       " Change tab
map <leader>9 :tabn 9<CR>       " Change tab

" Bufer
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

""""""""
" GVIM "
""""""""
if has("gui_running")
    set guioptions -=m
    set guioptions -=T
    map <leader>p "+gP          " Past text in buffer
    map <C-Tab> :tabnext<cr>    " Change tab
    map <C-S-Tab> :tabprev<cr>  " Change tab
endif
