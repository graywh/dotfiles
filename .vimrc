" vimrc
" Author: Will Gray <graywh@gmail.com>

" Editor {{{
set mouse=a             "     - Use the mouse for all modes
set nocompatible	    " cp  - Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start
                        " bs  - more powerful backspacing
set shiftwidth=4        " sw  - use 4 spaces for each level of indention
set tabstop=4           " ts  - show tabs as 4 spaces
set autoindent          " ai  - always set autoindenting on
set expandtab           " et  - always expand tabs to spaces
set smarttab            " sta - delete expanded tabs
"set linebreak          " lbr - Don't wrap words by default
set textwidth=0         " tw  - Don't wrap lines by default
set viminfo='20,\"50    " vi  - read/write a .viminfo file, don't store more than
						"       50 lines of registers
set history=50          " hi  - keep 50 lines of command line history
set ruler               " ru  - show the cursor position all the time
set number              " nu  - show line numbers
set foldcolumn=1        " fdc - show top-level fold sections
set hidden              " hid - allow hiding changed buffers without override or warning
set showcmd             " sc  - Show (partial) command in status line.
set showmatch           " sm  - Show matching brackets.
"set ignorecase         " ic  - Do case insensitive matching
set incsearch           " is  - Incremental search
"set autowrite          " aw  - Automatically save before commands like :next and :make
" }}}
 
" Syntax {{{
colorscheme graywh
syntax sync fromstart
syntax on

" PHP {{{
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1
" }}}

" Python {{{
let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1
let python_highlight_doctests = 1
" }}}

" Ruby {{{
"let ruby_fold = 1
" }}}
" }}}

" Keymap {{{
" Show the syntax highlighting groups for the item under the cursor
"
map  <F10>  :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Mac OS X Terminal {{{
"map <Esc>[H <Home>
"map <Esc>[F <End>
"imap <Esc>[H <Esc>I
"imap <Esc>[F <Esc>A
"map <C-D-\> <Home>
"map <C-D-[> <End>
"imap <C-D-\> <Esc>I
"imap <C-D-[> <Esc>A
" }}}
" }}}

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd

if has("autocmd")
  " Enabled file type detection
  " Use the default filetype settings. If you also want to load indent files
  " to automatically do language-dependent indenting add 'indent' as well.
  filetype plugin indent on
endif " has ("autocmd")

" vim: ts=2 sw=2 fdm=marker
