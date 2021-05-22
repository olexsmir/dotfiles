call plug#begin('~/.vim/plugged')
  Plug 'Smirnov-O/nten.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim'
  Plug 'axvr/zepl.vim'
call plug#end()

"== General
colo nten-light        " Color scheme
set nu rnu cul         " Line numbers & cursor highlight
set lbr wrap           " Line wrap
set mouse=a mousehide  " Mouse
set ruler laststatus=0 " Status line
set history=500        " Set history size
set autoread           " Auto read file on change
set hidden             " Change buffet without warning
set visualbell t_vb=   " Disable sounds
set pumheight=8        " Maximum items in pop up
set modeline           " Enable modeline
set nobk noswf noudf   " Swap files
set is ic scs          " Search
set scrolloff=3
set enc=utf-8 fenc=utf-8  " Encoding
set list listchars=tab:\|·,trail:~,space:·

"== Tab(or spaces)
set ts=4 sw=4 sts=4
set sta et ai

"== Netrw file tree
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_dirhistmax = 0

"== Custom setting for another files
au FileType python,elm setl sw=4 ts=4
au FileType javascript,javascriptreact,json,yaml setl sw=2 ts=2

"== Custom commands
com! -nargs=1 REpl :cal zepl#start("<args>")|winc L|se nonu nornu
com! Prettier :sil !prettier -w %
com! Term  :vs|winc L|se nonu nornu|term
com! GoFmt :sil !gofmt -w %
com! Black :sil !black %

"== Mapping
let mapleader=";"

nn <C-s> :w<cr>
nn <space> :noh<cr>
tno <esc> <c-\><c-n>

nn <leader>t :Term<cr>
nn <leader>r :REpl<space>
nn <leader>e :Ex<cr>
nn <leader>j :bn<cr>
nn <leader>k :bp<cr>
nn <leader>w :bd<cr>

nn <C-h> :wincmd h<cr>
nn <C-j> :wincmd j<cr>
nn <C-k> :wincmd k<cr>
nn <C-l> :wincmd l<cr>

nn cpp :ReplSend<cr>
vn cpp :ReplSend<cr>
nn spv :vs<cr>
nn sph :sp<cr>

"== LSP(coc)
so $HOME/.config/nvim/coc.vim
