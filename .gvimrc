" gvimrc
" Author: Will Gray <graywh@gmail.com>

" Editor {{{1
if has("win32")
  set guifont=Monaco:h10
elseif has("macunix")
  set guifont=Monaco:h14
else
  set guifont=Monaco\ 11
endif       
set guioptions=aAegLmrv
set columns=85
set lines=40
" }}}1

" Menu {{{1
" File {{{2
anoremenu 10.325 &File.New\ &Tab<Tab>:tabnew   :confirm tabnew<CR>
anoremenu 10.355 &File.Save\ A&ll<Tab>:wall    :wall<CR>
" Context {{{2
if has("folding")
  anoremenu 1.56 PopUp.Open\ Fold    zo
  anoremenu 1.56 PopUp.Close\ Fold   zc
  anoremenu 1.56 PopUp.-SEP101-      <Nop>
endif
" }}}1

" Keymap {{{1
"nmap <D-n> * :confirm tabnew<CR>
"omap <D-n> <Esc><D-n>
"vmap <D-n> <Esc><D-n>v
" }}}1
