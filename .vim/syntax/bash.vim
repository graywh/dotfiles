if exists('b:is_sh')
  unlet b:is_sh
endif
if exists('b:is_kornshell')
  unlet b:is_kornshell
endif
let b:is_bash = 1
set filetype=sh
