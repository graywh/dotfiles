set guifont=Monaco:h14
set guioptions=cgmrLaA
set columns=140
set lines=40

an 10.325 &File.New\ &Tab<Tab>:tabnew   :confirm tabnew<CR>

an 10.355 &File.Save\ A&ll<Tab>:wall     :wall<CR>

if has("folding")
    an 1.56 PopUp.Open\ Fold    za
    an 1.56 PopUp.Close\ Fold   zc
    an 1.56 PopUp.-SEP101-      <Nop>
endif

"nmap <D-n> * :confirm tabnew<CR>
"omap <D-n> <Esc><D-n>
"vmap <D-n> <Esc><D-n>v
