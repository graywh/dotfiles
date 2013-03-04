" Configuration for using vim as a manpage viewer
" Options {{{1

" Display {{{2
setlocal foldcolumn=0           " Hide the fold column
setlocal nolist                 " Hide tabs, etc.
setlocal nonumber               " Hide the line number column
setlocal nowrap                 " Don't wrap long lines

" Searching, Patterns {{{2
" setlocal hlsearch              " Highlight all search matches
setlocal iskeyword+=45          " Include - for command names

" Other {{{2
setlocal bufhidden=wipe
setlocal buftype=nofile
setlocal readonly               " Don't allow saving
setlocal nomodifiable           " Don't allow modification
setlocal nomodified             " So Vim doesn't complain on exiting
setlocal noswapfile

" nohlsearch                     " Unhighlight previous search
" Key mappings {{{1
nnoremap <buffer> <unique> <silent> K :Man <C-r><C-w><CR>
xnoremap <buffer> <unique> <silent> K y:Man <C-r>"<CR>
nnoremap <buffer> <unique> q :q<CR>
" }}}1

let b:undo_ftplugin = 'setl fdc< list< nu< wrap< isk< bh< bt< ro< ma< mod< swf<'
