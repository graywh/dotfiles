" Vim color file
" Maintainer:   Will Gray <graywh@gmail.com>
"
" For best results on 88/256-color terminals, I recommend CSApprox.vim by
" godlygeek.

" Favorite colors {{{1
"                Light                           Dark
"       Black    5F5F5F 236  8   1E1E1E 234      000000  16 0
"       Red      FFD7D7 224      FF8787 210  9   D70000 160 1
"       Green    D7FFD7 194      87FF87 120 10   00D700  40 2
"       Yellow   FFFFD7 230      FFFF87 228 11   D7D700 184 3
"       Blue     AFD7FF 153      87AFFF 111 12   005FD7  68 4
"       Magenta  FFD7FF 225      FF87FF 213 13   D700D7 164 5
"       Cyan     D7FFFF 195      87FFFF 123 14   00D7D7  44 6
"       Gray     FFFFFF 231 15                   D7D7D7 251 7
" }}}1

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "graywh-reverse"

" Links {{{1
hi link Character String

" For GUI {{{1
hi Normal               guifg=#282828   guibg=#E3E3E3

" Vim {{{2
hi SpecialKey           guifg=#B1B1B1   guibg=bg        gui=none
hi NonText              guifg=#780000   guibg=#D9D9D9   gui=none
hi Directory            guifg=#FF5050
hi ErrorMsg             guifg=#28FFFF   guibg=bg
hi IncSearch                                            gui=reverse
hi Search                               guibg=#0000FF
hi MoreMsg              guifg=#A05078                   gui=bold
hi ModeMsg                                              gui=bold
hi LineNr               guifg=#282850   guibg=#D9D9D9
hi Question             guifg=#A000A0                   gui=bold
hi StatusLine                                           gui=reverse,bold
hi StatusLineNC                                         gui=reverse
hi VertSplit                                            gui=reverse
hi Title                guifg=#007800                   gui=bold
hi Visual                               guibg=NONE      gui=reverse
hi VisualNOS                                            gui=bold,underline
hi WarningMsg           guifg=#2828FF
hi WildMenu             guifg=bg        guibg=#2828FF
hi Folded               guifg=#002800   guibg=#BBBBBB   gui=italic
hi FoldColumn           guifg=#780000   guibg=#BBBBBB

if v:version >= 600
  hi DiffAdd                              guibg=#EDCFED
  hi DiffChange                           guibg=#EDEDCF
  hi DiffDelete           guifg=fg        guibg=#CFEDED   gui=none
  hi DiffText                             guibg=#CFCFED   gui=none
endif

hi SignColumn           guifg=#000078   guibg=#BBBBBB

if v:version >= 700
  hi SpellBad                                             gui=undercurl           guisp=#00FFFF
  hi SpellCap                                             gui=undercurl           guisp=#FFFF00
  hi SpellRare                                            gui=undercurl           guisp=#00FF00
  hi SpellLocal                                           gui=undercurl           guisp=#FF0000
endif

hi Pmenu                guifg=fg        guibg=#287828
hi PmenuSel             guifg=fg        guibg=#787878
hi PmenuSbar            guifg=fg        guibg=#787878
hi PmenuThumb                                           gui=reverse
hi TabLine              guifg=bg        guibg=fg        gui=none
hi TabLineSel           guifg=fg        guibg=bg        gui=bold
hi TabLineFill          guifg=fg        guibg=bg        gui=reverse
hi CursorColumn                         guibg=#D9D9D9
hi CursorLine                           guibg=#D9D9D9
hi Cursor               guifg=bg        guibg=fg

" Syntax {{{2
hi lCursor              guifg=bg        guibg=fg
hi MatchParen                           guibg=#FF5050
hi Comment              guifg=#500050                   gui=italic
hi Constant             guifg=#005050
hi String               guifg=#005000
hi Boolean              guifg=#A07800                   gui=bold
hi Identifier           guifg=#500000
hi Function             guifg=#502800
hi Statement            guifg=#785000                   gui=none
hi Operator             guifg=#005078
hi PreProc              guifg=#A00000                   gui=none
hi Type                 guifg=#000050                   gui=none
hi Special              guifg=#00A0A0
hi Underlined           guifg=#505000                   gui=underline
hi Ignore               guifg=bg
hi Error                guifg=#000000   guibg=#00A0A0
hi Todo                 guifg=#FFFF28   guibg=#0000A0

