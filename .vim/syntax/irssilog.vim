" Irssi Log syntax file
" Language:	Irssi log
" Maintainer:	Will Gray <graywh@gmail.com>
"
" Based on work by TODO

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = 'irssilog'

setlocal iskeyword+=45,91-96,123-125

syntax spell notoplevel

syntax region  irssiLogMsg	start='^---' end='$'

syntax match   irssiTimestamp	'^\d\{2}:\d\{2}\(:\d\{2}\)\?' nextgroup=@irssiItems skipwhite

syntax region  irssiNickRegion	matchgroup=irssiDelimiter start='<' end='>' contained contains=@irssiNicks
syntax match   irssiNick	'[ @~&+]\=\<\k*\>' contained

syntax match   irssiAction	'\* \k* ' contained
syntax region  irssiMsg		start='-!-' end='$' contained
syntax region  irssiNotice	start='\*\{3}' end='$' contained

syntax cluster irssiItems	contains=irssiNickRegion,irssiAction,irssiMsg,irssiNotice
syntax cluster irssiNicks	contains=irssiNick

hi def link irssiLogMsg PreProc
hi def link irssiTimestamp Number
hi def link irssiAction Type
hi def link irssiMsg Identifier
hi def link irssiNotice PreProc

if filereadable($HOME . '/.irssi/saved_colors') && !exists("irssilog_no_saved_nick_colors")

  let s:cterm_colormap = [0, 4, 2, 9, 1, 5, 3, 11, 10, 6, 14, 12, 13, 8, 7, 15]
  let s:gui_colormap = split('Black, Blue, Green, LightRed, Red, Magenta, Orange, Yellow, LightGreen, Cyan, LightCyan, LightBlue, LightMagenta, DarkGray, Gray, White', ', ')

  for s:line in readfile($HOME . '/.irssi/saved_colors')
    let s:words = split(s:line, ':')
    let s:nick = escape(s:words[0], '\.*[^$')
    let s:clean = substitute(s:words[0], '[^_a-zA-Z0-9]', '_', 'g')
    let s:cterm_color = s:cterm_colormap[s:words[1] - 1]
    let s:gui_color = s:gui_colormap[s:words[1] - 1]

    exec 'syntax match irssiNick_' . s:clean . ' /[ @~&+]\=\<' . s:nick . '\>/ contained'
    exec 'syntax cluster irssiNicks add=irssiNick_' . s:clean
    exec 'highlight irssiNick_' . s:clean . ' ctermfg=' . s:cterm_color . ' guifg=' . s:gui_color
  endfor

  unlet s:cterm_colormap s:line s:words s:nick s:clean s:cterm_color
endif
