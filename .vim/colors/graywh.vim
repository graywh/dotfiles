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
set background=dark

" First remove all existing highlighting.
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "graywh"

" Common {{{1
" Clear {{{2
hi clear DiffChange
" Links {{{2
hi link Character String
" }}}1

  " For GUI {{{1
  hi Normal     guifg=#CCCCCC guibg=#1E1E1E
  " Vim {{{2
  hi CursorLine               guibg=#323232
  hi Directory  guifg=#009999
  hi DiffText                 guibg=#FFFFCC gui=none
  hi DiffAdd                  guibg=#CCFFCC
  hi DiffDelete guifg=fg      guibg=#FF9999 gui=none
  hi Folded     guifg=#FFCCFF guibg=#474747 gui=italic
  hi FoldColumn guifg=#66FFFF guibg=#474747
  hi LineNr     guifg=#CCCC99 guibg=#282828
  hi ErrorMsg   guifg=#FFFFFF guibg=#CC0000
  hi WarningMsg guifg=#FFFFFF guibg=#CCCC00
  hi NonText    guifg=#66FFFF               gui=bold
  hi Title      guifg=#FF99FF               gui=bold
  hi Visual                                 gui=reverse
  " Syntax {{{2
  hi Error      guifg=#FFFFFF guibg=#FF3333
  hi Comment    guifg=#99FF99               gui=italic
  hi Constant   guifg=#FF9999
  hi Boolean    guifg=#3366FF               gui=bold
  hi String     guifg=#FF99FF
  hi Function   guifg=#99CCFF
  hi Statement  guifg=#6699FF               gui=none
  hi Operator   guifg=#FF9966
  hi PreProc    guifg=#33FFFF               gui=none
  hi Type       guifg=#FFFF99               gui=none
  hi Identifier guifg=#99FFFF
  hi Special    guifg=#FF3333
  " }}}1
if &t_Co == 256
  " For 256 color terminals {{{1
  hi Normal     ctermfg=251 ctermbg=234
  " Vim {{{2
  hi Directory  ctermfg=37
  hi DiffText               ctermbg=230 cterm=none
  hi DiffAdd                ctermbg=194
  hi DiffDelete ctermfg=fg  ctermbg=217 cterm=none
  hi Folded     ctermfg=225 ctermbg=238
  hi FoldColumn ctermfg=123 ctermbg=238
  hi LineNr     ctermfg=187 ctermbg=235
  hi SignColumn ctermfg=123 ctermbg=235
  hi ErrorMsg   ctermfg=231 ctermbg=160
  hi WarningMsg ctermfg=231 ctermbg=184
  hi NonText    ctermfg=123             cterm=bold
  hi Title      ctermfg=219
  " Syntax {{{2
  hi Error      ctermfg=231 ctermbg=210
  hi Comment    ctermfg=157
  hi Constant   ctermfg=217
  hi Boolean    ctermfg=69              cterm=bold
  hi String     ctermfg=219
  hi Function   ctermfg=153
  hi Statement  ctermfg=111             cterm=none
  hi Operator   ctermfg=216
  hi PreProc    ctermfg=87              cterm=none
  hi Type       ctermfg=229             cterm=none
  hi Identifier ctermfg=159             cterm=none
  hi Special    ctermfg=203
  " }}}1
else
  " For 8/16 color terminals {{{1
  hi Normal     ctermfg=Gray     ctermbg=Black
  " Vim {{{2
  hi Directory  ctermfg=DarkCyan
  hi DiffText   ctermfg=Black    ctermbg=Yellow      cterm=none
  hi DiffAdd    ctermfg=Black    ctermbg=Green
  hi DiffDelete ctermfg=Black    ctermbg=Red
  hi Folded     ctermfg=Gray     ctermbg=DarkGray
  hi FoldColum  ctermfg=Cyan     ctermbg=DarkGray
  hi LineNr     ctermfg=Yellow   ctermbg=DarkGray
  hi SignColumn ctermfg=Cyan     ctermbg=DarkGray
  hi ErrorMsg   ctermfg=White    ctermbg=DarkRed
  hi WarningMsg ctermfg=White    ctermbg=DarkYellow
  hi NonText    ctermfg=Cyan
  hi Title      ctermfg=DarkMagenta
  " Syntax {{{2
  hi Error      ctermfg=White    ctermbg=Red
  hi Comment    ctermfg=Green
  hi Constant   ctermfg=Red
  hi Boolean    ctermfg=Blue
  hi String     ctermfg=Magenta
  hi Function   ctermfg=Cyan
  hi Statement  ctermfg=Blue
  hi Operator   ctermfg=Blue
  hi PreProc    ctermfg=Blue
  hi Type       ctermfg=Cyan
  hi Identifier ctermfg=Cyan                            cterm=none
  hi Special    ctermfg=DarkRed
  " }}}1
endif
