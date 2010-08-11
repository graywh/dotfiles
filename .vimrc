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

" Mouse {{{2
if has('mouse')
  set mouse=a                   " Use the mouse for all modes
endif
set mousemodel=popup_setpos     " Reposition the cursor on right-click

" Keyboard {{{2
set notimeout                   " Don't timeout on mappings
set ttimeout                    " Timeout on keycodes
set ttimeoutlen=100             " Keycodes shouldn't take long

" Terminal {{{2
set title                       " Let Vim decide
set icon                        " Let Vim decide
set ttyscroll=5                 " Redraw when scrolling a long ways
if &term =~? '^\(xterm\|putty\|konsole\|gnome\)' " xterm and 'clones'
  let &t_RV="\<Esc>[>c"         " Let Vim check for xterm-compatibility
  set ttyfast                   " Because no one should have to suffer
  set ttymouse=xterm2           " Assume xterm mouse support
endif
if &term =~? '^screen'  " screen and tmux
  set ttyfast                   " Because no one should have to suffer
  if  exists("$STY")    " only screen
    set ttymouse=xterm2         " Assume xterm mouse support
  endif
endif

" Navigation {{{2
set nostartofline               " Avoid moving the cursor when moving around
set scrolloff=3                 " Leave lines next to window edge
set showmatch                   " Show matching brackets.
set sidescrolloff=10            " Leave some characters next to window edge (w/ nowrap)
if exists('&virtualedit')
  if v:version >= 700
    set virtualedit=onemore     " Allow cursor to be on the newline
  endif
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

if exists('&formatlistpat')
  set formatlistpat=^\\s*\\(\\d\\+\\\|\\*\\\|-\\\|•\\)[\\]:.)}\\t\ ]\\s*
endif

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
  if v:version >= 700
    set switchbuf+=usetab
  endif
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
if has('folding')
  set nofoldenable              " Disable folds by default
  set foldmethod=syntax         " Fold by syntax
  set foldminlines=0            " Allow folding single lines
endif
set linebreak                   " Don't wrap words
set list                        " Add visual clues (disables 'linebreak')
set number                      " Show line numbers
if exists('&numberwidth')
  set numberwidth=4
endif
set wrap                        " Wrap long lines

set listchars=
if has('multi_byte') && (&tenc =~? '^u\(tf\|cs\)' || (! strlen(&tenc) && &enc =~? '^u\(tf\|cs\)')) && (v:version >= 602 || v:version == 601 && has('patch469'))
  "set listchars+=eol:§
  set listchars+=tab:»·
  if v:version >= 700
    set listchars+=nbsp:+
  endif
  set listchars+=trail:·
  set listchars+=extends:→
  set listchars+=precedes:←
else
  if v:version < 603
    " :print may behave badly with this disabled
    "set listchars+=eol:$
  endif
  set listchars+=tab:>-
  if v:version >= 700
    set listchars+=nbsp:+
  endif
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
set viminfo=
set viminfo+='100               " Remember 100 previously edited files' marks
set viminfo+=!                  " Remember some global variables
set viminfo+=h                  " Don't restore the hlsearch highlighting

" Reading, Writing {{{2
set modeline                    " Let files set their own options
set fileformats=unix,mac,dos    " End-of-line character

" Diff mode {{{2
if exists('&diffopt')
  set diffopt=filler
  set diffopt+=iwhite
  if v:version >= 700
    set diffopt+=vertical
    set diffopt+=foldcolumn:2
  endif
endif

" Other {{{2
set winaltkeys=no               " Don't use ALT to access the menu

if has('unix')
  let &grepprg='grep -nrI --exclude-dir=.svn --exclude-dir=.git $* /dev/null'
endif

" Colors {{{2
if exists(':colorscheme') == 2
  colorscheme graywh
endif

" Plugins {{{1
if exists(':runtime') == 2 && &loadplugins
  runtime! macros/matchit.vim
endif

" Options {{{2
if exists(':let') == 2

  let g:colorchart_origin = { 88: 0, 256: 7 }
  let g:colorchart_angle = { 88: 0, 256: 4 }
  let g:colorchart_chart = { 88: "ribbon" }

  let g:fit_manpages_to_window = 1      " Let man format manpages to fit the window

  let g:liquid_highlight_types = ["html","erb=eruby","html+erb=eruby.html", "ruby"]

  let g:php_sql_query = 1
  let g:php_htmlInStrings = 1
  let g:php_baselib = 1

  let g:python_highlight_builtins = 1
  let g:python_highlight_exceptions = 1
  let g:python_highlight_string_formatting = 1
  let g:python_highlight_doctests = 1

  let g:rails_gnu_screen = 0

  "let ruby_fold = 1

  let g:sql_type_default = 'mysql'

  let g:tex_flavor = 'pdflatex'         " Use pdflatex as the tex compiler

  let g:Twiki_SourceHTMLSyntax = 1      " Let TWiki include HTML syntax
  let g:twiki_highlight_r = 1           " <highlight> tags include R
  let g:twiki_highlight_perl = 0        " <highlight> tags include perl

  let g:VCSCommandDeleteOnHide = 1

