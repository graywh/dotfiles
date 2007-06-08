" Vim color file
" Maintainer:   Will Gray <graywh@gmail.com>
" Last Change:  2007 May 21

" Favorite colors {{{1
" I prefer to use a terminal with color levels of [00, 33, 66, 99, CC, FF]
" and have used color codes to reflect that.
"     LightRed= FFCCCC 224      Red= FF6666       DarkRed= CC0000
"  LightYellow= FFFFCC 230   Yellow= FFFF66    DarkYellow= CCCC00
"   LightGreen= CCFFCC 194    Green= 66FF66     DarkGreen= 00CC00
"    LightCyan= CCFFFF 195     Cyan= 66FFFF      DarkCyan= 00CCCC
"    LightBlue= 99CCFF 153     Blue= 6666FF      DarkBlue= 0000CC
" LightMagenta= FFCCFF 225  Magenta= FF66FF   DarkMagenta= CC00CC
" }}}1

" This color scheme uses a black background.
set background=light

" First remove all existing highlighting.
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "reversed"

" Common {{{1
" Clear {{{2
hi clear DiffChange
" Links {{{2
hi link Character String
" }}}1

  " For GUI {{{1
  hi Normal     guifg=#333333 guibg=#FFFFFF
  " Vim {{{2
  hi Directory  guifg=#FF6666
  hi DiffText                 guibg=#000033 gui=none
  hi DiffAdd                  guibg=#330033
  hi DiffDelete guifg=fg      guibg=#006666 gui=none
  hi Folded     guifg=#003300 guibg=#B8B8B8 gui=italic
  hi FoldColumn guifg=#990000 guibg=#B8B8B8
  hi LineNr     guifg=#333366 guibg=#EBEBEB
  hi ErrorMsg   guifg=#000000 guibg=#33FFFF
  hi WarningMsg guifg=#000000 guibg=#3333FF
  hi NonText    guifg=#990000               gui=bold
  " Syntax {{{2
  hi Error      guifg=#000000 guibg=#009999
  hi Comment    guifg=#990099               gui=italic
  hi Constant   guifg=#009999
  hi Boolean    guifg=#999900               gui=bold
  hi String     guifg=#009900
  hi Function   guifg=#990000
  hi Statement  guifg=#999900               gui=none
  hi Operator   guifg=#999900
  hi PreProc    guifg=#999900               gui=none
  hi Type       guifg=#990000               gui=none
  hi Identifier guifg=#990000
  hi Special    guifg=#00CCCC
  " }}}1
if &t_Co == 256
  " For 256 color terminals {{{1
  hi Normal     ctermfg=236 ctermbg=231
  " Vim {{{2
  hi Directory  ctermfg=210
  hi DiffText               ctermbg=17  cterm=none
  hi DiffAdd                ctermbg=53 
  hi DiffDelete ctermfg=fg  ctermbg=30  cterm=none
  hi Folded     ctermfg=22  ctermbg=249
  hi FoldColumn ctermfg=124 ctermbg=249
  hi LineNr     ctermfg=60  ctermbg=254
  hi SignColumn ctermfg=124 ctermbg=254
  hi ErrorMsg   ctermfg=16  ctermbg=87 
  hi WarningMsg ctermfg=16  ctermbg=63 
  hi NonText    ctermfg=124             cterm=bold
  " Syntax {{{2
  hi Error      ctermfg=16  ctermbg=44 
  hi Comment    ctermfg=127
  hi Constant   ctermfg=37 
  hi Boolean    ctermfg=142             cterm=bold
  hi String     ctermfg=34 
  hi Function   ctermfg=124
  hi Statement  ctermfg=142             cterm=none
  hi Operator   ctermfg=142
  hi PreProc    ctermfg=142             cterm=none
  hi Type       ctermfg=124             cterm=none
  hi Identifier ctermfg=124             cterm=none
  hi Special    ctermfg=44 
  " }}}1
else
  " For 8/16 color terminals {{{1
  hi Normal     ctermfg=DarkGray ctermbg=White
  " Vim {{{2
  hi Directory  ctermfg=DarkRed 
  hi DiffText   ctermfg=White    ctermbg=Blue      cterm=none
  hi DiffAdd    ctermfg=White    ctermbg=Magenta
  hi DiffDelete ctermfg=White    ctermbg=Cyan
  hi Folded     ctermfg=DarkGray ctermbg=LightGray
  hi FoldColum  ctermfg=Red      ctermbg=LightGray
  hi LineNr     ctermfg=Blue     ctermbg=LightGray
  hi SignColumn ctermfg=Red      ctermbg=LightGray
  hi ErrorMsg   ctermfg=Black    ctermbg=DarkCyan
  hi WarningMsg ctermfg=Black    ctermbg=DarkBlue  
  hi NonText    ctermfg=Red 
  " Syntax {{{2
  hi Error      ctermfg=Black     ctermbg=Cyan
  hi Comment    ctermfg=Magenta
  hi Constant   ctermfg=Cyan
  hi Boolean    ctermfg=Yellow
  hi String     ctermfg=Green
  hi Function   ctermfg=Red
  hi Statement  ctermfg=Yellow
  hi Operator   ctermfg=Yellow
  hi PreProc    ctermfg=Yellow
  hi Type       ctermfg=Red
  hi Identifier ctermfg=Red                        cterm=none
  hi Special    ctermfg=DarkCyan
  " }}}1
endif
