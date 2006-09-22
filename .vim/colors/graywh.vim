" Vim color file
" Maintainer:   Will Gray <graywh@gmail.com>
" Last Change:  2006 Aug 09

" Custom GUI colors:
" Red = #FF5555
" Yellow = #FFFF55
" Green = #55FF55
" Cyan = #55FFFF
" Blue = #5555FF
" Magenta = #FF55FF
" DarkRed = #BB0000
" DarkYellow = #BBBB00
" DarkGreen = #00BB00
" DarkCyan = #00BBBB
" DarkBlue = #00000BB
" DarkMagenta = #BB00BB

" This color scheme uses a black background.

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "graywh"

hi Normal ctermbg=Black ctermfg=White guibg=Black guifg=White

hi Directory ctermfg=Cyan guifg=#00BBBB
hi DiffText cterm=inverse gui=inverse
hi DiffAdd ctermbg=Green ctermfg=Black guibg=#A0FFA0 guifg=Black
hi DiffChange  ctermbg=Yellow ctermfg=Black guibg=#FFFFA0 guifg=Black
hi DiffDelete ctermbg=Red ctermfg=Black guibg=#FFA0A0 guifg=Black gui=none
hi Folded ctermfg=Gray guifg=#AAAAAA gui=italic
hi ErrorMsg ctermbg=DarkRed ctermfg=White guibg=#BB0000 guifg=White
hi WarningMsg ctermbg=DarkYellow ctermfg=White guibg=#BBBB00 guifg=White
hi NonText ctermfg=Cyan gui=bold guifg=#55FFFF

hi Error ctermfg=White ctermbg=Red guifg=White guibg=#FF5555
hi Comment ctermfg=Green guifg=#55FF55 gui=italic
hi Constant ctermfg=Red guifg=#FF5555
hi Boolean ctermfg=Blue guifg=#5555FF gui=bold
hi String ctermfg=Magenta guifg=#FF55FF
hi link Character String
hi Statement ctermfg=Blue guifg=#5555FF gui=None
hi Operator ctermfg=Blue guifg=#5555FF
hi PreProc ctermfg=Blue guifg=#5555FF
hi Type ctermfg=Cyan guifg=#55FFFF gui=None
hi Special guifg=#FF5555
