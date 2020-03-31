call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'stanangeloff/php.vim', {'for': 'php'}
Plug 'ap/vim-css-color', {'for': 'css'}
Plug 'pangloss/vim-javascript', {'for': 'js'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'auxiliary/vim-layout', {'for': 'sh'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'} 
call plug#end()

set guifont=DroidSansMono\ Nerd\ Font\ 11
set termencoding=utf8
syntax on
set number
set mouse=a
set autoindent
set hlsearch
set incsearch
set hidden
set ignorecase
set smartcase
"set expandtab
"set tabstop=4
set t_Co=256
set showtabline=1
set background=dark
colorscheme OceanicNext

set nobackup
set noswapfile
set encoding=utf-8 
set fileencodings=utf8,cp1251

autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-n> :NERDTreeToggle<CR>


nmap <silent> <F8> <Plug>MarkdownPreview 
imap <silent> <F8> <Plug>MarkdownPreview 
nmap <silent> <F9> <Plug>StopMarkdownPreview 
imap <silent> <F9> <Plug>StopMarkdownPreview 
