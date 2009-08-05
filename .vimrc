" vimrc
" Author: Will Gray <graywh@gmail.com>

" Options {{{1
"set all&                       " Set everything to the default
set nocompatible                " Vim is better than Vi

" Path Munging {{{2
if has('win32')
  let &runtimepath = substitute(&runtimepath, '\(\~\|'.$USER.'\)/vimfiles\>', '\1/.vim', 'g')
endif

silent! call pathogen#runtime_prepend_subdirectories($HOME.'/.vim/bundles')

" Mouse {{{2
if has('mouse')
  set mouse=a                   " Use the mouse for all modes
endif
set mousemodel=popup_setpos     " Reposition the cursor on right-click

" Terminal {{{2
set title                       " Turn on titlebar support
set ttyscroll=5                 " Redraw when scrolling a long ways
set ttymouse=xterm2             " Assume xterm mouse support
if &term =~ 'xterm' || &term =~ 'screen' || &term =~ 'putty' || &term =~ 'konsole'
  set ttyfast                   " Because no one should have to suffer
endif

" Navigation {{{2
set nostartofline               " Avoid moving the cursor when moving around
set scrolloff=3                 " Leave lines next to window edge
set showmatch                   " Show matching brackets.
set sidescrolloff=10            " Leave some characters next to window edge (w/ nowrap)
if exists('&virtualedit')
  set virtualedit=onemore       " Allow cursor to be on the newline
endif

" Editing {{{2
set backspace=indent,eol,start  " More powerful backspacing
set nrformats=hex,octal,alpha   " Recognize hexadecimal, octal, and characters for ctrl-a/x
set textwidth=78                " Seems like a good place to break lines
set wrapmargin=0                " Don't break lines based on window size

" Formatting {{{2
set formatoptions=
set formatoptions+=c            " Format comments
set formatoptions+=r            " Continue comments by default
set formatoptions+=o            " Make comment when using o or O from comment line
set formatoptions+=q            " Format comments with gq
set formatoptions+=n            " Recognize numbered lists
set formatoptions+=2            " Use indent from 2nd line of a paragraph
set formatoptions+=l            " Don't break lines that are already long
set formatoptions+=1            " Break before 1-letter words

set formatlistpat=^\\s*\\(\\d\\+\\\|\\*\\\|-\\)[\\]:.)}\\t\ ]\\s*

" Tabs, Indents {{{2
set autoindent                  " Always set autoindenting on
set expandtab                   " Always expand tabs to spaces
set shiftwidth=4                " Use 4 spaces for each level of indention
set smarttab                    " Use 'sw' at begining of line, 'ts' otherwise
set softtabstop=8               " To make backspacing over expanded tabs easier
set tabstop=8                   " What tabs are meant to be

" Completion {{{2
if exists('&completeopt')
  set completeopt=longest       " Start with longest part
  set completeopt+=menu,preview "  then show a menu
endif

" Command-line {{{2
set wildmenu                    " Use a menu to show tab-completions
set wildmode=longest:full,full  " Complete longest, tab through matches
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll

" Encoding {{{2
if has('multi_byte') && &enc !~? '^u\(tf\|cs\)'
  if !strlen(&tenc) && exists(':let') == 2
    let &tenc = &enc
  endif
  set encoding=utf-8
endif

" Searching, Patterns {{{2
set ignorecase                  " Ignore case when searching
set incsearch                   " Incremental search
set smartcase                   " Search case-insensitive mostly
set wrapscan                    " Searches wrap around end of file

" Windows, Buffers {{{2
set hidden                      " Allow hiding changed buffers
if exists('&switchbuf')
  set switchbuf=useopen
  try
    set switchbuf+=usetab
  endtry
endif
set splitbelow                  " New window goes below
set splitright                  " New windows goes right

" Display {{{2
if (has('gui_running') || &t_Co > 16) && exists('&cursorline')
  set cursorline                " Highlight the current line
