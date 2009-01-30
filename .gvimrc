" gvimrc
" Author: Will Gray <graywh@gmail.com>

" Settings {{{1
if has("win32")
  set guifont=Monaco:h10
elseif has("macunix")
  set guifont=Monaco:h14
else
  set guifont=DejaVu\ Sans\ Mono\ 10
endif       
set guioptions=aAcegiLmrv
set columns=85
set lines=40
set showtabline=1
set vb t_vb=

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
"noremap <C-Tab> gt
"noremap <C-S-Tab> gT
"inoremap <C-Tab> <C-O>gt
"inoremap <C-S-Tab> <C-O>gT
" Shift-arrow visual/display navigation
"noremap <S-Up> g<Up>
"noremap <S-Down> g<Down>
"inoremap <S-Up> <C-O>g<Up>
"inoremap <S-Down> <C-O>g<Down>
" Shift-home/end visual/display navigation
"noremap <S-Home> g<Home>
"noremap <S-End> g<End>
"inoremap <S-Home> <C-O>g<Home>
"inoremap <S-End> <C-O>g<End>
