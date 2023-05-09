"       ________ ++     ________
"      /VVVVVVVV\++++  /VVVVVVVV\
"      \VVVVVVVV/++++++\VVVVVVVV/
"       |VVVVVV|++++++++/VVVVV/'
"       |VVVVVV|++++++/VVVVV/'
"      +|VVVVVV|++++/VVVVV/'+
"    +++|VVVVVV|++/VVVVV/'+++++
"  +++++|VVVVVV|/VVV___++++++++++
"    +++|VVVVVVVVVV/##/ +_+_+_+_
"      +|VVVVVVVVV___ +/#_#,#_#,\
"       |VVVVVVV//##/+/#/+/#/'/#/
"       |VVVVV/'+/#/+/#/+/#/ /#/
"       |VVV/'++/#/+/#/ /#/ /#/
"       'V/'  /##//##//##//###/
"                ++

" Nice {{{
set autochdir autoread scrolloff=1 sidescrolloff=5 hidden
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
if $TERM != 'linux' && $KMSCON != 'yes' && $TERM != 'rxvt-unicode-256color' 
  let g:gruvbox_transparent_bg = 1
  " colorscheme gruvbox
endif
source ~/.config/bothvim/private.vim
nnoremap <SPACE> <Nop>
let mapleader=' '
set mouse=a
set undofile
" }}}

" Syntax {{{
filetype plugin on
syntax on
set conceallevel=2 concealcursor=n " omnifunc=syntaxcomplete#Complete
let g:vimsyn_embed = 'lmpPrt'
" }}}

" Spell {{{
set spell spelllang=en_us
autocmd BufNewFile,BufRead */JAPN* setlocal nospell
" }}}

" Line Numbers {{{
set number relativenumber numberwidth=1
" }}}

" Indent {{{
filetype indent on
set expandtab shiftwidth=2 softtabstop=2 list lcs=tab:\▏\ 
" }}}

" Filetype {{{
au BufNewFile,BufRead /*.rasi setf css
au BufNewFile,BufRead /*.ffpreset setf conf
au BufNewFile,BufRead /*.avpreset setf conf
au BufNewFile,BufRead /*.hook setf conf
au BufNewFile,BufRead /*.mcmeta setf json
au BufNewFile,BufRead /*.i3config setf i3config
au BufNewFile,BufRead /*.swayconfig setf swayconfig
au BufNewFile,BufRead /var/tmp/*.service setf systemd
au BufNewFile,BufRead /var/tmp/*.timer setf systemd
" }}}

" Plugins {{{

" Grammarous 
let g:grammarous#use_vim_spelllang = 1
let g:grammarous#languagetool_cmd = 'languagetool'

" }}}

" Terminal {{{
command! T :bufdo bd|terminal
command! Tw :w|T
command! Twa :wa|T
" }}}

" vim:foldmethod=marker
