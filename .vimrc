" vimrc
" Author: Will Gray <graywh@gmail.com>

" Options {{{1
"set all&			" Set everything to the default
set nocompatible		" Vim is better than Vi

" Path Munging {{{2
if has("win32")
  let &runtimepath = substitute(&runtimepath, '\(\~\|'.$USER.'\)/vimfiles\>', '\1/.vim', 'g')
endif

silent! call pathogen#runtime_prepend_subdirectories($HOME.'/.vim/bundles')

" Mouse {{{2
set mouse=a			" Use the mouse for all modes
set mousehide			" Hide the mouse while typing
set mousemodel=popup_setpos	" Reposition the cursor on right-click

" Terminal {{{2
set title			" Turn on titlebar support
set ttyscroll=5			" Redraw when scrolling a long ways
set ttymouse=xterm2		" Assume xterm mouse support
if &term =~ 'xterm' || &term =~ 'screen' || &term =~ 'putty' || &term =~ 'konsole'
  set ttyfast			" Because no one should have to suffer
endif

" Navigation {{{2
set nostartofline		" Avoid moving the cursor when moving around
set scrolloff=3			" Leave lines next to window edge
set showmatch			" Show matching brackets.
set sidescrolloff=10		" Leave some characters next to window edge
set virtualedit=block		" Allow block selection anywhere
set virtualedit+=onemore	" Allow cursor to be on the newline

" Editing {{{2
set backspace=indent,eol	" More powerful backspacing
set nrformats=hex,octal,alpha	" Recognize hexadecimal, octal, and characters
				" for ctrl-a/x
set textwidth=0			" Don't break lines
set wrapmargin=0		" Don't break lines based on window size

" Formatting {{{2
set formatoptions=
set formatoptions+=c		" Format comments
set formatoptions+=r		" Continue comments by default
set formatoptions+=o		" Make comment when using o or O
set formatoptions+=q		" Format comments with gq
set formatoptions+=n		" Recognize numbered lists
set formatoptions+=1		" Break before 1-letter words

" Tabs, Indents {{{2
set autoindent			" Always set autoindenting on
set expandtab			" Always expand tabs to spaces
set shiftwidth=4		" Use 4 spaces for each level of indention
set smarttab			" Use 'sw' at begining of line, 'ts' otherwise
set softtabstop=8		" To make backspacing over expanded tabs easier
set tabstop=8			" What tabs are meant to be

" Completion {{{2
set completeopt=longest		" Start with longest part
set completeopt+=menu,preview	"  then show a menu

" Command-line {{{2
set wildmenu			" Use a menu to show tab-completions
set wildmode=longest:full,full	" Complete longest, tab through matches
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
set ignorecase			" Ignore case when searching
set incsearch			" Incremental search
set smartcase			" Search case-insensitive mostly
set wrapscan			" Searches wrap around end of file

" Windows, Buffers {{{2
set hidden			" Allow hiding changed buffers
set switchbuf=useopen,usetab
set splitbelow			" New window goes below
set splitright			" New windows goes right

" Display {{{2
if has("gui_running") || &t_Co > 16
  set cursorline		" Highlight the current line
endif
set foldcolumn=1		" Show top-level fold sections
set linebreak			" Don't wrap words
set list			" Add visual clues (disables 'linebreak')
set number			" Show line numbers
set wrap			" Wrap long lines

set listchars=			" Settings for list mode
if has('multi_byte') && (&tenc =~ '^u\(tf\|cs\)' || (empty(&tenc) && &enc =~ '^u\(tf\|cs\)'))
  "set listchars+=eol:§
  set listchars+=tab:>·
  set listchars+=nbsp:+
  set listchars+=trail:·
  set listchars+=extends:»
  set listchars+=precedes:«
else
  "set listchars+=eol:$
  set listchars+=tab:>-
  set listchars+=nbsp:+
  set listchars+=trail:.
  set listchars+=extends:>
  set listchars+=precedes:<