" Custom {{{2
" mail {{{3
hi mailQuoted1          guifg=#505028   guibg=#CFCFCF
hi mailQuoted2          guifg=#285050   guibg=#CFCFCF
hi mailQuoted3          guifg=#502850   guibg=#CFCFCF
hi mailQuoted4          guifg=#285028   guibg=#CFCFCF
hi mailQuoted5          guifg=#502828   guibg=#CFCFCF
hi mailQuoted6          guifg=#282850   guibg=#CFCFCF
hi mailEmail            guifg=#A07800                   gui=underline
hi mailSignature        guifg=#757575

" For 16 color terminals {{{1
hi Normal               ctermfg=DarkGray            ctermbg=White

" Vim {{{2
hi SpecialKey           ctermfg=LightGray
hi NonText              ctermfg=DarkRed
hi Directory            ctermfg=LightRed
hi ErrorMsg             ctermfg=LightCyan         ctermbg=bg
hi IncSearch                                                            cterm=reverse
hi Search                                       ctermbg=DarkBlue
hi MoreMsg              ctermfg=DarkMagenta
hi ModeMsg                                                              cterm=bold
hi LineNr               ctermfg=DarkBlue
hi Question             ctermfg=DarkMagenta
hi StatusLine                                                           cterm=reverse,bold
hi StatusLineNC                                                         cterm=reverse
hi VertSplit                                                            cterm=reverse
hi Title                ctermfg=DarkGreen
hi Visual                                       ctermbg=bg              cterm=reverse
hi VisualNOS                                                            cterm=underline
hi WarningMsg           ctermfg=LightBlue
hi WildMenu             ctermfg=bg              ctermbg=DarkBlue
hi Folded               ctermfg=DarkGreen         ctermbg=bg
hi FoldColumn           ctermfg=DarkRed            ctermbg=bg

if v:version >= 600
  hi DiffAdd              ctermfg=White           ctermbg=LightMagenta
  hi DiffChange                                   ctermbg=LightYellow
  hi DiffDelete           ctermfg=White           ctermbg=LightCyan
  hi DiffText             ctermfg=White           ctermbg=LightBlue      cterm=none
endif

hi SignColumn           ctermfg=DarkBlue          ctermbg=bg

if v:version >= 700
  hi SpellBad                                     ctermbg=LightCyan         cterm=underline
  hi SpellCap                                     ctermbg=LightYellow        cterm=underline
  hi SpellRare                                    ctermbg=LightGreen     cterm=underline
  hi SpellLocal                                   ctermbg=LightRed        cterm=underline
endif

hi Pmenu                ctermfg=fg              ctermbg=LightGreen
hi PmenuSel             ctermfg=fg              ctermbg=LightGray
hi PmenuSbar            ctermfg=fg              ctermbg=LightGray
hi PmenuThumb                                                           cterm=reverse
hi TabLine              ctermfg=bg              ctermbg=fg              cterm=none
hi TabLineSel                                                           cterm=bold
hi TabLineFill                                                          cterm=reverse
hi CursorColumn                                 ctermbg=LightGray
hi CursorLine                                                           cterm=underline

" Syntax {{{2
hi MatchParen                                   ctermbg=LightRed
hi Comment              ctermfg=DarkMagenta
hi Constant             ctermfg=DarkCyan
hi String               ctermfg=DarkGreen
hi Boolean              ctermfg=DarkYellow
hi Identifier           ctermfg=DarkRed                                    cterm=none
hi Function             ctermfg=DarkRed
hi Statement            ctermfg=DarkYellow
hi Operator             ctermfg=DarkYellow
hi PreProc              ctermfg=LightRed
hi Type                 ctermfg=DarkBlue
hi Special              ctermfg=LightCyan
hi Underlined           ctermfg=DarkGreen                                 cterm=underline
hi Ignore               ctermfg=bg
hi Error                ctermfg=Black           ctermbg=DarkCyan
hi Todo                 ctermfg=LightYellow        ctermbg=DarkBlue

" Custom {{{2
" mail {{{3
hi mailQuoted1          ctermfg=LightYellow
hi mailQuoted2          ctermfg=LightCyan
hi mailQuoted3          ctermfg=LightMagenta
hi mailQuoted4          ctermfg=LightGreen
hi mailQuoted5          ctermfg=LightRed
hi mailQuoted6          ctermfg=LightBlue
hi mailEmail            ctermfg=DarkYellow                                    cterm=underline
hi mailSignature        ctermfg=LightGray

" 8-color terminal extras {{{2
if &t_Co == 8
  hi Identifier                                                           cterm=bold
endif

" CSApprox config {{{1
let g:CSApprox_hook_graywh_post = ['hi Visual          ctermbg=NONE ctermfg=NONE cterm=reverse',
                                 \ 'hi IncSearch       ctermbg=NONE ctermfg=NONE cterm=reverse' ]
