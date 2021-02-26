call plug#begin('~/.vim/plugged')
  Plug 'Smirnov-O/nten16.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'maxboisvert/vim-simple-complete'
  Plug 'sheerun/vim-polyglot'
  Plug 'ap/vim-css-color'
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

" Enable mode line
set modeline

" File explorer
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 15

" Auto reload file
set autoread

" Buffer
set hidden

" Spell checker
set nospell spelllang=en_us

" Space/tab indicator
set list listchars=tab:\|·,trail:~,extends:>,precedes:<,space:·

" Disable sound
set visualbell t_vb=

"== Settings for specific files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd FileType python,go,json setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType html,css,javascript,javascriptreact,yaml setlocal expandtab shiftwidth=2 tabstop=2

"== Aliases
command! W :w
command! Q :q
command! Wq :wq
command! WQ :wq
command! Term :vsplit | vertical resize 45 | terminal
command! Wiki :e ~/doc/index.md
command! Prettier :!prettier --write %
command! ESlint :!eslint %
command! Flake8 :!flake8 %
command! Black :!black %
command! AutoPep8 :!autopep8 --in-place %


"== Plug in configuration
let g:lightline = {
\ 'colorscheme': 'nten16',
\ 'active': {
\  'left':  [ [ 'mode', 'paste' ],
\             [ 'readonly', 'modified' ] ],
\  'right': [ [ 'lineinfo' ],
\             [ 'percent'  ],
\             [ 'filename', 'filetype' ] ] }
\ }

"== Mapping
let mapleader="'"

" Alternative keys
noremap <C-s> :w<CR>
noremap <C-n> :tabnew<CR>
noremap <C-t> :tabnew<CR>
noremap <leader>ww :Wiki<CR>
noremap <leader>e :Ve<CR>

" Window
noremap <C-h> :wincmd h<CR>
noremap <C-j> :wincmd j<CR>
noremap <C-k> :wincmd k<CR>
noremap <C-l> :wincmd l<CR>

" Split
noremap spv :vsp<CR>
noremap sph :sp<CR>
noremap spk :wincmd K<CR>
noremap spl :wincmd L<CR>
noremap spn :wincmd n<CR>

" Tab
noremap tn :tabnew<CR>
noremap tc :tabclose<CR>
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
noremap Bn :bnext<CR>
noremap Bp :bprev<CR>

" Work with system clipboard
noremap <leader>y "*yy<CR>
noremap <leader>p "+p<CR>
