"== Vim config
set termguicolors         " GUI colors
set nu rnu nocul          " Line numbers & cursor line highlight
set nolbr nowrap          " Line wrap
set mouse=a mh            " Mouse
set history=500           " Set history size
set autoread              " Auto read file on change
set hidden                " Change buffet without warning
set visualbell t_vb=      " Disable sounds
set pumheight=8           " Maximum items in pop up
set modeline              " Enable modeline
set nosmd                 " Disable show mode
set nobk noswf noudf      " Swap files
set is ic scs             " Search
set spr                   " Split
set enc=utf-8 fenc=utf-8  " Encoding
set scrolloff=3
set list listchars=tab:\|·,trail:~,space:·

"== Netrw file tree
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_dirhistmax = 0
