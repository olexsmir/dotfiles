nno <C-s> :w<cr>
nno <C-p> :GFiles<cr>
nno <space> :noh<cr>
nno <leader>t :Term<cr>
nno <leader>e :NvimTreeToggle<cr>
nno <leader>; :Files<cr>
nno <leader>d :Neogit<cr>

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
nno sf :lua vim.lsp.buf.formatting()
nno sR :lua vim.lsp.buf.references()<CR>

" Split
nno <C-h> :winc h<cr>
nno <C-j> :winc j<cr>
nno <C-k> :winc k<cr>
nno <C-l> :winc l<cr>

nno spv :vs<cr>
nno sph :sp<cr>
nno spk :winc K<cr>
nno spl :winc L<cr>

" Terminal
tno <esc> <c-\><c-n>
tno <C-h> <c-\><cmd>winc h<cr>
tno <C-j> <c-\><cmd>winc j<cr>
tno <C-k> <c-\><cmd>winc k<cr>
tno <C-l> <c-\><cmd>winc k<cr>