endif

" Functions {{{1
if exists(':function') == 2

  function! SimpleFoldText() " {{{2
    let text = getline(v:foldstart)
    if text[-1:] != ' '
      let text .= ' '
    endif
    return text
  endfunction

  function! MyFoldText() " {{{2
    let suba = getline(v:foldstart)
    let suba = substitute(suba, '/\*\|\*/\|{{{\d\=\|}}}\d\=', '', 'g')
    let suba = substitute(suba, '\s*$', '', '')
    let subb = getline(v:foldend)
    "let subb = substitute(subb, '/\*\|\*/\|{{{\d\=\|}}}\d\=', '', 'g')
    "let subb = substitute(subb, '^\s*', '', '')
    "let subb = substitute(subb, '\s*$', '', '')
    let lines = v:foldend - v:foldstart + 1
    let text = suba
    "if lines > 1 && strlen(subb) > 0
    "let text .= ' ... '.subb
    "endif
    let fillchar = matchstr(&fillchars, 'fold:.')
    if strlen(fillchar) > 0
      let fillchar = fillchar[-1:]
    else
      let fillchar = '-'
    endif
    let lines = repeat(fillchar, 4).' ' . lines . ' lines '.repeat(fillchar, 3)
    if has('float')
      let nuw = max([float2nr(log10(line('$')))+3, &numberwidth])
    else
      let nuw = &numberwidth
    endif
    let n = winwidth(0) - &fdc - nuw - strlen(lines)
    let text = text[:min([strlen(text), n])]
    if text[-1:] != ' '
      if strlen(text) < n
        let text .= ' '
      else
        let text = substitute(text, '\s*.$', '', '')
      endif
    endif
    let text .= repeat('-', n - strlen(text))
    let text .= lines
    return text
  endfunction

  function! MyFoldIndent() " {{{2
    let line = getline(v:lnum)
    if line =~# '^$'
      return 0
    endif
    let numl = LeadingSpace(line)
    if line =~# &formatlistpat && &formatoptions =~# 'n'
      return '>' . ((numl  / &shiftwidth) + 1)
    endif
    if (numl % &shiftwidth) > 0 || numl == 0
      return '='
    endif
    return numl / &shiftwidth
  endfunction

  function! LeadingSpace(line) " {{{2
    let line = substitute(a:line, '^\(\s*\)\S.*$', '\1', '')
    let line = substitute(line, '\t', repeat(' ', &tabstop), 'g')
    return strlen(line)
  endfunction

  function! StatusLineTrailingSpaceWarning() " {{{2
    " return '[\s$]' if trailing whitespace is detected
    " return '' otherwise
    if !exists('b:statusline_trailing_space_warning')
      if !&readonly && &modifiable && search('\s\+$', 'nw') != 0
        let b:statusline_trailing_space_warning = '[\s$]'
      else
        let b:statusline_trailing_space_warning = ''
      endif
    endif
    return b:statusline_trailing_space_warning
  endfunction

  function! StatusLineTabWarning() " {{{2
    " return '[&et]' if &et is set wrong
    " return '[mixed-indenting]' if spaces and tabs are used to indent
    " return an empty string if everything is fine
    if !exists('b:statusline_tab_warning')
      if &filetype == 'help' || &readonly == 1 || &modifiable == 0
        let b:statusline_tab_warning = ''
      else
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0
        if tabs && spaces
          let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
          let b:statusline_tab_warning = '[&et]'
        else
          let b:statusline_tab_warning = ''
        endif
      endif
    endif
    return b:statusline_tab_warning
  endfunction

  function! StatusLineEncodingBombWarning() " {{{2
    if &fenc !~ '^$\|utf-8' || &bomb
      return '[' . &fenc . (&bomb ? '-bom' : '') . ']'
    else
      return ''
    endif
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
      let b:my_visual_navigation_maps=1
      echomsg 'Enabled visual navigation'
      setlocal wrap
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

  function! LastModified() "{{{2
    " autocmd BufWritePre * call LastModified()
    if &modified
      let save_cursor = getpos(".")
      silent! keepjumps 1,4substitute/ Last Modified: \zs.*/\=strftime('%c')/
      call setpos('.', save_cursor)
    endif
  endfunction

  function! InvertColors() "{{{2
    let swapbw = { 'Black' : 'White', 'White' : 'Black' }
    %substitute/\<cterm[fb]g=\zs\(Black\|White\)/\=get(swapbw, submatch(1), '')/g
    let swap = { 'Red' : 'Cyan', 'Green' : 'Magenta', 'Yellow' : 'Blue', 'Blue' : 'Yellow', 'Magenta' : 'Green', 'Cyan' : 'Red', 'Gray' : 'Gray', 'Grey' : 'Grey', 'Light' : 'Dark', 'Dark' : 'Light' }
    %substitute/\<cterm[fb]g=\zs\(Dark\|Light\)\=\(Red\|Green\|Yellow\|Blue\|Magenta\|Cyan\|Gr[ae]y\)/\=get(swap, submatch(1), 'Dark') . get(swap, submatch(2), '')/g
    %substitute/\<gui\(fg\|bg\|sp\)=#\zs\(\x\{6}\)/\=printf('%06X', 16777215 - str2nr(submatch(2), 16))/g
  endfunction

