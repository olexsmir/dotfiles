" Settings
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = v:false
let bufferline.icon_close_tab = '🗴'

" Mappings
nno <A-1> :BufferGoto 1<cr>
nno <A-2> :BufferGoto 2<cr>
nno <A-3> :BufferGoto 3<cr>
nno <A-4> :BufferGoto 4<cr>
nno <A-5> :BufferGoto 5<cr>
nno <A-6> :BufferGoto 6<cr>
nno <A-7> :BufferGoto 7<cr>
nno <A-8> :BufferGoto 8<cr>
nno <A-9> :BufferGoto 9<cr>
nno <C-w> :BufferClose<cr>
nno <S-x> :BufferClose!<cr>
