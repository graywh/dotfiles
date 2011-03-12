if v:version < 700
  finish
endif

let s:levels = [ '00', '33', '66', '99', 'CC', 'FF' ]
let s:ansi = [ 'Gray', 'Red', 'Green', 'Yellow', 'Blue', 'Magenta', 'Cyan', 'Gray' ]
let s:grays = [ '0A', '14', '1E', '28', '33', '3D',
              \ '47', '51', '5b', '66', '70', '7A',
              \ '84', '8E', '99', 'A3', 'AD', 'B7',
              \ 'C1', 'CC', 'D6', 'E0', 'EA', 'F4' ]

function! Cterm2Gui(color)
  if a:color < 0 || a:color > 255
    return ''
  elseif a:color == 0
    return 'Black'
  elseif a:color < 15
    return '' . ( a:color / 8 ? '' : 'Dark' ) . s:ansi[a:color % 8]
  elseif a:color == 15
    return 'White'
  elseif a:color < 232
    let num = a:color - 16
    let red = num / 36
    let grn = num / 6 % 6
    let blu = num % 6
    return '#' . s:levels[red] . s:levels[grn] . s:levels[blu]
  else
    return '#' . repeat(s:grays[a:color - 232], 3)
  endif
endfunction

function! ReverseCterm(color)
  if a:color < 0 || a:color > 255
    finish
  elseif a:color < 16
    return 16 - a:color
  elseif a:color < 232
    return 248 - a:color
  else
    return 487 - a:color
  endif
endfunction

function! ReverseGui(color)
  let fmt = '%02x'
  let color = substitute(a:color, '^#', '', '')
  let colors = split(color, '..\zs')
  let colors = map(colors, '255 - str2nr(v:val, 16)')
  let colors = map(colors, 'printf(fmt, v:val)')
  return '#' . join(colors, '')
endfunction
