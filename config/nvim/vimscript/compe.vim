" Settings
set completeopt=menuone,noselect

" Mappings
ino <expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
ino <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<tab>"
ino <expr> <cr> compe#confirm('<CR>')
nno sr :lua vim.lsp.buf.rename()<cr>
nno sh :lua vim.lsp.buf.hover()<cr>
nno si :lua vim.lsp.buf.definition()<cr>
nno sa :lua vim.lsp.buf.code_action()<cr>
