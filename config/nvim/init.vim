call plug#begin('~/.vim/plugged')
    Plug 'nathanaelkane/vim-indent-guides' " Displaying indent levels
    Plug 'itchyny/lightline.vim'           " Status line
    Plug 'Smirnov-O/nten16.vim'            " Color scheme 
    Plug 'frazrepo/vim-rainbow'            " Rainbow brackets
    Plug 'mhinz/vim-startify'              " Start page
    Plug 'ap/vim-css-color'                " CSS color preview  
    Plug 'airblade/vim-gitgutter'          " Git indicator
    Plug 'preservim/nerdcommenter'         " Code commenter

    " Project/file navigation
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'preservim/tagbar',    {'on': 'TagbarToggle'} 
    Plug 'kien/ctrlp.vim',      {'on': 'CtrlP'}

    " Completion & snippets
    Plug 'ycm-core/YouCompleteMe'
    Plug 'jiangmiao/auto-pairs'
    Plug 'SirVer/ultisnips'

    " Language syntax
    Plug 'plasticboy/vim-markdown',      {'for': 'markdown'}
    Plug 'dhruvasagar/vim-table-mode',   {'for': 'markdown'}
    Plug 'xinhangliu/ficus.vim',         {'for': 'markdown'}
    Plug 'vim-python/python-syntax',     {'for': 'python'}
    Plug 'alaviss/nim.nvim',             {'for': 'nim'}
    Plug 'fatih/vim-go',                 {'for': 'go'}
    "Plug 'nsf/gocode',                  {'for': 'go'}
    Plug 'PotatoesMaster/i3-vim-syntax', {'for': 'i3'}
    Plug 'kovetskiy/sxhkd-vim',          {'for': 'sxhkd'}
call plug#end()

" Theme
set termguicolors
colorscheme nten16
set t_Co=256

" Syntax & number line
syntax on
set nu rnu

" Status line
set noshowmode
set ruler
set showcmd

" Mouse
set mouse=a
set mousehide
set cursorline

" Encoding
set encoding=utf-8
set fileencodings=utf-8

" Line wrap
set nowrap
set nolinebreak

" Backup file & history
set nobackup
set noswapfile
set history=100

" Reload file
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

" Buffer(s)
set hidden
set smartindent

" Spell
set spell
set spelllang=en_us

" Disable sound
set visualbell t_vb=

" == Plugins configuration
let g:lightline = {
\ 'colorscheme': 'nten16',
\ 'active': {
\    'left':  [ [ 'mode', 'paste' ],
\               [ 'readonly', 'modified' ] ],
\    'right': [ [ 'lineinfo' ],
\               [ 'percent' ],
\               [ 'filename', 'filetype' ] ]
\ }, }

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:markdown_fenced_languages = ['go', 'python', 'bash', 'sh=bash']
let g:ficus_dir = "~/Documents/Notes"

" Rainbow
let g:rainbow_active = 1

" Python
let g:python_higlight_all = 1

" YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']

" UltiSnipts
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" Go
let g:go_template_autocreate = 0
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_snippet_engine = ""

" TagBar
let g:tagbar_autoclose = 1
let g:tagbar_width     = 18
let g:tagbar_left      = 1

" Nerdtree
let NERDTreeIgnore = ['__pycache__', '.DS_Store', '.git']
let g:NERDTreeWinPos  = "right"
let g:NERDTreeWinSize = 28
let NERDTreeMinimalUI = 1

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

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

" == Mapping
let mapleader=","

" window(s)
nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>
nmap <A-z> :wincmd K<CR>
nmap <A-x> :wincmd L<CR>
nmap <A-c> :wincmd n<CR>

" Tab(s)
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>
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

" Plugins
map <F9> :TagbarToggle<CR>
map <C-b> :NERDTreeToggle<CR>
