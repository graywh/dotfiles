" vimrc
" Author: Will Gray <graywh@gmail.com>

" Editor {{{1
set autoindent                " ai  - Always set autoindenting on
"set autowrite                " aw  - Automatically save before commands like :next and :make
set backspace=2               " bs  - More powerful backspacing
set nocompatible              " cp  - Use Vim defaults instead of 100% vi compatibility
set expandtab                 " et  - Always expand tabs to spaces
set fileformats=unix,mac,dos  " ffs - End-of-line character
set foldcolumn=1              " fdc - Show top-level fold sections
set hidden                    " hid - Allow hiding changed buffers without override or warning
set history=50                " hi  - Keep 50 lines of command line history
"set ignorecase               " ic  - Do case insensitive matching
set incsearch                 " is  - Incremental search
set linebreak                 " lbr - Don't wrap words by default
set modeline                  " ml  - Let files set their own options
set mouse=a                   "     - Use the mouse for all modes
set number                    " nu  - Show line numbers
set ruler                     " ru  - Show the cursor position all the time
set shiftwidth=4              " sw  - Use 4 spaces for each level of indention
set showcmd                   " sc  - Show (partial) command in status line.
set showmatch                 " sm  - Show matching brackets.
set smarttab                  " sta - Delete expanded tabs
set tabstop=4                 " ts  - Show tabs as 4 spaces
set textwidth=0               " tw  - Don't break lines by default
set viminfo=                  " vi  - Read/write a .viminfo file
set viminfo^='20              "       Remember 20 previously edited files (required)
set viminfo^=<50              "       Remember up to 50 lines of registers
set viminfo^=!                "       Remember some global variables
set viminfo^=h                "       Don't restore the hlsearch highlighting
set wrap                      "     - Wrap lines by default

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd

if has("autocmd")
  " Enabled file type detection
  " Use the default filetype settings. If you also want to load indent files
  " to automatically do language-dependent indenting add 'indent' as well.
  filetype plugin indent on
endif " has ("autocmd")
" }}}1
 
" Syntax {{{1
colorscheme graywh
syntax sync fromstart
syntax on
" PHP {{{2
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1
" Python {{{2
let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1
let python_highlight_doctests = 1
" Ruby {{{2
"let ruby_fold = 1
" }}}1

" Keymap {{{1
" Ctrl-Tab navigation
noremap <silent> <C-Tab> :tabnext<CR>
noremap <silent> <C-S-Tab> :tabprevious<CR>
inoremap <silent> <C-Tab> <Esc>:tabnext<CR>
inoremap <silent> <C-S-Tab> <Esc>:tabprevious<CR>
" Shift-arrow display navigation
noremap <S-Up> g<Up>
noremap <S-Down> g<Down>
inoremap <S-Up> <C-O>g<Up>
inoremap <S-Down> <C-O>g<Down>
" Shift-home/end display navigation
noremap <S-Home> g<Home>
noremap <S-End> g<End>
inoremap <S-Home> <C-O>g<Home>
inoremap <S-End> <C-O>g<End>
" Show the syntax highlighting groups for the item under the cursor
noremap  <F10>  :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> trans<" . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Mac OS X Terminal {{{2
"map <Esc>[H <Home>
"map <Esc>[F <End>
"imap <Esc>[H <Esc>I
"imap <Esc>[F <Esc>A
"map <C-D-\> <Home>
"map <C-D-[> <End>
"imap <C-D-\> <Esc>I
"imap <C-D-[> <Esc>A
" }}}1
