" Irssi Log syntax file
" Language:	Irssi log
" Maintainer:	Will Gray <graywh@gmail.com>
" Based on work by TODO

if exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=91-96,124

syntax spell notoplevel
syntax	region	irssiLogMsg	start='^---' end='$'
syntax	match	irssiTimestamp	'^\d\{2}:\d\{2}\(:\d\{2}\)\?' nextgroup=@irssiItems skipwhite
syntax	match	irssiNick	'<[ @~&+]\=\k*>'hs=s+1,he=e-1 contained
syntax	match	irssiAction	'\* \k* ' contained
syntax	region	irssiMsg	start='-!-' end='$' contained
syntax	region	irssiNotice	start=' \*\{3} ' end=':' contained
syntax	cluster	irssiItems	contains=irssiNick,irssiAction,irssiMsg,irssiNotice

if version >= 508 || !exists("did_irssilog_syntax_inits")
  if version < 508
    let did_irssilog_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink irssiLogMsg	PreProc
  HiLink irssiTimestamp	Number
  HiLink irssiAction	Type
  HiLink irssiMsg	Identifier
  HiLink irssiNotice	PreProc

  delcommand HiLink
endif

if filereadable($HOME . '/.irssi/saved_colors') && !exists("irssilog_no_saved_nick_colors")
  let s:irssimap = ['Black', 'DarkBlue', 'DarkGreen', 'Red', 'DarkRed', 'DarkMagenta', 'DarkYellow', 'Yellow', 'Green', 'DarkCyan', 'Cyan', 'Blue', 'Magenta', 'DarkGray', 'Gray', 'White']
  for s:line in readfile($HOME . '/.irssi/saved_colors')
    let s:words = split(s:line, ':')
    let s:nick = escape(s:words[0], '\.*[^$')
    let s:clean = substitute(s:words[0], '[^_a-zA-Z0-9]', '_', 'g')
    let s:color = s:irssimap[s:words[1] - 1]
    exec 'syntax match irssiNick_' . s:clean . ' /<[ @~&+]\=' . s:nick . '>/hs=s+1,he=e-1 contained'
    exec 'syntax cluster irssiItems add=irssiNick_' . s:clean
    exec 'highlight irssiNick_' . s:clean . ' ctermfg=' . s:color . ' guifg=' . s:color
  endfor

  unlet s:words s:nick s:clean s:color
endif

let b:current_syntax = 'irssilog'
