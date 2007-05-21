" Vim color file
" Maintainer:   Will Gray <graywh@gmail.com>
" Last Change:  2007 May 21

" Custom GUI colors {{{
"     LightRed = #FFCCCC      Red = #FF5555      DarkRed = #BB0000
"  LightYellow = #FFFF99   Yellow = #FFFF55   DarkYellow = #BBBB00
"   LightGreen = #66FF99    Green = #55FF55    DarkGreen = #00BB00
"    LightCyan = #99FFFF     Cyan = #55FFFF     DarkCyan = #00BBBB
"    LightBlue = #33CCFF     Blue = #5555FF     DarkBlue = #0000BB
" LightMagenta = #FFCCFF  Magenta = #FF55FF  DarkMagenta = #BB00BB
" }}}

" This color scheme uses a black background.
set background=dark

" First remove all existing highlighting.
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "graywh"

if has("gui_running")
  " For GUI {{{
  hi Normal     guifg=#BBBBBB guibg=#000000

  hi Directory  guifg=#00BBBB
  hi DiffText                 guibg=#FFFFBB gui=none
  hi DiffAdd                  guibg=#BBFFBB
  hi DiffChange               guibg=bg
  hi DiffDelete               guibg=#FFBBBB gui=none
  hi Folded     guifg=fg                    gui=italic
  hi FoldColumn guifg=#55FFFF guibg=#555555
  hi LineNr     guifg=#FFFF55 guibg=#555555
  hi ErrorMsg   guifg=#FFFFFF guibg=#BB0000
  hi WarningMsg guifg=#FFFFFF guibg=#BBBB00
  hi NonText    guifg=#55FFFF               gui=bold

  hi Error      guifg=#FFFFFF guibg=#FF5555
  hi Comment    guifg=#55FF55               gui=italic
  hi Constant   guifg=#FF5555
  hi Boolean    guifg=#5555FF               gui=bold
  hi String     guifg=#FF55FF
  hi Function   guifg=#55FFFF
  hi Statement  guifg=#5555FF               gui=none
  hi Operator   guifg=#5555FF
  hi PreProc    guifg=#5555FF               gui=none
  hi Type       guifg=#55FFFF               gui=none
  hi Identifier guifg=#55FFFF
  hi Special    guifg=#FF5555
  " }}}
elseif &t_Co == 256
  " For 256 color terminals {{{
  hi Normal     ctermfg=250 ctermbg=0

  hi Directory  ctermfg=37
  hi DiffText                           cterm=inverse
  hi DiffAdd                ctermbg=157
  hi DiffChange             ctermbg=229
  hi DiffDelete ctermfg=fg  ctermbg=217 cterm=none
  hi Folded     ctermfg=250
  hi FoldColumn ctermfg=14
  hi LineNr     ctermfg=227 ctermbg=242
  hi ErrorMsg   ctermfg=15  ctermbg=124
  hi WarningMsg ctermfg=15  ctermbg=142
  hi NonText    ctermfg=87              cterm=bold

  hi Error      ctermfg=15  ctermbg=203
  hi Comment    ctermfg=83
  hi Constant   ctermfg=203
  hi Boolean    ctermfg=12              cterm=bold
  hi String     ctermfg=207
  hi Function   ctermfg=87
  hi Statement  ctermfg=12              cterm=none
  hi Operator   ctermfg=12
  hi PreProc    ctermfg=12              cterm=none
  hi Type       ctermfg=87              cterm=none
  hi Identifier ctermfg=87              cterm=none
  hi Special    ctermfg=203
  " }}}
else
  " For 8/16 color terminals {{{
  hi Normal     ctermfg=Gray ctermbg=Black

  hi Directory  ctermfg=DarkCyan
  hi DiffText                                     cterm=inverse
  hi DiffAdd    ctermfg=Black ctermbg=Green
  hi DiffChange ctermfg=Black ctermbg=Yellow
  hi DiffDelete ctermfg=Black ctermbg=Red
  hi Folded     ctermfg=Gray
  hi ErrorMsg   ctermfg=White ctermbg=DarkRed
  hi WarningMsg ctermfg=White ctermbg=DarkYellow
  hi NonText    ctermfg=Cyan

  hi Error      ctermfg=White ctermbg=Red
  hi Comment    ctermfg=Green
  hi Constant   ctermfg=Red
  hi Boolean    ctermfg=Blue
  hi String     ctermfg=Magenta
  hi Function   ctermfg=Cyan
  hi Statement  ctermfg=Blue
  hi Operator   ctermfg=Blue
  hi PreProc    ctermfg=Blue
  hi Type       ctermfg=Cyan
  hi Identifier ctermfg=Cyan                      cterm=none
  hi Special    ctermfg=DarkRed
  " }}}
endif

" Links {{{
hi link Character String
" }}}

" vim: fdm=marker ts=2 sw=2
