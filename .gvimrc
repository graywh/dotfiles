" gvimrc
" Author: Will Gray <graywh@gmail.com>

" Options {{{1
" Font {{{2
if has('win16') || has('win32') || has('win64')
  set guifont=DejaVu\ Sans\ Mono:h10
elseif has('macunix')
  set guifont=DejaVu\ Sans\ Mono:h14
else
  set guifont=DejaVu\ Sans\ Mono\ 10
endif

" GUI Display {{{2
set guioptions=
set guioptions+=a               " Automatically make visual selection available in system clipboard
set guioptions+=A               " Same for modeless selection
set guioptions+=c               " Use console dialogs instead of popups
set guioptions+=e               " GUI tabs
set guioptions+=g               " Grayed-out menu items that aren't active
set guioptions+=i               " Use a Vim icon
set guioptions+=m               " Show the menu bar
set guioptions+=t               " Tear-off menus
set guioptions+=v               " Use a vertical layout for gui dialogs
set guicursor+=a:blinkon0       " Don't blink the cursor
set mousehide                   " Hide the mouse while typing
set noantialias                 " Don't anti-alias fonts?
set columns=85                  " 80 + numberwidth + foldcolumn
set lines=40
set vb t_vb=                    " Disable visual and audible bell
set winaltkeys=no               " Don't use ALT to access the menu

" MacVim {{{2
if has('gui_macvim')
  set fuoptions=maxvert,maxhorz " Full-screen mode uses the full screen
endif

" Keymap {{{1
" Mouse back/forward {{{2
nmap <X2Mouse> <C-I>
nmap <X1Mouse> <C-O>

" Shift-arrow visual/display navigation {{{2
"noremap  <S-Up>   g<Up>
"noremap  <S-Down> g<Down>
"inoremap <S-Up>   <C-O>g<Up>
"inoremap <S-Down> <C-O>g<Down>

" Shift-home/end visual/display navigation {{{2
"noremap  <S-Home> g<Home>
"noremap  <S-End>  g<End>
"inoremap <S-Home> <C-O>g<Home>
"inoremap <S-End>  <C-O>g<End>
