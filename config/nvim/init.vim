call plug#begin("~/.vim/plugged")
  Plug 'Smirnov-O/nten16.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/nerdtree'
  Plug 'w0rp/ale'
call plug#end()

"== General
set termguicolors
colorscheme nten16

" Line numbers
set nu rnu

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
set ruler laststatus=0

" Maximux item in popup
set pumheight=8

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
set list listchars=tab:\|·,trail:~,extends:>,precedes:<,space:·

" Disable sound
set visualbell t_vb=


"== Aliases
command! Term     :vs|wincmd L|vert res 50|set nonu nornu|startinsert|term
command! Prettier :silent !prettier % --write
command! ESlint   :!eslint %
command! Black    :silent !black %
command! AutoPep8 :silent !autopep8 % --in-place
command! Flake8   :!flake8 %
command! GoFmt    :silent !gofmt -w %
command! GoLint   :!golint %


"== Settings for specific files
autocmd FileType python setlocal ex sw=4 ts=4
autocmd FileType go setlocal noex sw=4 ts=4
autocmd FileType javascript,javascriptreact,yaml setlocal et sw=2 ts=2


"== ALE
let g:ale_disable_lsp = 1
let g:ale_echo_msg_format = '%severity%: %s'
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'python': ['flake8'],
\ 'go': ['golint']
\ }


"== NERDTree
let g:NERDTreeWinPos = "right"
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 24


"== Mapping
let mapleader=";"

" NerdTree
nnoremap <leader>e :NERDTreeToggle<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>t :Term<CR>

" Alternative keys
nnoremap <C-s>   :w<CR>
nnoremap <C-n>   :tabnew<CR>
nnoremap <space> :noh<CR>

" Window
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" Split
nnoremap spv :vsp<CR>
nnoremap sph :sp<CR>
nnoremap spj :wincmd K<CR>
nnoremap spk :wincmd L<CR>

" Tab
nnoremap tn :tabnew<CR>
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
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprev<CR>
nnoremap <leader>h :bdele<CR>

" Working with system clipboard
noremap <leader>c "+y<CR>
noremap <leader>v "+p<CR>
