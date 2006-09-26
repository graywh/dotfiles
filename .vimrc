" Basic
colo graywh
set mouse=a
syn sync fromstart

" Mac OS X Terminal
map <Esc>[H <Home>
map <Esc>[F <End>
imap <Esc>[H <Esc><Home>i
imap <Esc>[F <Esc><End>i

" PHP
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1

" Python
let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1
let python_highlight_doctests = 1

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor
set shiftwidth=4        " use 4 spaces for each level of indention
set tabstop=4           " show tabs as 4 spaces
set autoindent          " always set autoindenting on
set expandtab           " always expand tabs to spaces
set smarttab            " delete expanded tabs
"set linebreak          " Don't wrap words by default
set textwidth=0         " Don't wrap lines by default
set viminfo='20,\"50    " read/write a .viminfo file, don't store more than
						" 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set hidden              " allow hiding changed buffers without override or warning
" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
"set ignorecase         " Do case insensitive matching
set incsearch           " Incremental search
"set autowrite          " Automatically save before commands like :next and :make

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" || &term =~ "xterm-color"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
  filetype plugin on
endif " has ("autocmd")

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif
