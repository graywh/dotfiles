" Vim color file
" Maintainer:   Will Gray <graywh@gmail.com>
" GetLatestVimScripts: 2616 1 :AutoInstall: graywh.vim
"
" For best results on 88/256-color terminals, I recommend CSApprox.vim by
" godlygeek.

" Favorite colors {{{1
" I prefer to use a terminal with color levels of [00, 5F, 87, AF, D7, FF]
" and have used color codes to reflect that.
"                Light                           Dark
"       Black    5F5F5F 236  8   1E1E1E 234      000000  16 0
"       Red      FFD7D7 224      FF8787 210  9   D70000 160 1
"       Green    D7FFD7 194      87FF87 120 10   00D700  40 2
"       Yellow   FFFFD7 230      FFFF87 228 11   D7D700 184 3
"       Blue     AFD7FF 153      87AFFF 111 12   5F87D7  68 4
"       Magenta  FFD7FF 225      FF87FF 213 13   D700D7 164 5
"       Cyan     D7FFFF 195      87FFFF 123 14   00D7D7  44 6
"       Gray     FFFFFF 231 15                   D7D7D7 251 7
" }}}1

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "graywh"

" Common {{{1
" Links {{{2
hi link Character String

" For GUI {{{1
hi Normal               guifg=#D7D7D7   guibg=#1C1C1C

" Vim {{{2
hi SpecialKey           guifg=#515151   guibg=bg        gui=none
hi NonText              guifg=#87FFFF   guibg=#262626   gui=none
hi Directory            guifg=#00AFAF
hi ErrorMsg             guifg=#D70000   guibg=bg
hi IncSearch                                            gui=reverse
hi Search                               guibg=#FFFF00
hi MoreMsg              guifg=#5FAF87                   gui=bold
hi ModeMsg                                              gui=bold
hi LineNr               guifg=#D7D7AF   guibg=#262626
hi Question             guifg=#5FFF5F                   gui=bold
hi StatusLine                                           gui=reverse,bold
hi StatusLineNC                                         gui=reverse
hi VertSplit                                            gui=reverse
hi Title                guifg=#FF87FF                   gui=bold
hi Visual                               guibg=bg        gui=reverse
hi VisualNOS                                            gui=bold,underline
hi WarningMsg           guifg=#D7D700
hi WildMenu             guifg=bg        guibg=#D7D700
hi Folded               guifg=#FFD7FF   guibg=#444444   gui=italic
hi FoldColumn           guifg=#87FFFF   guibg=#444444

if v:version >= 600
  hi DiffAdd                              guibg=#123012
  hi DiffChange                           guibg=#121230
  hi DiffDelete           guifg=fg        guibg=#301212   gui=none
  hi DiffText                             guibg=#303012   gui=none
endif

hi SignColumn           guifg=#FFFF87   guibg=#444444

if v:version >= 700
  hi SpellBad                                             gui=undercurl           guisp=#FF0000
  hi SpellCap                                             gui=undercurl           guisp=#0000FF
  hi SpellRare                                            gui=undercurl           guisp=#FF00FF
  hi SpellLocal                                           gui=undercurl           guisp=#00FFFF
endif

hi Pmenu                guifg=fg        guibg=#D787D7
hi PmenuSel             guifg=fg        guibg=#878787
hi PmenuSbar            guifg=fg        guibg=#878787
hi PmenuThumb                                           gui=reverse
hi TabLine              guifg=bg        guibg=fg        gui=none
hi TabLineSel           guifg=fg        guibg=bg        gui=bold
hi TabLineFill          guifg=fg        guibg=bg        gui=reverse
hi CursorColumn                         guibg=#262626
hi CursorLine                           guibg=#262626
hi Cursor               guifg=bg        guibg=fg

