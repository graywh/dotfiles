if did_filetype()
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

let s:line1 = getline(1)
let s:line2 = getline(2)
let s:line3 = getline(3)
let s:line4 = getline(4)
let s:line5 = getline(5)

" Detect MoinMoin headers or rules
if         s:line1 =~ '^\(=\+\) .* \1$'
      \ || s:line2 =~ '^\(=\+\) .* \1$'
      \ || s:line3 =~ '^\(=\+\) .* \1$'
      \ || s:line4 =~ '^\(=\+\) .* \1$'
      \ || s:line5 =~ '^\(=\+\) .* \1$'
      \ || s:line1 =~ '^#\(acl\|format\|redirect\|refresh\|pragma\|deprecated\|language\) '
      \ || s:line2 =~ '^#\(acl\|format\|redirect\|refresh\|pragma\|deprecated\|language\) '
      \ || s:line3 =~ '^#\(acl\|format\|redirect\|refresh\|pragma\|deprecated\|language\) '
      \ || s:line4 =~ '^#\(acl\|format\|redirect\|refresh\|pragma\|deprecated\|language\) '
      \ || s:line5 =~ '^#\(acl\|format\|redirect\|refresh\|pragma\|deprecated\|language\) '
  set filetype=moin

" Detect TWiki headers
elseif     s:line1 =~ '^---+\{1,5} .*'
      \ || s:line2 =~ '^---+\{1,5} .*'
      \ || s:line3 =~ '^---+\{1,5} .*'
      \ || s:line4 =~ '^---+\{1,5} .*'
      \ || s:line5 =~ '^---+\{1,5} .*'
  set filetype=twiki
endif

let &cpo = s:cpo_save
unlet s:cpo_save s:line1 s:line2 s:line3 s:line4 s:line5
