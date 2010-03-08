syn keyword muttrcVarStr contained trash
syn keyword muttrcVarBool contained xterm_set_titles
syn keyword muttrcFunction contained purge-message

syn match muttrcColor /\<color\(\d\{1,2}\|1\d\{1,2}\|2\([0-4]\d\|5[0-5]\)\)\>/

syn keyword muttrcIfDef ifdef nextgroup=muttrcFunction,muttrcVarStr,muttrcVarBool skipwhite
hi link muttrcIfDef PreProc

hi link muttrcFunction Function