" Syntax {{{2
hi lCursor              guifg=bg        guibg=fg
hi MatchParen                           guibg=#00AFAF
hi Comment              guifg=#AFFFAF                   gui=italic
hi Constant             guifg=#FFAFAF
hi String               guifg=#FFAFFF
hi Boolean              guifg=#5F87FF                   gui=bold
hi Identifier           guifg=#AFFFFF
hi Function             guifg=#AFD7FF
hi Statement            guifg=#87AFFF                   gui=none
hi Operator             guifg=#FFAF87
hi PreProc              guifg=#5FFFFF                   gui=none
hi Type                 guifg=#FFFFAF                   gui=none
hi Special              guifg=#FF5F5F
hi Underlined           guifg=#AFAFFF                   gui=underline
hi Ignore               guifg=bg
hi Error                guifg=#FFFFFF   guibg=#FF5F5F
hi Todo                 guifg=#0000D7   guibg=#FFFF5F

" For 16 color terminals {{{1
hi Normal               ctermfg=Gray            ctermbg=Black

" Vim {{{2
hi SpecialKey           ctermfg=DarkGray
hi NonText              ctermfg=Cyan
hi Directory            ctermfg=DarkCyan
hi ErrorMsg             ctermfg=DarkRed         ctermbg=bg
hi IncSearch                                                            cterm=reverse
hi Search                                       ctermbg=Yellow
hi MoreMsg              ctermfg=Green
hi ModeMsg                                                              cterm=bold
hi LineNr               ctermfg=Yellow
hi Question             ctermfg=Green
hi StatusLine                                                           cterm=reverse,bold
hi StatusLineNC                                                         cterm=reverse
hi VertSplit                                                            cterm=reverse
hi Title                ctermfg=Magenta
hi Visual                                       ctermbg=bg              cterm=reverse
hi VisualNOS                                                            cterm=underline
hi WarningMsg           ctermfg=DarkYellow
hi WildMenu             ctermfg=bg              ctermbg=Yellow
hi Folded               ctermfg=Magenta         ctermbg=bg
hi FoldColumn           ctermfg=Cyan            ctermbg=bg

if v:version >= 600
  hi DiffAdd              ctermfg=Black           ctermbg=DarkGreen
  hi DiffChange                                   ctermbg=DarkBlue
  hi DiffDelete           ctermfg=Black           ctermbg=DarkRed
  hi DiffText             ctermfg=Black           ctermbg=DarkYellow      cterm=none
endif

hi SignColumn           ctermfg=Yellow          ctermbg=bg

if v:version >= 700
  hi SpellBad                                     ctermbg=DarkRed         cterm=underline
  hi SpellCap                                     ctermbg=DarkBlue        cterm=underline
  hi SpellRare                                    ctermbg=DarkMagenta     cterm=underline
  hi SpellLocal                                   ctermbg=DarkCyan        cterm=underline
endif

hi Pmenu                ctermfg=fg              ctermbg=DarkMagenta
hi PmenuSel             ctermfg=fg              ctermbg=DarkGray
hi PmenuSbar            ctermfg=fg              ctermbg=DarkGray
hi PmenuThumb                                                           cterm=reverse
hi TabLine              ctermfg=bg              ctermbg=fg              cterm=none
hi TabLineSel                                                           cterm=bold
hi TabLineFill                                                          cterm=reverse
hi CursorColumn                                 ctermbg=DarkGray
hi CursorLine                                                           cterm=underline

" Syntax {{{2
hi MatchParen                                   ctermbg=DarkCyan
hi Comment              ctermfg=Green
hi Constant             ctermfg=Red
hi String               ctermfg=Magenta
hi Boolean              ctermfg=Blue
hi Identifier           ctermfg=Cyan                                    cterm=none
hi Function             ctermfg=Cyan
hi Statement            ctermfg=Blue
hi Operator             ctermfg=Blue
hi PreProc              ctermfg=DarkCyan
hi Type                 ctermfg=Yellow
hi Special              ctermfg=DarkRed
hi Underlined           ctermfg=Magenta                                 cterm=underline
hi Ignore               ctermfg=bg
hi Error                ctermfg=White           ctermbg=Red
hi Todo                 ctermfg=DarkBlue        ctermbg=Yellow

" 8-color terminal extras {{{2
if &t_Co == 8
  hi Identifier                                                           cterm=bold
endif
