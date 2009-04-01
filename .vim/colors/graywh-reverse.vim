" Vim color file
" Maintainer:   Will Gray <graywh@gmail.com>
" GetLatestVimScripts: 2616 1 :AutoInstall: graywh.vim
"
" For best results on 88/256-color terminals, I recommend CSApprox.vim by
" GetLatestVimScripts: xxxx 1 :AutoInstall: graywh-reverse.vim

" Favorite colors {{{1
" I prefer to use a terminal with color levels of [00, 33, 66, 99, CC, FF]
" and have used color codes to reflect that.
"                Light                           Dark
"       Black    333333 236  8   1E1E1E 234      000000  16 0
"       Red      FFCCCC 224      FF6666 210  9   CC0000 160 1
"       Green    CCFFCC 194      66FF66 120 10   00CC00  40 2
"       Yellow   FFFFCC 230      FFFF66 228 11   CCCC00 184 3
"       Blue     99CCFF 153      6699FF 111 12   3366CC  68 4
"       Magenta  FFCCFF 225      FF66FF 213 13   CC00CC 164 5
"       Cyan     CCFFFF 195      66FFFF 123 14   00CCCC  44 6
"       Gray     FFFFFF 231 15                   CCCCCC 251 7
" }}}1

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "graywh-reverse"

" Common {{{1
" Links {{{2
hi link Character String

" For GUI {{{1
hi Normal               guifg=#333333   guibg=#E1E1E1
" Vim {{{2
hi SpecialKey           guifg=#AEAEAE   guibg=bg        gui=none
hi NonText              guifg=#990000   guibg=#D7D7D7   gui=none
hi Directory            guifg=#FF6666
hi ErrorMsg             guifg=#33FFFF   guibg=bg
hi IncSearch                                            gui=reverse
hi Search                               guibg=#0000FF
hi MoreMsg              guifg=#CC6699                   gui=bold
hi ModeMsg                                              gui=bold
hi LineNr               guifg=#333366   guibg=#D7D7D7
hi Question             guifg=#CC00CC                   gui=bold
hi StatusLine                                           gui=reverse,bold
hi StatusLineNC                                         gui=reverse
hi VertSplit                                            gui=reverse
hi Title                guifg=#009900                   gui=bold
hi Visual                               guibg=bg        gui=reverse
hi VisualNOS                                            gui=bold,underline
hi WarningMsg           guifg=#3333FF
hi WildMenu             guifg=bg        guibg=#3333FF
hi Folded               guifg=#003300   guibg=#B8B8B8   gui=italic
hi FoldColumn           guifg=#990000   guibg=#B8B8B8
if v:version >= 600
hi DiffAdd                              guibg=#EBCCEB
hi DiffChange                           guibg=#EBEBCC
hi DiffDelete           guifg=fg        guibg=#CCEBEB   gui=none
hi DiffText                             guibg=#CCCCEB   gui=none
endif
hi SignColumn           guifg=#000099   guibg=#B8B8B8
if version >= 700
  hi SpellBad                                             gui=undercurl   guisp=#FF0000
  hi SpellCap                                             gui=undercurl   guisp=#0000FF
  hi SpellRare                                            gui=undercurl   guisp=#FF00FF
  hi SpellLocal                                           gui=undercurl   guisp=#00FFFF