endif

" Messages, Info, Status {{{2
set laststatus=2		" Always display the statusline
set ruler			" Show position even without status line
set showcmd			" Show (partial) command in status line
set vb t_vb=			" Disable visual and audible bell

" Viminfo {{{2
set history=50			" Keep 50 lines of command line history
set viminfo=			" Read/write a .viminfo file
set viminfo+='20		" Remember 20 previously edited files' marks
set viminfo+=!			" Remember some global variables
set viminfo+=h			" Don't restore the hlsearch highlighting

" Reading, Writing {{{2
set modeline			" Let files set their own options
set fileformats=unix,mac,dos	" End-of-line character

" Diff mode {{{2
set diffopt=filler
set diffopt+=iwhite
set diffopt+=vertical
set diffopt+=foldcolumn:2

" Other {{{2
set winaltkeys=no		" Don't use ALT to access the menu

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
let g:tex_flavor = 'pdflatex' " Use pdflatex as the tex compiler
let g:Twiki_SourceHTMLSyntax = 1 " Let TWiki include HTML syntax
let g:twiki_highlight_r = 1 " <highlight> tags include R
let g:twiki_highlight_perl = 0 " <highlight> tags include perl

let g:Twiki_SourceHTMLSyntax = 1 " Let TWiki include HTML syntax
let g:twiki_highlight_r = 1 " <highlight> tags include R
let g:twiki_highlight_perl = 0 " <highlight> tags include perl

" Space.vim {{{3
let g:space_no_character_movements = 1

" PHP {{{3
let g:php_sql_query = 1
let g:php_htmlInStrings = 1
let g:php_baselib = 1

" Python {{{3
let g:python_highlight_builtins = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_doctests = 1

" Ruby {{{3
"let ruby_fold = 1

" Functions {{{1
function! MyFoldText() " {{{2
  let sub1 = substitute(getline(v:foldstart), '/\*\|\*/\|{{{\d\=\|}}}\d\=', '', 'g')
  let sub1 = substitute(sub1, '\s*$', '')
  let sub2 = substitute(getline(v:foldend), '/\*\|\*/\|{{{\d\=\|}}}\d\=', '', 'g')
  let sub2 = substitute(sub2, '^\s*\(.*\)\s*$', '\1')
  let lines = v:foldend - v:foldstart + 1
  return sub1 . '...' . sub2 . ' (' . lines . ' lines) '
endfunction

function! TrailingSpace() " {{{2
  " return '[\s]' if trailing whitespace is detected
  " return '' otherwise
  if !exists("b:statusline_trailing_space_warning")
    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[\s]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

" Commands {{{1
" Compare a modified file to what is saved on disk
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" Replace tabs with 'shiftwidth' spaces
if has('ex_extra')
  command! -bang -range=% ReTab let ts=&l:ts | let &l:ts=&sw | <line1>,<line2>retab<bang> | let &l:ts=ts | unlet ts
endif

" Remove trailing space
command! -range=% UnTrail <line1>,<line2>s/\s\+$//

" Shift the position under the cursor to column N
command! -nargs=1 Shift exec 'normal '.(<args>-col('.')).'i '

" Save using sudo
command! SUwrite write !sudo tee %

" D'oh
command! -bang -nargs=? -complete=help H help<bang> <args>

" Status line {{{1
" - buffer number (4 columns, lines up with the line numbers most of the time)
" - relative filename & path (truncatable)
" - [Help] flag
" - [Preview] flag
" - modified [+] or not modifiable [-] flag
" - read-only flag [RO]
" - start left-alignment
" - filetype
" - 'set ruler' defaults: line, column [virtual column] percent
set statusline=%4(%n%)\ %<%f\ %h%w%m%r%=%y\ %-14.(%l,%c%V%)\ %P

" See also TrailingSpace

