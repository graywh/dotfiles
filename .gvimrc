" gvimrc
" Author: Will Gray <graywh@gmail.com>

" Options {{{1
" Font {{{2
if has("win32")
  set guifont=DejaVu\ Sans\ Mono:h10
elseif has("macunix")
  set guifont=DejaVu\ Sans\ Mono:h14
else
  set guifont=DejaVu\ Sans\ Mono\ 10
endif

" GUI Display {{{2
set guioptions=aAcegimtv
set guicursor+=a:blinkon0
set noantialias
set columns=85
set lines=40
set vb t_vb=

" MacVim {{{2
if has('gui_macvim')
  set fuoptions=maxvert,maxhorz
endif
" Keymap {{{1
" Mouse back/forward {{{2
nmap <X2Mouse> <C-I>
nmap <X1Mouse> <C-O>
"
" Ctrl-Tab tab navigation {{{2
"noremap <C-Tab> gt
"noremap <C-S-Tab> gT
"inoremap <C-Tab> <C-O>gt
"inoremap <C-S-Tab> <C-O>gT
"
" Shift-arrow visual/display navigation {{{2
"noremap <S-Up> g<Up>
"noremap <S-Down> g<Down>
"inoremap <S-Up> <C-O>g<Up>
"inoremap <S-Down> <C-O>g<Down>
"
" Shift-home/end visual/display navigation {{{2
"noremap <S-Home> g<Home>
"noremap <S-End> g<End>
"inoremap <S-Home> <C-O>g<Home>
"inoremap <S-End> <C-O>g<End>