endif

" Commands {{{1
if exists(':command') == 2

  " Compare a modified file to what is saved on disk
  command! DiffOrig
        \ vertical new | set bt=nofile bh=wipe |
        \ read # | 0 delete _ | diffthis | wincmd p | diffthis
  command! DiffOff
        \ only | diffoff | set fdc<

  " Replace tabs with 'shiftwidth' spaces
  if has('ex_extra')
    command! -bang -range=% ReTab
          \ silent! unlet b:statusline_tab_warning |
          \ let ts=&l:ts | let &l:ts=&sw |
          \ <line1>,<line2>retab<bang> |
          \ let &l:ts=ts | unlet ts
  endif

  " Remove trailing space
  command! -range=% UnTrail
        \ silent! unlet b:statusline_trailing_space_warning |
        \ keepjumps <line1>,<line2>substitute/\s\+$//

  " Shift the position under the cursor to column N
  if has('ex_extra')
    command! -nargs=1 Shift
          \ execute 'normal '.(<args>-col('.')).'i '
  endif

  " Save using sudo
  if executable('sudo') && executable('dd')
    command! SUwrite
          \ write !sudo tee %
  endif

  " D'oh
  command! -bang -nargs=? -complete=help H
        \ help<bang> <args>

endif

" Status line {{{1
set statusline=
set statusline+=%4(%n%)\                " Buffer number (4 columns, lines up with the line numbers most of the time)
set statusline+=%<%f\                   " Relative filename & path (truncatable)
set statusline+=%y%m%r%w                " Flags: filetype, modified/nomodifiable, read-only, preview
set statusline+=%1*                     " Various warnings
set statusline+=%{StatusLineTabWarning()}               " Indentation
set statusline+=%{StatusLineTrailingSpaceWarning()}     " Trailing space
set statusline+=%{&ff=='unix'?'':'['.&ff.']'}           " &fileformat != 'unix'
set statusline+=%{StatusLineEncodingBombWarning()}      " &fileencoding, &bomb
set statusline+=%{&eol?'':'[noeol]'}                    " &noeol
set statusline+=%*                      " End of warnings section
set statusline+=%=\                     " Separate left from right
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\      " Current highlight group
"set statusline+=%b,0x%-8B\             " Current character in decimal and hex representation
set statusline+=%-12(%l,%c%V%)\ %P      " Current line and column, file percentage (set 'ruler')

" Autocommands {{{1
if has('autocmd')
  augroup vimrcEx
    " clear all existing autocmds
    autocmd!

    " recalculate the trailing whitespace warning when idle, and after writing
    autocmd CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning
    " recalculate the tab warning when idle and after writing
    autocmd CursorHold,BufWritePost * unlet! b:statusline_tab_warning

    if exists(':sort') == 2
      autocmd BufWritePre ~/.irssi/saved_colors sort i | sort /:/ n
    endif

    if has('float')
      autocmd BufRead * let &l:numberwidth = max([float2nr(log10(line('$')))+3, &numberwidth])
    endif
  augroup END
endif

" Keymap {{{1
" Disable F1 for help {{{2
map  <F1> <Nop>
map  <A-F1> <Nop>
map  <C-F1> <Nop>
imap <F1> <Nop>
imap <S-F1> <Nop>
imap <A-F1> <Nop>
imap <C-F1> <Nop>


" make Q like before {{{2
map Q gq

