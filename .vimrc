" vimrc
" Author: Will Gray <graywh@gmail.com>

" Options {{{1
set all&                        " Set everything to the default
set nocompatible                " Vim is better than Vi

" Mouse {{{2
set mouse=a                     " Use the mouse for all modes
set mousehide                   " Hide the mouse while typing
set mousemodel=popup_setpos     " Reposition the cursor on right-click

" Terminal {{{2
set title                       " Turn on titlebar support
set ttyscroll=5                 " Redraw when scrolling a long ways
set ttymouse=xterm2             " Assume xterm mouse support

" Navigation {{{2
set scrolloff=1                 " Leave a line next to window edge
set showmatch                   " Show matching brackets.
set sidescrolloff=10            " Leave some characters next to window edge (w/ nowrap)
set virtualedit=block           " Allow block selection anywhere
set virtualedit+=onemore        " Allow cursor to be on the newline

" Editing {{{2
set backspace=indent,eol,start  " More powerful backspacing
set nrformats=hex,octal,alpha   " Recognize hexadecimal, octal, and characters for ctrl-a/x
set textwidth=0                 " Don't break lines
set wrapmargin=0                " Don't break lines based on window size

" Tabs, Indents {{{2
set autoindent                  " Always set autoindenting on
set expandtab                   " Always expand tabs to spaces
set shiftwidth=4                " Use 4 spaces for each level of indention
set smarttab                    " Use 'sw' at begining of line, 'ts' otherwise
set softtabstop=8               " To make backspacing over expanded tabs easier
set tabstop=8                   " What tabs are meant to be

" Completion {{{2
set completeopt=longest         " Start with longest part
set completeopt+=menu,preview   "  then show a menu

" Command-line {{{2
set wildmenu                    " Use a menu to show tab-completions
set wildmode=longest:full,full  " Complete longest, tab through matches
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll

" Encoding {{{2
if has('multi_byte') && &enc !~ '^u\(tf\|cs\)'
  if empty(&tenc)
    let &tenc = &enc
  endif
  set encoding=utf-8
endif

" Searching, Patterns {{{2
set ignorecase                  " Ignore case when searching
set incsearch                   " Incremental search
set smartcase                   " Search case-insensitive mostly

" Windows, Buffers {{{2
set hidden                      " Allow hiding changed buffers without override or warning
set splitbelow                  " New window goes below
set splitright                  " New windows goes right

" Display {{{2
set foldcolumn=1                " Show top-level fold sections
set linebreak                   " Don't wrap words
set list                        " Add visual clues (disables 'linebreak')
set number                      " Show line numbers
set wrap                        " Wrap long lines

set listchars=                  " Settings for list mode
"set listchars+=eol:$
set listchars+=tab:>-
set listchars+=nbsp:+
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<
if has('multi_byte') && &tenc =~ '^u\(tf\|cs\)'
  "set listchars+=eol:¶
  set listchars+=tab:>·
  set listchars+=nbsp:+
  set listchars+=trail:·
  set listchars+=extends:»
  set listchars+=precedes:«
endif

" Messages, Info, Status {{{2
set laststatus=2                " Always display the statusline
set ruler                       " Show position even without status line
set showcmd                     " Show (partial) command in status line
set vb t_vb=                    " Disable visual and audible bell

" Viminfo {{{2
set history=50                  " Keep 50 lines of command line history
set viminfo=                    " Read/write a .viminfo file
set viminfo+='20                " Remember 20 previously edited files' marks (required)
set viminfo+=!                  " Remember some global variables
set viminfo+=h                  " Don't restore the hlsearch highlighting

" Reading, Writing {{{2
set modeline                    " Let files set their own options
set fileformats=unix,mac,dos    " End-of-line character

" Other {{{2
set winaltkeys=no               " Don't use ALT to access the menu

" Filetype {{{2
" Enabled file type detection
" Use the default filetype settings. If you also want to load indent files
" to automatically do language-dependent indenting add 'indent' as well.
filetype plugin indent on
syntax enable
syntax sync fromstart

" Colors {{{2
colorscheme graywh

