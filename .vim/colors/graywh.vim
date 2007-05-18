" Vim color file
" Maintainer:   Will Gray <graywh@gmail.com>
" Last Change:  2006 Sep 25

" Custom GUI colors
"     LightRed = #FFCCCC        Red = #FF5555        DarkRed = #BB0000
"  LightYellow = #FFFF99     Yellow = #FFFF55     DarkYellow = #BBBB00
"   LightGreen = #66FF99      Green = #55FF55      DarkGreen = #00BB00
"    LightCyan = #99FFFF       Cyan = #55FFFF       DarkCyan = #00BBBB
"    LightBlue = #33CCFF       Blue = #5555FF       DarkBlue = #0000BB
" LightMagenta = #FFCCFF    Magenta = #FF55FF    DarkMagenta = #BB00BB

" This color scheme uses a black background.
set background=dark

" First remove all existing highlighting.
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "graywh"

hi Normal ctermbg=Black ctermfg=Gray guibg=Black guifg=#BBBBBB

hi Directory ctermfg=DarkCyan guifg=#00BBBB
hi DiffText cterm=inverse gui=inverse
hi DiffAdd ctermbg=Green ctermfg=Black guibg=#BBFFBB guifg=Black
hi DiffChange  ctermbg=Yellow ctermfg=Black guibg=#FFFFBB guifg=Black
hi DiffDelete ctermbg=Red ctermfg=Black guibg=#FFBBBB guifg=Black gui=none
hi Folded ctermfg=Gray guifg=#BBBBBB gui=italic
hi ErrorMsg ctermbg=DarkRed ctermfg=White guibg=#BB0000 guifg=White
hi WarningMsg ctermbg=DarkYellow ctermfg=White guibg=#BBBB00 guifg=White
hi NonText ctermfg=Cyan gui=bold guifg=#55FFFF

hi Error ctermfg=White ctermbg=Red guifg=White guibg=#FF5555
hi Comment ctermfg=Green guifg=#55FF55 gui=italic
hi Constant ctermfg=Red guifg=#FF5555
hi Boolean ctermfg=Blue guifg=#5555FF gui=bold
hi String ctermfg=Magenta guifg=#FF55FF
hi link Character String
hi Function ctermfg=Cyan guifg=#55FFFF
hi Statement ctermfg=Blue guifg=#5555FF gui=none
hi Operator ctermfg=Blue guifg=#5555FF
hi PreProc ctermfg=Blue guifg=#5555FF gui=none
hi Type ctermfg=Cyan guifg=#55FFFF gui=none
hi Identifier ctermfg=Cyan cterm=none guifg=#55FFFF
hi Special ctermfg=DarkRed guifg=#FF5555
