call plug#begin('~/.vim/plugged')
  Plug 'sheerun/vim-polyglot'
  " LSP && Completion
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'mattn/emmet-vim', {'on': ['EmmetInstall', 'Emmet']}
  Plug 'jiangmiao/auto-pairs'
  " Theme
  Plug 'Smirnov-O/nten.vim'
  " Status line & Buffer line
  Plug 'hoob3rt/lualine.nvim'
  Plug 'romgrk/barbar.nvim'
call plug#end()

"== General
colo codedark         " Color scheme
set termguicolors     " GUI colors
set nu rnu cul        " Line numbers & cursor line highlight
set nolbr nowrap      " Line wrap
set mouse=a mh        " Mouse
set history=500       " Set history size
set autoread          " Auto read file on change
set hidden            " Change buffet without warning
set visualbell t_vb=  " Disable sounds
set pumheight=8       " Maximum items in pop up
set modeline          " Enable modeline
set nosmd             " Disable show mode
set nobk noswf noudf  " Swap files
set is ic scs         " Search
let mapleader=";"     " Set leader key
set spr               " Split
set scrolloff=3
set enc=utf-8 fenc=utf-8  " Encoding
set list listchars=tab:\|·,trail:~,space:·

"== Tab(or spaces)
set ts=4 sw=4 sts=4
set sta et ai

"== Tab line
let bufferline = get(g:, 'bufferline', {})
let g:bufferline.icons = v:false
let g:bufferline.icon_close_tab = '🗴'

"== Status line
lua require'lualine'.setup({options = {
\     theme = "codedark"
\ }})

"== Emmet
let g:user_emmet_mode = "inc"
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {'javascript': {
\   'extends': 'jsx'
\ }}

"== Completion(LSP)
ino <expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
ino <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<tab>"
ino <expr> <CR> compe#confirm('<CR>')
nno sr :lua vim.lsp.buf.rename()<cr>
nno sh :lua vim.lsp.buf.hover()<cr>
nno si :lua vim.lsp.buf.definition()<cr>
nno sa :lua vim.lsp.buf.code_action()<cr>

lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.gopls.setup{}
require'compe'.setup{
  enabled = true,
  autocomplete = true,
  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
  }
}
EOF

"== Netrw file tree
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_dirhistmax = 0

"== Custom setting for another files
au FileType python,elm setl sw=4 ts=4
au FileType javascript,javascriptreact,json,yaml setl sw=2 ts=2
au FileType javascript,javascriptreact,css,scss,less EmmetInstall
au FileType go setl noet sw=4 ts=4

"== Custom commands
com! Prettier :sil !prettier -w %
com! Term  :vs|winc L|se nonu nornu|start|term
com! GoFmt :sil !gofmt -w %
com! Black :sil !black %

"== Mapping
nn <C-s>   :w<cr>
nn <space> :noh<cr>
tno <esc>  <c-\><c-n>
nn <leader>t :Term<cr>
nn <leader>e :Ex<cr>
nn <leader>j :bn<cr>
nn <leader>k :bp<cr>
nn <leader>w :bd<cr>
nn <leader>; :FZF<cr>

nn <C-h> :wincmd h<cr>
nn <C-j> :wincmd j<cr>
nn <C-k> :wincmd k<cr>
nn <C-l> :wincmd l<cr>

nn spv :vs<cr>
nn sph :sp<cr>
nn spk :winc K<cr>
nn spl :winc L<cr>
