" vimrc
" Author: Will Gray <graywh@gmail.com>

" Settings {{{1
set all&                        "       Set everything to the default
set nocompatible                " cp  - Vim is better than Vi
set autoindent                  " ai  - Always set autoindenting on
"set autowrite                  " aw  - Automatically save before commands like :next and :make
set backspace=indent,eol,start  " bs  - More powerful backspacing
"set backspace=2                " bs  - More powerful backspacing
"set backup                     " bk  - Make a backup of the file
set completeopt=longest         " cot - Start with longest part
set completeopt+=menu,preview   "     - then show a menu
set expandtab                   " et  - Always expand tabs to spaces
set fileformats=unix,mac,dos    " ffs - End-of-line character
set foldcolumn=1                " fdc - Show top-level fold sections
set hidden                      " hid - Allow hiding changed buffers without override or warning
set history=50                  " hi  - Keep 50 lines of command line history
"set ignorecase                 " ic  - Do case insensitive matching
set incsearch                   " is  - Incremental search
set laststatus=2                " ls  - Always display the statusline
set linebreak                   " lbr - Don't wrap words
if version >= 700
  set listchars=eol:¶           "       Settings for list mode
  set listchars+=tab:>·         "       Display tabs as >···
  set listchars+=nbsp:+         "       Display non-breaking space as +
  set listchars+=trail:·        "       Display trailing space as ·
  set listchars+=extends:»      "       Use » to show more to the right
  set listchars+=precedes:«     "       Use « to show more to the left
end
set modeline                    " ml  - Let files set their own options
set mouse=a                     "     - Use the mouse for all modes
set mousehide                   " mh  - Hide the mouse while typing
set mousemodel=popup_setpos     "     - Reposition the cursor on right-click
set number                      " nu  - Show line numbers
set scrolloff=1                 " so  - Leave a line next to window edge
set shiftwidth=4                " sw  - Use 4 spaces for each level of indention
set showcmd                     " sc  - Show (partial) command in status line
set showmatch                   " sm  - Show matching brackets.
set sidescrolloff=10            "     - Leave some characters next to window edge (w/ nowrap)
set smartcase                   " scs - Search case-insensitive unless...
set smarttab                    " sta - Delete expanded tabs
set softtabstop=4               " sts - Indenting w/ tab gets us 4 spaces (useful w/ expandtab)
set splitbelow                  " sb  - New window goes below
set splitright                  " spr - New windows goes right
set tabstop=8                   " ts  - Show tabs as 8 spaces
set textwidth=0                 " tw  - Don't break lines
if version >= 700
  set viminfo=                  " vi  - Read/write a .viminfo file
  set viminfo+='20              "       Remember 20 previously edited files (required)
  set viminfo+=<50              "       Remember up to 50 lines of registers
  set viminfo+=!                "       Remember some global variables
  set viminfo+=h                "       Don't restore the hlsearch highlighting
end
set virtualedit=block           " ve  - Allow selection anywhere
set wildmenu                    "     - Use a menu to show tab-completions
set wildmode=longest:full,full  " wim - Complete longest, tab through matches
set winaltkeys=no               " wak - Don't use ALT to access the menu
set wrap                        "     - Wrap lines
set wrapmargin=0                " wm  - Don't break lines

" Status line (includes 'set ruler' info)
" - buffer number (4 columns)
" - relative filename & path (truncatable)
" - [Help] flag
" - [Preview] flag
" - modified [+] or not modifiable [-] flag
" - read-only flag [RO]
" - filetype
" - 'set ruler' defaults: line, column [virtual column]     percent
set statusline=%4(%n%)\ %<%f\ %h%w%m%r%=%y\ %-14.(%l,%c%V%)\ %P

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd

if has("autocmd")
  " Enabled file type detection
  " Use the default filetype settings. If you also want to load indent files
  " to automatically do language-dependent indenting add 'indent' as well.
  filetype plugin indent on
endif

colorscheme graywh
syntax sync fromstart
syntax on

" Plugins {{{1
runtime! macros/matchit.vim

" Options {{{2
let g:tex_flavor = "latex" " Use LaTeX as the TeX flavor
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

" Keymap {{{1
" Autocomplete
inoremap <C-space> <C-r>=pumvisible() ? "\<lt>C-e>" : "\<lt>C-x>\<lt>C-o>"<CR>

" Add new line indented here
nnoremap <Leader>o :let ospaces=virtcol(".")-1<CR>o<Esc>:exe "norm ".ospaces."i "<CR>:.retab!<CR>A

nnoremap <Leader>O :let ospaces=virtcol(".")-1<CR>O<Esc>:exe "norm ".ospaces."i "<CR>:.retab!<CR>A
" Change to different capitalization
"nnoremap <Leader>sc ciw<C-r>=substitute(@", '_\(\w\)', '\u\1', 'g')<CR><Esc>
"nnoremap <Leader>sp ciw<C-r>=substitute(@", '_\(\w\)', '\u\1', 'g')<CR><Esc>bgUl
"nnoremap <Leader>cs ciw<C-r>=substitute(@", '[a-z]\zs\([A-Z]\)', '_\l\1', 'g')<CR><Esc>bgul

" Show the syntax highlighting groups for the item under the cursor
nnoremap  <F8>  :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> trans<" . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
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
" Let Vim know what screen can do
if &term =~ '\(screen\|putty\)'
  set ttymouse=xterm2
endif

