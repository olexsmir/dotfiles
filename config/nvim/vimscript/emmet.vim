"== Config
let g:user_emmet_mode = "i"
let g:user_emmet_expandabbr_key ='<c-j>'
let g:user_emmet_leader = ","
let g:user_emmet_settings = {
\ 'javascript': {'extends': 'jsx'}}

"== Auto load
au FileType html,jst,pug,vue,css,less,scss :EmmetInstall
