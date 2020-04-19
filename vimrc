call plug#begin('~/.vim/plugged')
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'
call plug#end()

set number
syntax on
set incsearch
set hlsearch
set ignorecase
set smartcase
set nocompatible
set ruler
set mouse=a
set hidden
set autoindent
set smartindent
set history=150
set termencoding=utf8
set guifont=DroidSansMono\ Nerd\ Font\ 11
set t_Co=256
set background=dark
colorscheme OceanicNext
"Tab for python
set tabstop=4 
set shiftwidth=4
set smarttab
set expandtab

"Maping chenge window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
"Maping Russian letters
map ш i
map м v
map ч x
map в d
map р h
map о j
map л k
map д l
"MarkDownPreview
nmap <silent> <F8> <Plug>MarkdownPreview 
imap <silent> <F8> <Plug>MarkdownPreview 
nmap <silent> <F9> <Plug>StopMarkdownPreview 
imap <silent> <F9> <Plug>StopMarkdownPreview 

"Delate excess spase for python files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
