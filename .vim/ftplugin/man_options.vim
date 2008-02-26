" Configuration for using vim as a manpage viewer
" Options {{{1
set foldcolumn=0              " Hide the fold column
set hlsearch                  " Highlight all search matches
set laststatus=0              " Hide the statusline
set nolist                    " Hide non-printable characters
set nomodifiable              " Don't allow modification
set nomodified                " So Vim doesn't complain on exiting
set nonumber                  " Hide the line number column
set noruler                   " Hide the ruler line
set shiftwidth=8              " For the best display
set tabstop=8                 " For the best display
set viminfo=                  " Don't save marks, history, and such
" Key mappings {{{1
noremap q :q<CR>              " Easily exit
" }}}1
