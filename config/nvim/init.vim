call plug#begin('~/.vim/plugged')
  Plug 'Smirnov-O/nten16.vim'   " Color scheme
  Plug 'itchyny/lightline.vim'  " Status bar
  Plug 'maximbaz/lightline-ale' " Linter info in bar
  Plug 'dense-analysis/ale'     " Linter
  Plug 'airblade/vim-gitgutter' " Git indicator
  Plug 'ap/vim-css-color'       " Preview CSS colors
  Plug 'SirVer/ultisnips'       " Snippets
  Plug 'jiangmiao/auto-pairs'   " Auto close brackets
  Plug 'editorconfig/editorconfig-vim'  " Editor Config support
  Plug 'christoomey/vim-tmux-navigator' " Jump from vim in tmux
  Plug 'maxboisvert/vim-simple-complete' " Sublime like completion

  " History && file explorer
  Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}     " Git like history
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " File explorer
  Plug 'mattn/emmet-vim', {'for': ['javascript.jsx', 'html']}

  " Language support
  Plug 'pangloss/vim-javascript', {'for': 'javascript'}
  Plug 'mxw/vim-jsx', {'for': ['javascript.jsx', 'javascript']}
  Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
  Plug 'PotatoesMaster/i3-vim-syntax', {'for': 'i3'}
call plug#end()
syntax on

" Theme
set termguicolors
colorscheme nten16
set t_Co=256

" number line
set nu rnu

" Status line
set noshowmode showcmd
set ruler

" Mouse
set mouse=a mousehide
set cursorline

" Encoding
set encoding=utf-8 fileencodings=utf-8

" Line wrap
set nowrap nolinebreak

" Backup file & history
set nobackup noswapfile
set history=100

" Auto reload file
set autoread

" Tabs
set ts=4 sts=4
set expandtab autoindent
set shiftwidth=4

" Search
set incsearch ignorecase smartcase

" Buffer(s)
set hidden smartindent

" Spell
set spell spelllang=en_us

" Space/tab indicator
set list listchars=tab:>·,trail:~,extends:>,precedes:<,space:·

" Disable sound
set visualbell t_vb=

"== Language configuration
let g:jsx_ext_required = 0

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'jsx=javascript.jsx', 'python', 'bash', 'sh=bash']

"== Plug in configuration
let g:lightline = {
\ 'colorscheme': 'nten16',
\ 'active': {
\    'left':  [ [ 'mode', 'paste' ],
\               [ 'readonly', 'modified' ],
\               [ 'linter_errors', 'linter_warnings', 'linter_infos' ] ],
\    'right': [ [ 'lineinfo' ],
\               [ 'percent' ],
\               [ 'filename', 'filetype' ] ]},
\ 'component_expand': {
\   'linter_errors': 'lightline#ale#errors',
\   'linter_infos': 'lightline#ale#infos',
\   'linter_warnings': 'lightline#ale#warnings'
\ }, }

" NERDTree
nnoremap <C-b> :NERDTreeToggle<CR>
let g:NERDTreeWinPos="right"
let NERDTreeIgnore = ['__pycache__', 'node_modules']
let NERDTreeShowHidden=0
let g:NERDTreeWinSize = 28

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"
let g:UltiSnipsSnippetDirectories = ["snips"]
let g:UltiSnipsEditSplit = "vertical"

" Emmet
let g:user_emmet_expandabbr_key='<C-a>'
let g:user_emmet_mode='a'

" Neoterm
let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = 30
let g:neoterm_autoinsert = 1

" Ale
let g:ale_disable_lsp = 1
let g:ale_sign_error = '> '
let g:ale_sign_warning = '- '
let g:ale_echo_msg_format = '%severity%: %s'
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint' ],
\ 'python':     ['flake8',   'pylint8']}

" == Mapping
let mapleader=","
imap jj <esc>

" Window(s)
nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>
nmap <A-z> :wincmd K<CR>
nmap <A-x> :wincmd L<CR>
nmap <A-c> :wincmd n<CR>

" C-j/k as up/down in menu
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")

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
noremap <leader>b :bnext<CR>
noremap <leader>p :bprev<CR>