" Autocommands {{{1
augroup vimrcEx
 " clear all existing autocmds
  autocmd!

  " recalculate the trailing whitespace warning when idle, and after saving "
  " use with %{TrailingSpace()} in the statusline
  "autocmd CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning

  autocmd BufWritePre ~/.irssi/saved_colors sort i | sort /:/ n
augroup END

" Keymap {{{1
" make Q like before {{{2
map Q gq

" swap ' and ` {{{2
noremap ' `
noremap ` '

" make Y like D & C {{{2
map Y y$

" Search highlight {{{2
nnoremap <silent> <F6> :set hlsearch!<CR>:set hlsearch?<CR>
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Autocomplete {{{2
inoremap <expr> <C-space> pumvisible() \|\| &omnifunc == '' ? "\<C-n>" : "\<C-x>\<C-o>"
inoremap <C-@> <C-space>

" Add new line indented here {{{2
nnoremap <silent> <Leader>o :let ospaces=virtcol('.')-1<CR>o<Esc>:exec 'normal '.ospaces.'i '<CR>:.retab!<CR>A
nnoremap <silent> <Leader>O :let ospaces=virtcol('.')-1<CR>O<Esc>:exec 'normal '.ospaces.'i '<CR>:.retab!<CR>A

" Change to different capitalization {{{2
"nnoremap <Leader>sc ciw<C-r>=substitute(@", '_\(\w\)', '\u\1', 'g')<CR><Esc>
"nnoremap <Leader>sp ciw<C-r>=substitute(@", '_\(\w\)', '\u\1', 'g')<CR><Esc>bgUl
"nnoremap <Leader>cs ciw<C-r>=substitute(@", '[a-z]\zs\([A-Z]\)', '_\l\1', 'g')<CR><Esc>bgul

" Show the syntax highlighting groups for the item under the cursor {{{2
function! ShowSynStack() " {{{3
  if v:version >= 702 || (v:version == 701 && has("patch215"))
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  else
    echohl Warning
    echo 'Not available in this version.'
    echohl None
  endif
endfunction

function! ShowSynIDs() " {{{3
  let hi = synIDattr(synID(line('.'),col('.'),1),'name')
  let trans = synIDattr(synID(line('.'),col('.'),0),'name')
  let lo = synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')
  echo 'hi<' . hi . '> trans<' . trans . '> lo<' . lo . '>'
endfunction
"}}}3
nnoremap <silent> <F7> :call ShowSynStack()<CR>
nnoremap <silent> <F8> :call ShowSynIDs()<CR>

" Arrow keys for window movement {{{2
nnoremap <silent> <Left> :wincmd h<CR>
nnoremap <silent> <Right> :wincmd l<CR>
nnoremap <silent> <Up> :wincmd k<CR>
nnoremap <silent> <Down> :wincmd j<CR>

" Ctrl-Left/Right for buffer cycling {{{2
nnoremap <silent> <C-Left> :bp<CR>
nnoremap <silent> <C-Right> :bn<CR>
nnoremap <silent> <C-Up> :bp<CR>
nnoremap <silent> <C-Down> :bn<CR>

" Mac OS X Terminal.app {{{2
"map <Esc>[H <Home>
"map <Esc>[F <End>
"map! <Esc>[H <Home>
"map! <Esc>[F <End>
"map <C-D-\> <Home>
"map <C-D-[> <End>
"map! <C-D-\> <Home>
"map! <C-D-[> <End>

" Terminal Stuff {{{1
" XXX Fix vim bug when exiting alt screen {{{2
exe "set t_te=" . &t_te . &t_op

" Manually set the titlestring escape sequences for any terminal {{{2
" that hasn't already and is not known to not support them
if &term !~? '^\v(linux|cons|vt)' && empty(&t_ts) && empty(&t_fs)
  let &t_ts="\<Esc>]2;"
  let &t_fs="\x7"
endif

" change the xterm cursor color for insert mode {{{2
if &term =~ 'xterm'
  let &t_SI="\<Esc>]12;purple\x7"
  let &t_EI="\<Esc>]12;green\x7"
endif

