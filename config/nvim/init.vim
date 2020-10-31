call plug#begin('~/.vim/plugged')
    Plug 'overcache/NeoSolarized'
    Plug 'ryanoasis/vim-devicons'
    Plug 'itchyny/lightline.vim'
    
    " File manger & seacher
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }

    " Completion
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Language support
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'vim-python/python-syntax', { 'for': 'python' }
    Plug 'mattn/emmet-vim', { 'for': 'html' }
    Plug 'ap/vim-css-color'
call plug#end()

set number
set relativenumber

syntax on
set ruler
set t_Co=256

set mouse=a
set mousehide

set encoding=utf-8
set fileencodings=utf8,cp1251

set cursorline

set nowrap
set nolinebreak

set nobackup
set noswapfile
set history=100
set autoread

set showmode
set showcmd

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

set incsearch
set ignorecase
set smartcase

set hidden
set smartindent

set visualbell t_vb=

set termguicolors
set background=dark
colorscheme NeoSolarized

"""" Plugins """"
let g:lightline = {
\ 'colorscheme': 'selenized_dark',
\ 'active': {
\   'left':  [ [ 'mode', 'paste' ],
\              [ 'readonly', 'modified', 'gitbranch' ] ],
\   'right': [ [ 'lineinfo' ],
\              [ 'percent' ],
\              [ 'filename', 'fileencoding', 'filetype' ] ]
\ }, }

let g:NERDTreeWinPos="right"
let NERDTreeMinimalUI = 1
let NERDTreeShowLineNumbers=0

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"""" Maping """"
let mapleader=","
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-b> :NERDTreeToggle<CR>

noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

noremap <C-n> :tabnew<CR>
noremap <C-t> :tabnew<CR>
noremap <C-w> :tabclose<CR>
noremap <leader>1 :tabn 1<CR>
noremap <leader>2 :tabn 2<CR>
noremap <leader>3 :tabn 3<CR>
noremap <leader>4 :tabn 4<CR>
noremap <leader>5 :tabn 5<CR>
noremap <leader>6 :tabn 6<CR>
noremap <leader>7 :tabn 7<CR>
noremap <leader>8 :tabn 8<CR>
noremap <leader>9 :tabn 9<CR>

noremap <leader>n :bnext<CR>
noremap <leader>p :bprev<CR>
