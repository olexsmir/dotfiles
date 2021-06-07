nno <C-s> :w<cr>
nno <space> :noh<cr>
nno <leader>t :Term<cr>
nno <leader>e :NvimTreeToggle<cr>
nno <leader>; :Files<cr>

" Buffer
nno <leader>j :bn<cr>
nno <leader>k :bp<cr>

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
