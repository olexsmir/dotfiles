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
set linebreak wrap

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
set scrolloff=3

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
set list listchars=tab:\|·,trail:~,extends:>,precedes:<,space:·,eol:\

" Disable sound
set visualbell t_vb=

"== Settings for specific files
autocmd FileType python,go,json setlocal et sw=4 ts=4
autocmd FileType css,javascript,javascriptreact,yaml setlocal noet sw=2 ts=2

"== Aliases
command! W  :w
command! WQ :wq
command! Wq :wq
command! Wiki :e ~/doc/index.md
command! Prettier :silent !prettier % --write
command! ESlint   :!eslint %
command! Flake8   :!flake8 %
command! Black    :silent !black %
command! AutoPep8 :silent !autopep8 % --in-place


"== Mapping
let mapleader=";"

inoremap ii <esc>

" Alternative keys
nnoremap <C-s>      :w<CR>
nnoremap <C-n>      :tabnew<CR>
nnoremap <space>    :nohl<CR>
nnoremap <leader>rr :so ~/.config/nvim/init.vim<CR>

" Window
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" Split
nnoremap spv :vsp<CR>
nnoremap sph :sp<CR>
nnoremap spk :wincmd K<CR>
nnoremap spl :wincmd L<CR>

" Tab
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap <A-1> :tabn 1<CR>
nnoremap <A-2> :tabn 2<CR>
nnoremap <A-3> :tabn 3<CR>
nnoremap <A-4> :tabn 4<CR>
nnoremap <A-5> :tabn 5<CR>
nnoremap <A-6> :tabn 6<CR>
nnoremap <A-7> :tabn 7<CR>
nnoremap <A-8> :tabn 8<CR>
nnoremap <A-9> :tabn 9<CR>

" Buffer
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprev<CR>

" Work with system clipboard
noremap <leader>c "*yy<CR>
noremap <leader>v "+p<CR>

" Terminal
nnoremap <leader>t :vsp<CR>:term<CR>:startinsert<CR>
tnoremap <Esc> <C-\><C-n>