endif
hi Pmenu                guifg=fg        guibg=#339933
hi PmenuSel             guifg=fg        guibg=#999999
hi PmenuSbar            guifg=fg        guibg=#999999
hi PmenuThumb                                           gui=reverse
hi TabLine              guifg=bg        guibg=fg        gui=none
hi TabLineSel           guifg=fg        guibg=bg        gui=bold
hi TabLineFill          guifg=fg        guibg=bg        gui=reverse
hi CursorColumn                         guibg=#D7D7D7
hi CursorLine                           guibg=#D7D7D7
hi Cursor               guifg=bg        guibg=fg
" Syntax {{{2
hi lCursor              guifg=bg        guibg=fg
hi MatchParen                           guibg=#FF6666
hi Comment              guifg=#660066                   gui=italic
hi Constant             guifg=#006666
hi String               guifg=#006600
hi Boolean              guifg=#CC9900                   gui=bold
hi Identifier           guifg=#660000
hi Function             guifg=#663300
hi Statement            guifg=#996600                   gui=none
hi Operator             guifg=#006699
hi PreProc              guifg=#CC0000                   gui=none
hi Type                 guifg=#000066                   gui=none
hi Special              guifg=#00CCCC
hi Underlined           guifg=#666600                   gui=underline
hi Ignore               guifg=bg
hi Error                guifg=#000000   guibg=#00CCCC
hi Todo                 guifg=#FFFF33   guibg=#0000CC
" For 16 color terminals {{{1
hi Normal       ctermfg=DarkGray        ctermbg=White
" Vim {{{2
hi SpecialKey   ctermfg=LightGray
hi NonText      ctermfg=Red
hi Directory    ctermfg=DarkRed
hi ErrorMsg     ctermfg=DarkCyan        ctermbg=bg
hi IncSearch                                                    cterm=reverse
hi Search                               ctermbg=Blue
hi MoreMsg      ctermfg=Magenta
hi ModeMsg                                                      cterm=bold
hi LineNr       ctermfg=Blue
hi Question     ctermfg=Magenta
hi StatusLine                                                   cterm=reverse,bold
hi StatusLineNC                                                 cterm=reverse
hi VertSplit                                                    cterm=reverse
hi Title        ctermfg=Green
hi Visual                               ctermbg=bg              cterm=reverse
hi VisualNOS                                                    cterm=underline
hi WarningMsg   ctermfg=DarkBlue
hi WildMenu     ctermfg=bg              ctermbg=Blue
hi Folded       ctermfg=Green           ctermbg=bg
hi FoldColumn   ctermfg=Red             ctermbg=bg
if v:version >= 600
hi DiffAdd      ctermfg=White           ctermbg=DarkMagenta
hi DiffChange                           ctermbg=DarkYellow
hi DiffDelete   ctermfg=White           ctermbg=DarkCyan
hi DiffText     ctermfg=White           ctermbg=DarkBlue        cterm=none
endif
hi SignColumn   ctermfg=Blue            ctermbg=bg
if version >= 700
  hi SpellBad                             ctermbg=DarkCyan        cterm=underline
  hi SpellCap                             ctermbg=DarkYellow      cterm=underline
  hi SpellRare                            ctermbg=DarkGreen       cterm=underline
  hi SpellLocal                           ctermbg=DarkRed         cterm=underline
endif
hi Pmenu        ctermfg=fg              ctermbg=DarkGreen
hi PmenuSel     ctermfg=fg              ctermbg=LightGray
hi PmenuSbar    ctermfg=fg              ctermbg=LightGray
hi PmenuThumb                                                   cterm=reverse
hi TabLine      ctermfg=bg              ctermbg=fg              cterm=none
hi TabLineSel                                                   cterm=bold
hi TabLineFill                                                  cterm=reverse
hi CursorColumn                         ctermbg=LightGray
hi CursorLine                                                   cterm=underline
" Syntax {{{2
hi MatchParen                           ctermbg=DarkRed
hi Comment      ctermfg=Magenta
hi Constant     ctermfg=Cyan
hi String       ctermfg=Green
hi Boolean      ctermfg=Yellow
hi Identifier   ctermfg=Red                                     cterm=none
hi Function     ctermfg=Red
hi Statement    ctermfg=Yellow
hi Operator     ctermfg=Yellow
hi PreProc      ctermfg=DarkRed
hi Type         ctermfg=Blue
hi Special      ctermfg=DarkCyan
hi Underlined   ctermfg=Green                                   cterm=underline
hi Ignore       ctermfg=bg
hi Error        ctermfg=Black           ctermbg=Cyan
hi Todo         ctermfg=DarkYellow      ctermbg=Blue
" 8-color terminal extras {{{2
if &t_Co == 8
hi Identifier cterm=bold
endif
