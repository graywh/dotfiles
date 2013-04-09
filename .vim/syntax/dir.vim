" Vim syntax file
" Language: Directory outline
" Maintainer: Will Gray <graywh@gmail.com>
"
" Notes: Comments can contain "/" only if it is followed by a non-space and is
" not the last character of the line.  Otherwise, it will be interpreted as a
" directory.
"
" Example:
" |-- root/
" |   |-- doc/
" |   |   |-- notes.txt
" |   |   `-- manual.pdf
" |   |-- src/
" |       |-- foo.c
" |       `-- bar.c
" |-- root2
"     |-- x/
"     |-- y/
" # vim: ft=dir

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Syntax {{{1
syntax match dirFile "--\s\+[0-9A-Za-z-_. ]\+"hs=s+3 contained
syntax match dirDirectory "--\s\+[0-9A-Za-z-_. ]\{-}/"hs=s+3,he=e-1 contained
syntax match dirMarkup "|" nextgroup=dirMarkup skipwhite
syntax match dirMarkup "`" nextgroup=dirMarkup skipwhite
syntax match dirMarkup "--\s\+.\+" contains=dirFile,dirComment
syntax region dirMarkup start="--" end="/$" end="/\s" contains=dirDirectory keepend oneline

" Comments {{{1
syntax match dirComment "#.*$" display contains=dirTodo
syntax keyword dirTodo TODO contained

" Highlight group linking {{{1
hi def link dirMarkup Operator
hi def link dirDirectory Type
hi def link dirFile Function
hi def link dirComment Comment
hi def link dirTodo Todo

" Folding {{{1
setlocal foldexpr=GetDirLevel(v:lnum)
setlocal foldtext=GetDirText()

function! GetDirLevel(lnum)
  let line = substitute(getline(a:lnum), "\|\\?\t", repeat(" ", &ts), "g")
  if strlen(line) == 0
    return 0
  endif
  let level = (stridx(line, '--') - 1) / &ts + 1
  let nline = substitute(getline(a:lnum + 1), "\|\\?\t", repeat(" ", &ts), "g")
  let nlevel = (stridx(nline, '--') - 1) / &ts + 1
  if nlevel == level + 1
    return ">" . level
  else
    return level - 1
  endif
  return -1
endfunction

function! GetDirText()
  let line = getline(v:foldstart)
  let line = substitute(line, "\|\t", "|" . repeat(" ", &ts - 1), "g")
  let line = substitute(line, "\t", repeat(" ", &ts), "g")
  return line
endfunction
" }}}
let b:current_syntax="dir"
