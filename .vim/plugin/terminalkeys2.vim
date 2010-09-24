finish

if &cp || exists('g:terminalkeys2_loaded') || has('gui_running')
  finish
endif

let g:terminalkeys2_loaded = 1

let savecpo=&cpo
set cpo&vim

let s:modifier_map = {
      \ 1 : '<',
      \ 2 : '<S-',
      \ 3 : '<A-',
      \ 4 : '<A-S-',
      \ 5 : '<C-',
      \ 6 : '<C-S-',
      \ 7 : '<C-A-',
      \ 8 : '<C-A-S-' }

function! s:MapAllModes(map)
  exe "map" a:map | exe "map!" a:map
endfunction

function! s:AltMap()
  for key in range(10) + ['-', '=']
    call s:MapAllModes("<Esc>".key." <A-".key.">")
  endfor
endfunction

function! s:TabMap()
  for modifier in range(3,8)
    call s:MapAllModes("<Esc>[9;".modifier."~ ".s:modifier_map[modifier]."Tab>")
  endfor
endfunction

try
  call s:AltMap()
  call s:TabMap()
finally
  let &cpo=savecpo
  unlet savecpo
endtry
