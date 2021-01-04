filetype plugin on
call plug#begin('~/.vim/plugged')
    Plug 'nathanaelkane/vim-indent-guides'         " Displaying indent levels
    Plug 'voldikss/vim-floaterm'                   " Terminal window
    Plug 'frazrepo/vim-rainbow'                    " Rainbow brackets
    Plug 'airblade/vim-gitgutter'                  " Git indicator
    Plug 'ap/vim-css-color'                        " CSS color preview  
    Plug 'mhinz/vim-startify'                      " Start page
    Plug 'itchyny/lightline.vim'                   " Status line
    Plug 'vimwiki/vimwiki', {'on': 'VimwikiIndex'} " Notes manager in (n)vim
    
    " Color scheme
    Plug 'Smirnov-O/nten16.vim'

    " Project/file navigation
    Plug 'scrooloose/nerdtree',    {'on': 'NERDTreeToggle'}
    Plug 'ryanoasis/vim-devicons', {'on': 'NERDTreeToggle'}
    Plug 'preservim/tagbar',       {'on': 'TagbarToggle'} 
    Plug 'kien/ctrlp.vim',         {'on': 'CtrlP'}
    Plug 'easymotion/vim-easymotion'

    " Completion
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Language support
    Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown'}
    Plug 'dhruvasagar/vim-table-mode',   {'for': 'markdown'}
    Plug 'plasticboy/vim-markdown',      {'for': 'markdown'}
    Plug 'vim-python/python-syntax',     {'for': 'python'}
    Plug 'kovetskiy/sxhkd-vim',          {'for': 'sxhkd'}
    Plug 'mattn/emmet-vim',              {'on':  'Emmet'}
    Plug 'cakebaker/scss-syntax.vim',    {'for': 'scss'}
    Plug 'PotatoesMaster/i3-vim-syntax', {'for': 'i3'}
    Plug 'fatih/vim-go',                 {'for': 'go'}
call plug#end()

" Colors
set termguicolors
set background=dark
colo nten16
set t_Co=256

" Syntax & line numbers
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
set fileencodings=utf8

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

" Spell
set spell
set spelllang=en_us

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
let NERDTreeIgnore = ['__pycache__', '.DS_Store', '.git']
let g:NERDTreeWinPos        = "right"
let g:NERDTreeWinSize       = 28
let NERDTreeMinimalUI       = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeShowHidden      = 0
map <C-b> :NERDTreeToggle<CR>

" VimWiki
let g:vimwiki_markdown_link_ext = 0
let g:vimwiki_list = [{
\ 'path': '~/Documents/Notes',
\ 'syntax': 'markdown',
\ 'ext': '.md',
\ }]

" Coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Markdown
let g:vim_markdown_folding_disabled = 1

" Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)
nmap FF <Plug>(easymotion-overwin-line)
nmap FD <Plug>(easymotion-overwin-f2)
nmap FS <Plug>(easymotion-bd-w)

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/]\.git$'
imap <C-p> :CtrlP<CR>
nmap <C-p> :CtrlP<CR>

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1

" Python
let g:python_highlight_all = 1

" Startify
let g:startify_custom_header = [
\ " _____         _____ _         ",
\ " |   | |___ ___|  |  |_|_____  ",
\ " | | | | -_| . |  |  | |     | ",
\ " |_|___|___|___|\___/|_|_|_|_| ",
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
let g:tagbar_autoclose = 1
let g:tagbar_width     = 18
let g:tagbar_left      = 1

" Floaterm
let g:floaterm_title     = "VimTermianl"
let g:floaterm_wintype   = "floating"
let g:floaterm_position  = "center"
let g:floaterm_height    = 0.7
let g:floaterm_width     = 0.6
let g:floaterm_autoclose = 2
nmap <A-t> :FloatermNew<CR>

" Go
let g:go_template_autocreate = 0

" == Maping
let mapleader=","

" Window(s)
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

" Tab(s)
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>
noremap <C-n> :tabnew<CR>
noremap <C-t> :tabnew<CR>
noremap <C-w> :tabclose<CR>
noremap <A-1> :tabn 1<CR>
noremap <A-2> :tabn 2<CR>
noremap <A-3> :tabn 3<CR>
noremap <A-4> :tabn 4<CR>
noremap <A-5> :tabn 5<CR>
noremap <A-6> :tabn 6<CR>
noremap <A-7> :tabn 7<CR>
noremap <A-8> :tabn 8<CR>
noremap <A-9> :tabn 9<CR>

" Buffer(s)
noremap <leader>p :bnext<CR>
noremap <leader>o :bprev<CR>
