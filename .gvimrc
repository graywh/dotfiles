set guifont=Monaco:h14
set guioptions=cgmrLaA
set columns=85
set lines=40

anoremenu 10.325 &File.New\ &Tab<Tab>:tabnew   :confirm tabnew<CR>

anoremenu 10.355 &File.Save\ A&ll<Tab>:wall    :wall<CR>

if has("folding")
    anoremenu 1.56 PopUp.Open\ Fold    zo
    anoremenu 1.56 PopUp.Close\ Fold   zc
    anoremenu 1.56 PopUp.-SEP101-      <Nop>
endif

"nmap <D-n> * :confirm tabnew<CR>
"omap <D-n> <Esc><D-n>
"vmap <D-n> <Esc><D-n>v
