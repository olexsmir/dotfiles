call plug#begin('~/.vim/plugged')
  " LSP && Completion
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim', {'on': 'EmmetInstall'}
  " File explorer
  Plug 'junegunn/fzf.vim'
  Plug 'kyazdani42/nvim-tree.lua'
  " Git
  Plug 'lewis6991/gitsigns.nvim'
  " Theme
  Plug 'Smirnov-O/nten.vim'
  " Status line & Buffer line
  Plug 'hoob3rt/lualine.nvim'
  Plug 'romgrk/barbar.nvim'
  " Better syntax hl
  Plug 'sheerun/vim-polyglot'
  Plug 'norcalli/nvim-colorizer.lua'
  " Editor config
  Plug 'editorconfig/editorconfig-vim'
  " Other
  Plug 'vimwiki/vimwiki'
  Plug 'nvim-lua/plenary.nvim'
call plug#end()

colo nvcode
let mapleader=";"

"== Tab(or spaces)
set ts=4 sw=4 sts=4
set sta et ai

"== Vim config
source $HOME/.config/nvim/vimscript/config.vim

"== Tab line
source $HOME/.config/nvim/vimscript/barbar.vim

"== Status line
luafile $HOME/.config/nvim/lua/n-lualine.lua

"== File explorer
luafile $HOME/.config/nvim/lua/n-nvimtree.lua

"== Git
luafile $HOME/.config/nvim/lua/n-gitsigns.lua

"== Emmet
source $HOME/.config/nvim/vimscript/emmet.vim

"== Colorizer
luafile $HOME/.config/nvim/lua/n-colorizer.lua

"== Notes
let g:vimwiki_list = [{'path': '~/notes', 'syntax': 'markdown', 'ext': '.md'}]

"== Completion(LSP)
ino <expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
ino <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<tab>"
ino <expr> <cr> compe#confirm('<CR>')
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


"== Custom setting for another files
au FileType python,elm setl sw=4 ts=4
au FileType javascript,json,yaml,lua setl sw=2 ts=2
au FileType javascript,vue,html,css,scss :EmmetInstall
au FileType go setl noet sw=4 ts=4

"== Custom commands
com! Prettier :sil !prettier -w %
com! Term  :vs|winc L|se nonu nornu|start|term
com! GoFmt :sil !gofmt -w %

"== Mapping
source $HOME/.config/nvim/vimscript/mappings.vim
