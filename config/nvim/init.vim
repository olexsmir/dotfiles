call plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'Smirnov-O/nten16.vim'
    Plug 'vim-scripts/bclear'
    Plug 'easymotion/vim-easymotion'
    Plug 'voldikss/vim-floaterm', { 'on': 'FloatermNew' }
    Plug 'mhinz/vim-startify'
    Plug 'severin-lemaignan/vim-minimap'
    Plug 'frazrepo/vim-rainbow'
    Plug 'preservim/tagbar', { 'on': 'TagbarToggle' } 
    Plug 'airblade/vim-gitgutter'

    " File manger & seacher
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' }
    Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }

    " Completion
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Language support
    Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown' }
    Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
    Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
    Plug 'kovetskiy/sxhkd-vim', { 'for': 'sxhkd' }
    Plug 'mattn/emmet-vim', { 'on': 'Emmet' }
    Plug 'Olical/vim-scheme', { 'for': 'scheme' }
    Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
    Plug 'vim-python/python-syntax', { 'for': 'python' }
    Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
    Plug 'dag/vim-fish', { 'for': 'fish' }
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    Plug 'ap/vim-css-color'
call plug#end()

set termguicolors
set background=dark
colorscheme nten16
set t_Co=256

" Syntax & line numbars
syntax on
set number
set relativenumber

" Vim status line
set noshowmode
set ruler
set showmode
set showcmd

" Mouse
set mouse=a
set mousehide
set cursorline

" File encoding
set encoding=utf-8
set fileencodings=utf8,cp1251

" Line wrap
set nowrap
set nolinebreak

" Backup files & history
set nobackup
set noswapfile
set history=100

" Auto reload file
set autoread

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Search
set incsearch
set ignorecase
set smartcase

" Buffer
set hidden
set smartindent

" Disable sound
set visualbell t_vb=

" == Plugins configure

" Lightline
let g:lightline = {
\ 'colorscheme': 'nten16',
\ 'active': {
\   'left':  [ [ 'mode', 'paste' ],
\              [ 'readonly', 'modified' ] ],
\   'right': [ [ 'lineinfo' ],
\              [ 'percent' ],
\              [ 'filename', 'fileencoding', 'filetype' ] ]
\ }, }

" Nerdtree
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=28
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=0

" Coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Markdown
let g:vim_markdown_folding_disabled = 1

" Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)
nmap <Leader>w <Plug>(easymotion-bd-w)
nmap F <Plug>(easymotion-overwin-line)
nmap s <Plug>(easymotion-overwin-f2)

" CtrlP
map <C-p> :CtrlP<CR>
imap <C-p> :CtrlP<CR>
nmap <C-p> :CtrlP<CR>

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1

" Python
let g:python_highlight_all = 1

" Startify
let g:startify_custom_header = [
    \" _____         _____ _         ",
    \" |   | |___ ___|  |  |_|_____  ",
    \" | | | | -_| . |  |  | |     | ",
    \" |_|___|___|___|\___/|_|_|_|_| ",
    \ ]
let g:startify_lists = [
    \ { 'type': 'bookmarks', 'header': ["  Bookmarks"] },
    \ { 'type': 'files',     'header': ["  Files"] },
    \ ]

" Rainbow
let g:rainbow_active = 1 

" TagBar
imap <F9> :TagbarToggle<CR>
nmap <F9> :TagbarToggle<CR>
map <F9> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_width = 18
let g:tagbar_left = 1

" Floaterm
nmap <A-t> :FloatermNew --title=vimterminal --position=top --autoclose=2<CR>

" == Maping
let mapleader=","

" Window
nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>
nmap <A-q> :wincmd q<CR>
nmap <A-c> :wincmd n<CR>
nmap <A-z> :wincmd K<CR>
nmap <A-x> :wincmd L<CR>
nmap <A-h> :wincmd <<CR>
nmap <A-l> :wincmd ><CR>

" Tab's
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>
noremap <C-n> :tabnew<CR>
noremap <C-t> :tabnew<CR>
noremap <C-S-w> :tabclose<CR>
noremap <A-1> :tabn 1<CR>
noremap <A-2> :tabn 2<CR>
noremap <A-3> :tabn 3<CR>
noremap <A-4> :tabn 4<CR>
noremap <A-5> :tabn 5<CR>
noremap <A-6> :tabn 6<CR>
noremap <A-7> :tabn 7<CR>
noremap <A-8> :tabn 8<CR>
noremap <A-9> :tabn 9<CR>
noremap <C-a> :bnext<CR>
noremap <C-s> :bprev<CR>
