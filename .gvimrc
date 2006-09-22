set guifont=Monaco:h10
set guioptions=cgmrLaA
set lines=35
set columns=80

an 10.325 &File.New\ &Tab<Tab>:tabnew   :tabnew<CR>

if has("folding")
    an 1.56 PopUp.Open\ Fold    za
    an 1.56 PopUp.Close\ Fold   zc
    an 1.56 PopUp.-SEP101-      <Nop>
endif
