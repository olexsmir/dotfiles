call plug#begin('~/.vim/plugged')
  Plug 'Smirnov-O/nten16.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
call plug#end()

"== General
set termguicolors
colorscheme nten16

" Line numbers
set number
set relativenumber

" Line wrap
set nolinebreak
set nowrap

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent

" Status line
set laststatus=0
set ruler

" Folding
set foldmethod=manual

" Maximux item in popup
set pumheight=9

" Scroll
set scrolloff=4

" Mouse
set mouse=a
set mousehide
set cursorline

" Encoding
set encoding=utf-8
set fileencodings=utf-8

" Backup file & history
set nobackup noswapfile noundofile
set history=500

" Search
set incsearch
set ignorecase
set smartcase

" Enable mode line
set modeline

" Auto reload file
set autoread

" Buffer
set hidden

" Space/tab indicator
set list listchars=tab:\|·,trail:~,extends:>,precedes:<,space:·

" Disable sound
set visualbell t_vb=


"== Settings for specific files
autocmd FileType python,go,json setlocal et sw=4 ts=4
autocmd FileType html,css,javascript,javascriptreact,yaml setlocal et sw=2 ts=2


"== Aliases
command! W :w
command! WQ :wq
command! Wq :wq
command! Wiki :e ~/doc/index.md
command! Prettier :!prettier % --write
command! ESlint :!eslint %
command! Flake8 :!flake8 %
command! Black :!black %
command! AutoPep8 :!autopep8 % --in-place


"== Mapping
let mapleader=";"

" Alternative keys
noremap <C-s>     :w<CR>
noremap <C-n>     :tabnew<CR>
noremap <space>   :nohl<CR>
noremap <C-space> zc

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
noremap <leader>j :bnext<CR>
noremap <leader>k :bprev<CR>

" Work with system clipboard
noremap <leader>c "*yy<CR>
noremap <leader>v "+p<CR>

" Kill terminal
tnoremap <Esc> <C-\><C-n> :q<CR>
