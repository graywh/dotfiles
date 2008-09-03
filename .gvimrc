" gvimrc
" Author: Will Gray <graywh@gmail.com>

" Settings {{{1
if has("win32")
  set guifont=Monaco:h10
elseif has("macunix")
  set guifont=Monaco:h14
else
  set guifont=Monaco\ 12
endif       
set guioptions=aAegLmrv
set columns=85
set lines=40
set showtabline=1

" Menu {{{1
" File {{{2
anoremenu 10.325 &File.New\ &Tab<Tab>:tabnew :confirm tabnew<CR>
anoremenu 10.325 &File.D&uplicate\ Tab<Tab>:tab\ sp :confirm tab sp<CR>
anoremenu 10.355 &File.Sav&e\ All<Tab>:wall :wall<CR>

" Keymap {{{1
" Mouse back/forward
nmap <X2Mouse> <C-I>
nmap <X1Mouse> <C-O>
" Ctrl-Tab tab navigation
noremap <C-Tab> gt
noremap <C-S-Tab> gT
inoremap <C-Tab> <C-O>gt
inoremap <C-S-Tab> <C-O>gT
" Shift-arrow visual/display navigation
"noremap <S-Up> g<Up>
"noremap <S-Down> g<Down>
"inoremap <S-Up> <C-O>g<Up>
"inoremap <S-Down> <C-O>g<Down>
" Mac OS X {{{2
"nmap <D-n> * :confirm tabnew<CR>
"omap <D-n> <Esc><D-n>
"vmap <D-n> <Esc><D-n>v
" }}}1