endif
set display=lastline            " Show as much as possible of wrapped lines
if exists('&foldcolumn')
  set foldcolumn=1              " Show top-level fold sections
endif
set linebreak                   " Don't wrap words
set list                        " Add visual clues (disables 'linebreak')
set number                      " Show line numbers
set numberwidth=4
set wrap                        " Wrap long lines

set listchars=                  " Settings for list mode
if has('multi_byte') && (&tenc =~? '^u\(tf\|cs\)' || (! strlen(&tenc) && &enc =~? '^u\(tf\|cs\)')) && (v:version >= 602 || v:version == 601 && has('patch469'))
  "set listchars+=eol:§
  set listchars+=tab:»·
  try
    set listchars+=nbsp:+
  endtry
  set listchars+=trail:·
  set listchars+=extends:→
  set listchars+=precedes:←
else
  if v:version < 603
    " :print may behave badly with this disabled
    "set listchars+=eol:$
  endif
  set listchars+=tab:>-
  try
    set listchars+=nbsp:+
  endtry
  set listchars+=trail:.
  set listchars+=extends:>
  set listchars+=precedes:<
endif

" Messages, Info, Status {{{2
set laststatus=2                " Always display the statusline
set ruler                       " Show position even without status line
set showcmd                     " Show (partial) command in status line
set vb t_vb=                    " Disable visual and audible bell

" Viminfo {{{2
set history=50                  " Keep 50 lines of command line history
set viminfo=                    " Read/write a .viminfo file
set viminfo+='20                " Remember 20 previously edited files' marks
set viminfo+=!                  " Remember some global variables
set viminfo+=h                  " Don't restore the hlsearch highlighting

" Reading, Writing {{{2
set modeline                    " Let files set their own options
set fileformats=unix,mac,dos    " End-of-line character

" Diff mode {{{2
set diffopt=filler
set diffopt+=iwhite
if exists('&diffopt')
  set diffopt+=vertical
  set diffopt+=foldcolumn:2
endif

" Other {{{2
set winaltkeys=no               " Don't use ALT to access the menu

" Filetype {{{2
" Enabled file type detection
" Use the default filetype settings. If you also want to load indent files
" to automatically do language-dependent indenting add 'indent' as well.
if has('autocmd') && exists(':filetype') == 2
  filetype plugin indent on
endif
if exists(':syntax') == 2
  syntax enable
  syntax sync fromstart
endif

" Colors {{{2
if exists(':colorscheme') == 2
  colorscheme graywh
endif

" Plugins {{{1
if exists(':runtime') == 2
  runtime! macros/matchit.vim
endif

" Options {{{2
if exists(':let') == 2

  let g:CSApprox_konsole = 1

  let g:tex_flavor = 'pdflatex'         " Use pdflatex as the tex compiler

  let g:Twiki_SourceHTMLSyntax = 1      " Let TWiki include HTML syntax
  let g:twiki_highlight_r = 1           " <highlight> tags include R
  let g:twiki_highlight_perl = 0        " <highlight> tags include perl

  let g:fit_manpages_to_window = 1      " Let man format manpages to fit the window

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

endif

