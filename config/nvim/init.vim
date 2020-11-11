call plug#begin('~/.vim/plugged')
    Plug 'overcache/NeoSolarized'
    Plug 'ryanoasis/vim-devicons'
    Plug 'itchyny/lightline.vim'
    Plug 'iamcco/markdown-preview.nvim'
    Plug 'dhruvasagar/vim-table-mode'

    " File manger & seacher
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }

    " Completion
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'easymotion/vim-easymotion'

    " Language support
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'vim-python/python-syntax', { 'for': 'python' }
    Plug 'mattn/emmet-vim', { 'on': 'Emmet' }
    Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
    Plug 'dag/vim-fish', { 'for': 'fish' }
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


" =======================
" == Plugins configure ==
" =======================

"""""""" Lightline """""""" 
let g:lightline = {
\ 'colorscheme': 'selenized_dark',
\ 'active': {
\   'left':  [ [ 'mode', 'paste' ],
\              [ 'readonly', 'modified', 'gitbranch' ] ],
\   'right': [ [ 'lineinfo' ],
\              [ 'percent' ],
\              [ 'filename', 'fileencoding', 'filetype' ] ]
\ }, }
"""""""""""""""""""""""""""

""""""""" Nerdtree """"""""
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeWinPos="right"
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']
let NERDTreeMinimalUI = 1
let NERDTreeShowLineNumbers=0
"""""""""""""""""""""""""""

"""""""""""" Coc """"""""""
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"""""""""""""""""""""""""""

"""""""" Easymotion """""""
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap F <Plug>(easymotion-overwin-line)
nmap s <Plug>(easymotion-overwin-f2)
"""""""""""""""""""""""""""

"""" MarkDown Previw """"""
let g:mkdp_path_to_chrome = "/usr/bin/qutebrowser"
"""""""""""""""""""""""""""

" ============
" == Maping ==
" ============
let mapleader=","

" Change window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab's
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
