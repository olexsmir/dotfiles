call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERTreeToggle' }	"Side bar, tree
Plug 'flazz/vim-colorschemes'				"Color thems
Plug 'airblade/vim-gitgutter'				"Git startus line
Plug 'tpope/vim-fugitive'				"Git comands in vim
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}	"Python syntax
Plug 'stanangeloff/php.vim', {'for': 'php'}		"PHP syntax
Plug 'pangloss/vim-javascript', {'for': 'js'}		"JavaScript syntax
Plug 'ap/vim-css-color', {'for': 'css'}			"Hilighting color in css
Plug 'auxiliary/vim-layout', {'for': 'sh'}		"BASH syntax
Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'} "MarkDown syntax
Plug 'elzr/vim-json', {'for': 'json'}			"JSON syntax
Plug 'stacruz/sparkup'					"A parser for a condensed HTML
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
call plug#end()

syntax on
set number
set ignorecase
set hlsearch
set incsearch
set smartcase
set autoindent
set smartindent
set mouse=a
set termencoding=utf8
set guifont=DroidSansMono\ Nerd\ Font\ 11
set t_Co=256
set background=dark
colorscheme OceanicNext
set nocompatible 
filetype off
set encoding=utf-8
set fileencodings=utf8,cp1251
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

Tab settings for Python, according to the recommendations
set tabstop=4 
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4 

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map ш i
map м v
map ч x
map в d
map р h
map о j
map л k
map д l

"All highlight 
let python_highlight_all = 1

"Turn off the sound in Vim
set visualbell t_vb=

"Delate swap vim files
set nobackup
set noswapfile

"Delate excess spase for python files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"NerdTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0

"Maping MarkdownPreview
nmap <silent> <F8> <Plug>MarkdownPreview
imap <silent> <F8> <Plug>MarkdownPreview
nmap <silent> <F9> <Plug>StopMarkdownPreview
imap <silent> <F9> <Plug>StopMarkdownPreview