" Functions {{{1
if exists(':function') == 2

  function! SimpleFoldText() " {{{2
    return getline(v:foldstart) . ' '
  endfunction

  function! MyFoldText() " {{{2
    let suba = substitute(getline(v:foldstart), '/\*\|\*/\|{{{\d\=\|}}}\d\=', '', 'g')
    let suba = substitute(suba, '\s*$', '')
    let subb = substitute(getline(v:foldend), '/\*\|\*/\|{{{\d\=\|}}}\d\=', '', 'g')
    let subb = substitute(subb, '^\s*', '', '')
    let subb = substitute(subb, '\s*$', '', '')
    let lines = v:foldend - v:foldstart + 1
    let text = suba . ' ... ' . subb
    let text = text[0:min([strlen(text), &columns - &fdc - 15 - strlen(nr2char(lines))])]
    return text . ' (' . lines . ' lines) '
  endfunction

  function! MyFoldIndent() " {{{2
    let line = getline(v:lnum)
    if line =~ '^$'
      return 0
    endif
    let numl = LeadingSpace(line)
    if line =~ &formatlistpat && &formatoptions =~ 'n'
      return '>' . ((numl  / &shiftwidth) + 1)
    endif
    if (numl % &shiftwidth) > 0 || numl == 0
      return '='
    endif
    return numl / &shiftwidth
  endfunction

  function! LeadingSpace(line)
    let line = substitute(a:line, '^\(\s*\)\S.*$', '\1', '')
    let line = substitute(line, '\t', repeat(' ', &tabstop), 'g')
    return strlen(line)
  endfunction

  function! TrailingSpace() " {{{2
    " return '[\s]' if trailing whitespace is detected
    " return '' otherwise
    if !exists('b:statusline_trailing_space_warning')
      if search('\s\+$', 'nw') != 0
        let b:statusline_trailing_space_warning = '[\s]'
      else
        let b:statusline_trailing_space_warning = ''
      endif
    endif
    return b:statusline_trailing_space_warning
  endfunction

  if exists('*synstack') " {{{2
    function! ShowSynStack()
      echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunction
  endif

  function! ShowSynIDs() " {{{2
    let hi = synIDattr(synID(line('.'),col('.'),1),'name')
    let trans = synIDattr(synID(line('.'),col('.'),0),'name')
    let lo = synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')
    echo 'hi<' . hi . '> trans<' . trans . '> lo<' . lo . '>'
  endfunction

  function! VisualNavigation() " {{{2
    if !exists('g:my_visual_navigation_maps')
      let g:my_visual_navigation_maps=1
      echomsg 'Enabled visual navigation'
      setlocal wrap
      silent! noremap <buffer> <unique> _ g_
      silent! noremap <buffer> <unique> 0 g0
      silent! noremap <buffer> <unique> <Home> g<Home>
      silent! noremap <buffer> <unique> ^ g^
      silent! noremap <buffer> <unique> $ g$
      silent! noremap <buffer> <unique> <End> g<End>
      silent! noremap <buffer> <unique> k gk
      silent! noremap <buffer> <unique> <Down> g<Down>
      silent! noremap <buffer> <unique> j gj
      silent! noremap <buffer> <unique> <Up> g<Up>
    else
      unlet g:my_visual_navigation_maps
      echomsg 'Disabled visual navigation'
      setlocal wrap<
      silent! unmap <buffer> _
      silent! unmap <buffer> 0
      silent! unmap <buffer> <Home>
      silent! unmap <buffer> ^
      silent! unmap <buffer> $
      silent! unmap <buffer> <End>
      silent! unmap <buffer> k
      silent! unmap <buffer> <Down>
      silent! unmap <buffer> j
      silent! unmap <buffer> <Up>
    endif
  endfunction

endif

" Commands {{{1
if exists(':command') == 2

  " Compare a modified file to what is saved on disk
  command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

  " Replace tabs with 'shiftwidth' spaces
  if has('ex_extra')
    command! -bang -range=% ReTab let ts=&l:ts | let &l:ts=&sw | <line1>,<line2>retab<bang> | let &l:ts=ts | unlet ts
  endif

  " Remove trailing space
  command! -range=% UnTrail <line1>,<line2>s/\s\+$//

  " Shift the position under the cursor to column N
  if has('ex_extra')
    command! -nargs=1 Shift exec 'normal '.(<args>-col('.')).'i '
  endif

  " Save using sudo
  if executable('sudo') && executable('dd')
    command! SUwrite write !sudo dd of=%
  endif

  " D'oh
  command! -bang -nargs=? -complete=help H help<bang> <args>

