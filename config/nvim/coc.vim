ino <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
ino <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
map <leader>s <Plug>(coc-rename)

let g:coc_global_config = "$HOME/.config/nvim/coc-settings.json"
let g:coc_global_extensions = [
\ "coc-tsserver",
\ "coc-html"
\ ]
