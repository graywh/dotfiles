" Configuration for using vim as a manpage viewer
" Options {{{1
setlocal foldcolumn=0              " Hide the fold column
setlocal hlsearch                  " Highlight all search matches
setlocal laststatus=0              " Hide the statusline
setlocal nolist                    " Hide non-printable characters
setlocal nomodifiable              " Don't allow modification
setlocal nomodified                " So Vim doesn't complain on exiting
setlocal nonumber                  " Hide the line number column
setlocal noruler                   " Hide the ruler line
setlocal shiftwidth=8              " For the best display
setlocal tabstop=8                 " For the best display
setlocal viminfo=                  " Don't save marks, history, and such
" Key mappings {{{1
noremap q :q<CR>              " Easily exit
" }}}1