" Plugins {{{1
runtime! macros/matchit.vim

" Options {{{2
let g:tex_flavor = 'latex' " Use LaTeX as the TeX flavor

" PHP {{{3
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1

" Python {{{3
let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1
let python_highlight_doctests = 1

" Ruby {{{3
"let ruby_fold = 1
" }}}3

" Commands {{{1
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" Functions {{{1
function! MyFoldText()
  let sub1 = substitute(getline(v:foldstart), '/\*\|\*/\|{{{\d\=\|}}}\d\=', '', 'g')
  let sub2 = substitute(getline(v:foldend), '/\*\|\*/\|{{{\d\=\|}}}\d\=', '', 'g')
  let sub2 = substitute(sub2, '^\s*', '')
  let lines = v:foldend - v:foldstart + 1
  return sub1.'...'.sub2.' ('.lines.' lines) '
endfunction

function! ShowSynStack()
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" return '[\s]' if trailing whitespace is detected
" return '' otherwise
function! TrailingSpace()
  if !exists("b:statusline_trailing_space_warning")
    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[\s]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

" Status line {{{1
" (includes 'set ruler' info)
" - buffer number (4 columns, lines up with the line numbers most of the time)
" - relative filename & path (truncatable)
" - [Help] flag
" - [Preview] flag
" - modified [+] or not modifiable [-] flag
" - read-only flag [RO]
" - filetype
" - 'set ruler' defaults: line, column [virtual column]     percent
set statusline=%4(%n%)\ %<%f\ %h%w%m%r%=%y\ %-14.(%l,%c%V%)\ %P

" Autocommands {{{1
"augroup vimrcEx
"  au!
"  " recalculate the trailing whitespace warning when idle, and after saving
"  " use with %{TrailingSpace()} in the statusline
"  autocmd CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning
"augroup END

" Keymap {{{1
" Autocomplete
inoremap <C-space> <C-r>=pumvisible() ? '\<lt>C-e>' : '\<lt>C-x>\<lt>C-o>'<CR>

" Add new line indented here
nnoremap <Leader>o :let ospaces=virtcol('.')-1<CR>o<Esc>:exe 'norm '.ospaces.'i '<CR>:.retab!<CR>A
nnoremap <Leader>O :let ospaces=virtcol('.')-1<CR>O<Esc>:exe 'norm '.ospaces.'i '<CR>:.retab!<CR>A

" Change to different capitalization
"nnoremap <Leader>sc ciw<C-r>=substitute(@", '_\(\w\)', '\u\1', 'g')<CR><Esc>
"nnoremap <Leader>sp ciw<C-r>=substitute(@", '_\(\w\)', '\u\1', 'g')<CR><Esc>bgUl
"nnoremap <Leader>cs ciw<C-r>=substitute(@", '[a-z]\zs\([A-Z]\)', '_\l\1', 'g')<CR><Esc>bgul

" Show the syntax highlighting groups for the item under the cursor
nnoremap <F8> :echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<' . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'<CR>
nnoremap <F7> :call ShowSynStack()<CR>

" Mac OS X Terminal.app {{{2
"map <Esc>[H <Home>
"map <Esc>[F <End>
"imap <Esc>[H <C-O><Home>
"imap <Esc>[F <C-O><End>
"map <C-D-\> <Home>
"map <C-D-[> <End>
"imap <C-D-\> <C-O><Home>
"imap <C-D-[> <C-O><End>

" Terminal Stuff {{{1
" XXX Fix vim bug when exiting alt screen
exe "set t_te=" . &t_te . &t_op

" Manually set the titlestring escape sequences for any terminal
" that hasn't already and is not known to not support them
if &term !~? '^\v(linux|cons|vt)' && empty(&t_ts) && empty(&t_fs)
  let &t_ts="\<Esc>]2;"
  let &t_fs="\x7"
endif

" change the xterm cursor color for insert mode
if &term =~ 'xterm'
  let &t_SI="\<Esc>]12;purple\x7"
  let &t_EI="\<Esc>]12;green\x7"
endif
