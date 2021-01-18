call plug#begin('~/.vim/plugged')
  Plug 'Smirnov-O/nten16.vim'   " Color scheme
  Plug 'itchyny/lightline.vim'  " Status line
  Plug 'airblade/vim-gitgutter' " Git indicator
  Plug 'preservim/nerdtree'     " File viewer
  Plug 'ap/vim-css-color'       " CSS color preview
  Plug 'mhinz/vim-startify'     " Start page
  Plug 'dense-analysis/ale'     " Linter
  Plug 'editorconfig/editorconfig-vim' " EditorConfig support

  " Completion & snippets
  Plug 'ervandew/supertab'
  Plug 'jiangmiao/auto-pairs'
  Plug 'SirVer/ultisnips'

  " Programing
  Plug 'metakirby5/codi.vim'
  Plug 'plasticboy/vim-markdown',  {'for': 'markdown'}
  Plug 'vim-python/python-syntax', {'for': 'python'}
  Plug 'fatih/vim-go', {'for': 'go'}
  Plug 'PotatoesMaster/i3-vim-syntax', {'for': 'i3'}
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
set mouse=a mousehide
set cursorline

" Encoding
set encoding=utf-8
set fileencodings=utf-8

" Line wrap
set nowrap nolinebreak

" Backup file & history
set nobackup noswapfile
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


" == Language configuration

" Python
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
let g:python_higlight_all = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_string_format = 1
let g:python_highlight_doctests = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_class_vars = 1

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:markdown_fenced_languages = ['go', 'python', 'bash', 'sh=bash']

" Go
let g:go_template_autocreate = 0
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_snippet_engine = ""
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1


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

" UltiSnipts
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<C-tab>"
let g:UltiSnipsSnippetDirectories = ["snips"]

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

" exit from insert mode
im jj <esc>

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
