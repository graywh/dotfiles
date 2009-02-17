" Configuration for using vim as a manpage viewer
" Options {{{1

" Display {{{2
setlocal foldcolumn=0		" Hide the fold column
setlocal nolist			" Hide non-printable characters
setlocal nonumber		" Hide the line number column
setlocal nowrap			" Don't wrap long lines

" Searching, Patterns {{{2
"setlocal hlsearch		" Highlight all search matches

" Other {{{2
setlocal bufhidden=wipe
setlocal buftype=nofile
setlocal readonly		" Don't allow saving
setlocal nomodifiable		" Don't allow modification
setlocal nomodified		" So Vim doesn't complain on exiting
setlocal noswapfile

"nohlsearch			" Unhighlight previous search
" Key mappings {{{1
"nnoremap <buffer> q ZQ
" }}}1
