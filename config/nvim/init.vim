call plug#begin('~/.vim/plugged')
  Plug 'Smirnov-O/nten16.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'maxboisvert/vim-simple-complete'
  Plug 'pangloss/vim-javascript'
  Plug 'airblade/vim-gitgutter'
  Plug 'dense-analysis/ale'
  "Plug 'editorconfig/editorconfig-vim'
call plug#end()

"== General
" Appearance
set termguicolors
colorscheme nten16

" Line numbers
set nu rnu

" Line wrap
set nowrap nolinebreak

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent

" Status line
"set laststatus=0
set noshowmode showcmd
set ruler

" Mouse
set mouse=a
set mousehide
set cursorline

" Encoding
set encoding=utf-8
set fileencodings=utf-8

" Backup file & history
set nobackup noswapfile
set history=100

" Search
set incsearch
set ignorecase
set smartcase

" Buffer
set hidden

" Spell checker
set spell spelllang=en_us

" Space/tab indicator
set list listchars=tab:>·,trail:~,extends:>,precedes:<,space:·

" Disable sound
set visualbell t_vb=


" == Settings for specific files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd FileType python,go           setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType html,css,javascript setlocal expandtab shiftwidth=2 tabstop=2


"== Aliases
command! W :w
command! Q :q
command! Wq :wq
command! WQ :wq
command! Prettier :!prettier %
command! ESlint :!eslint %


"== Plug in configuration
let g:lightline = {
\ 'colorscheme': 'nten16',
\ 'active': {
\  'left':  [ [ 'mode', 'paste' ],
\             [ 'readonly', 'modified' ] ],
\  'right': [ [ 'lineinfo' ],
\             [ 'percent'  ],
\             [ 'filename', 'filetype' ] ]
\ }, }

let g:ale_disable_lsp = 1
let g:ale_sign_error = '> '
let g:ale_sign_warning = '- '
let g:ale_echo_msg_format = '%severity%: %s'
let g:ale_linter = {
\ 'javascript': 'eslint',
\ 'python': 'flake8'
\ }
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ 'javascript': 'prettier',
\ 'python': 'black'
\ }


"== Mapping
let mapleader="'"

" Window
noremap <C-h> :wincmd h<CR>
noremap <C-j> :wincmd j<CR>
noremap <C-k> :wincmd k<CR>
noremap <C-l> :wincmd l<CR>
noremap <A-z> :wincmd K<CR>
noremap <A-x> :wincmd L<CR>
noremap <A-c> :wincmd n<CR>

" Tab
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

" Buffer
noremap <C-b> :bnext<CR>
noremap <C-p> :bprev<CR>

" Work with system clipboard
noremap <leader>c "*y<CR>
noremap <leader>v "+p<CR>
