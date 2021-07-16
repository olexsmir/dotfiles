nno <C-s> :w<cr>
nno <C-p> :GFiles<cr>
nno <C-n> :enew<cr>
nno <leader>; :Files<cr>
nno <space> :noh<cr>

" Buffer
nno <leader>j :bn<cr>
nno <leader>k :bp<cr>

" Compe
ino <expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
ino <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<tab>"
ino <expr> <cr> compe#confirm('<CR>')
ino <expr> <c-space> compe#complete()
nno sr :lua vim.lsp.buf.rename()<cr>
nno sh :lua vim.lsp.buf.hover()<cr>
nno sd :lua vim.lsp.buf.definition()<cr>
nno sa :lua vim.lsp.buf.code_action()<cr>
nno si :lua vim.lsp.buf.implementation()<cr>

" Split
nno <C-h> :winc h<cr>
nno <C-j> :winc j<cr>
nno <C-k> :winc k<cr>
nno<C-l> :winc l<cr>

nno <A-h> :vert res +3<cr>
nno <A-j> :res -3<cr>
nno <A-k> :res +3<cr>
nno <A-l> :vert res -3<cr>

nno spv :vnew<cr>
nno sph :new<cr>
nno spk :winc K<cr>
nno spl :winc L<cr>
