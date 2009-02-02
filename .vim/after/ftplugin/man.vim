" Configuration for using vim as a manpage viewer
" Options {{{1

" Display {{{2
setlocal foldcolumn=0           " Hide the fold column
setlocal laststatus=0           " Hide the statusline
setlocal nolist                 " Hide non-printable characters
setlocal nonumber               " Hide the line number column
setlocal ruler                  " Show the ruler

" Searching, Patterns {{{2
setlocal hlsearch               " Highlight all search matches

setlocal nomodifiable           " Don't allow modification
setlocal nomodified             " So Vim doesn't complain on exiting
setlocal viminfo=               " Don't save marks, history, and such

nohlsearch                      " Unhighlight previous search
" Key mappings {{{1
noremap q ZQ
" }}}1