" swap ' and ` {{{2
noremap ' `
noremap ` '
noremap g' g`
noremap g` g'

" make Y like D & C {{{2
map Y y$

" Search highlight {{{2
if has('extra_search')
  nnoremap <silent> <F6> :set hlsearch!<CR>:set hlsearch?<CR>
  nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
endif

" Autocomplete {{{2
"if exists('*pumvisible')
"inoremap <expr> <C-space> pumvisible() \|\| &omnifunc == '' ? "\<C-n>" : "\<C-x>\<C-o>"
"endif

" Add new line indented here {{{2
if has('ex_extra')
  nnoremap <silent> <Leader>o :let ospaces=virtcol('.')-1<CR>o<Esc>:execute 'normal '.ospaces.'i '<CR>:.retab!<CR>A
  nnoremap <silent> <Leader>O :let ospaces=virtcol('.')-1<CR>O<Esc>:execute 'normal '.ospaces.'i '<CR>:.retab!<CR>A
endif

" Show the syntax highlighting groups for the item under the cursor {{{2
if exists('*ShowSynStack')
  nnoremap <silent> <F7> :call ShowSynStack()<CR>
endif
nnoremap <silent> <F8> :call ShowSynIDs()<CR>

" User commands
if exists(':UnTrail') == 2
  nnoremap <silent> <leader>ut :UnTrail<CR>
  vnoremap <silent> <leader>ut :UnTrail<CR>
endif

if exists(':ReTab') == 2
  nnoremap <silent> <leader>rt :ReTab<CR>
  vnoremap <silent> <leader>rt :ReTab<CR>
endif

" Command-line navigation {{{2
cnoremap <C-h> <Left>
cnoremap <C-f> <Right>

" Arrow keys for window movement {{{2
nnoremap <silent> <Left>  <C-w>h
nnoremap <silent> <Right> <C-w>l
nnoremap <silent> <Up>    <C-w>k
nnoremap <silent> <Down>  <C-w>j

" Ctrl-Left/Right for buffer cycling {{{2
nnoremap <silent> <C-Left>  :bp<CR>
nnoremap <silent> <C-Right> :bn<CR>
nnoremap <silent> <C-Up>    :bp<CR>
nnoremap <silent> <C-Down>  :bn<CR>

" Wrap-based movements {{{2
nnoremap <silent> <F5> :call VisualNavigation()<CR>

" Screen {{{2
map <C-_> <Nop>
map! <C-_> <Nop>

" Folding {{{2
if has('eval')
  for k in ['i', 'm', 'M', 'n', 'N', 'r', 'R', 'v', 'x', 'X']
    execute "nnoremap <silent> Z".k." :windo normal z".k."<CR>"
  endfor
endif

" Terminal Stuff {{{1
"map <C-@> <C-space>
"map! <C-@> <C-space>

" XXX Fix vim bug when exiting alt screen {{{2
if exists('&t_te') && exists('&t_op')
  let &t_te=&t_te.&t_op
endif

" Manually set the titlestring escape sequences for any terminal {{{2
" that hasn't already and is not known to not support them
if &term !~? '^\v(linux|cons|vt)' && ! strlen(&t_ts) && ! strlen(&t_fs)
  let &t_ts="\<Esc>]2;"
  let &t_fs="\x7"
  let &t_IS="\<Esc>]1;"
  let &t_IE="\x7"
endif

" change the xterm cursor color for insert mode {{{2
if &term =~? '^xterm' && exists('&t_SI') && &t_Co > 1
  let &t_SI="\<Esc>]12;purple\x7"
  let &t_EI="\<Esc>]12;green\x7"
endif

" Collected Tips {{{1
""%substitute/\(\d\d\)\(:\d\d\)\{1,2} \(AM\|PM\)/\=(submatch(3) == 'PM' && submatch(1) < 12 ? submatch(1)+12 : submatch(3) == 'AM' && submatch(1) == 12 ? '00' : submatch(1)).submatch(2)/

" Change to different capitalization {{{2
" under_score_case to camelCase
"nnoremap <Leader>sc ciw<C-r>=substitute(@", '_\(\w\)', '\u\1', 'g')<CR><Esc>
" under_score_case to PascalCase
"nnoremap <Leader>sp ciw<C-r>=substitute(@", '_\(\w\)', '\u\1', 'g')<CR><Esc>bgUl
" PascalCase to under_score_case
"nnoremap <Leader>cs ciw<C-r>=substitute(@", '\l\zs\(\u\)', '_\l\1', 'g')<CR><Esc>bgul
" PascalCase to UNDER_SCORE_CASE
"nnoremap <Leader>cu ciw<C-r>=substitute(@", '\l\zs\ze\u', '_', 'g')<CR><Esc>bgUiw