endif

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
if has('autocmd')
  augroup vimrcEx
    " clear all existing autocmds
    autocmd!

    " recalculate the trailing whitespace warning when idle, and after saving "
    " use with %{TrailingSpace()} in the statusline
    "autocmd CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning

    if exists(':sort') == 2
      autocmd BufWritePre ~/.irssi/saved_colors sort i | sort /:/ n
    endif

    if has('float')
      autocmd BufRead * let &l:numberwidth = max([float2nr(log10(line('$')))+3, &numberwidth])
    endif
  augroup END
endif

" Keymap {{{1
" make Q like before {{{2
map Q gq

" swap ' and ` {{{2
noremap ' `
noremap ` '

" make Y like D & C {{{2
map Y y$

" Search highlight {{{2
if has('extra_search')
  nnoremap <silent> <F6> :set hlsearch!<CR>:set hlsearch?<CR>
  nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
endif

" Autocomplete {{{2
if exists('*pumvisible')
  inoremap <expr> <C-space> pumvisible() \|\| &omnifunc == '' ? "\<C-n>" : "\<C-x>\<C-o>"
endif
inoremap <C-@> <C-space>

" Add new line indented here {{{2
if has('ex_extra')
  nnoremap <silent> <Leader>o :let ospaces=virtcol('.')-1<CR>o<Esc>:exec 'normal '.ospaces.'i '<CR>:.retab!<CR>A
  nnoremap <silent> <Leader>O :let ospaces=virtcol('.')-1<CR>O<Esc>:exec 'normal '.ospaces.'i '<CR>:.retab!<CR>A
endif

" Change to different capitalization {{{2
"nnoremap <Leader>sc ciw<C-r>=substitute(@", '_\(\w\)', '\u\1', 'g')<CR><Esc>
"nnoremap <Leader>sp ciw<C-r>=substitute(@", '_\(\w\)', '\u\1', 'g')<CR><Esc>bgUl
"nnoremap <Leader>cs ciw<C-r>=substitute(@", '[a-z]\zs\([A-Z]\)', '_\l\1', 'g')<CR><Esc>bgul

" Show the syntax highlighting groups for the item under the cursor {{{2
if exists('*ShowSynStack')
  nnoremap <silent> <F7> :call ShowSynStack()<CR>
endif
nnoremap <silent> <F8> :call ShowSynIDs()<CR>

" Command-line navigation {{{2
cnoremap <C-h> <Left>
cnoremap <C-f> <Right>

" Arrow keys for window movement {{{2
if exists(':wincmd') == 2
  nnoremap <silent> <Left> :wincmd h<CR>
  nnoremap <silent> <Right> :wincmd l<CR>
  nnoremap <silent> <Up> :wincmd k<CR>
  nnoremap <silent> <Down> :wincmd j<CR>
else
  nnoremap <silent> <Left> <C-w>h
  nnoremap <silent> <Right> <C-w>l
  nnoremap <silent> <Up> <C-w>k
  nnoremap <silent> <Down> <C-w>j
endif

" Ctrl-Left/Right for buffer cycling {{{2
nnoremap <silent> <C-Left> :bp<CR>
nnoremap <silent> <C-Right> :bn<CR>
nnoremap <silent> <C-Up> :bp<CR>
nnoremap <silent> <C-Down> :bn<CR>

" Wrap-based movements {{{2
nnoremap <silent> <F5> :call VisualNavigation()<CR>

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
if exists(':execute') == 2 && exists('&t_te') && exists('&t_op')
  execute "set t_te=" . &t_te . &t_op
endif

" Manually set the titlestring escape sequences for any terminal {{{2
" that hasn't already and is not known to not support them
if &term !~? '^\v(linux|cons|vt)' && ! strlen(&t_ts) && ! strlen(&t_fs)
  let &t_ts="\<Esc>]2;"
  let &t_fs="\x7"
endif

" change the xterm cursor color for insert mode {{{2
if &term =~? '^xterm' && exists('&t_SI')
  let &t_SI="\<Esc>]12;purple\x7"
  let &t_EI="\<Esc>]12;green\x7"
endif

