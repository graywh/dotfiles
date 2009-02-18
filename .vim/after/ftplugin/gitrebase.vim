nnoremap <buffer> <silent> S :Squash<CR>
nnoremap <buffer> <silent> E :Edit<CR>
nnoremap <buffer> <silent> C :Cycle<CR>

let b:undo_ftplugin = b:undo_ftplugin . "|unmap <buffer> S|unmap <buffer> E|unmap <buffer> C"
