if exists("g:no_plugin_maps") || exists("g:no_gitrebase_maps")
  finish
endif

nnoremap <buffer> <silent> R :Reword<CR>
nnoremap <buffer> <silent> E :Edit<CR>
nnoremap <buffer> <silent> F :Fixup<CR>
nnoremap <buffer> <silent> S :Squash<CR>
nnoremap <buffer> <silent> C :Cycle<CR>

nnoremap <buffer> <C-Down> ddp
nnoremap <buffer> <C-Up> ddkP
