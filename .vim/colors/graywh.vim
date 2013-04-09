" Vim color file
" Maintainer:   Will Gray <graywh@gmail.com>
" GetLatestVimScripts: 2616 1 :AutoInstall: graywh.vim
"
" For use in 88/256-color terminals, I recommend CSApprox.vim by
" godlygeek.
"
" All colors based on what's available in a standard 256-color xterm.
" 216-color cube levels:
"    0 95 135 175 215 255
"   00 5F  87  AF  D7  FF
" grayscale: (0..23) * 10 + 8
"    8 12 1C 26 30 3A 44 4E 58 62 6C 76
"   80 8A 94 9E A8 B2 BC C6 D0 DA E4 EE

" First, reset highlighting back to default.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "graywh"

" Links {{{1
hi! link VertSplit StatusLineNC
hi! link Conceal SpecialKey
hi! link CursorColumn CursorLine
hi! link Character String

" For GUI {{{1
hi Normal               guifg=#D7D7D7   guibg=#1C1C1C

" Vim {{{2
hi SpecialKey           guifg=#4E4E4E   guibg=bg        gui=none
hi NonText              guifg=#87FFFF   guibg=#262626   gui=none
hi Directory            guifg=#00AFAF
hi ErrorMsg             guifg=#D70000   guibg=bg
hi IncSearch                                            gui=reverse
hi Search                               guibg=#FFFF00
hi MoreMsg              guifg=#5FAF87                   gui=bold
hi ModeMsg                                              gui=bold
hi LineNr               guifg=#87875F   guibg=#262626
hi CursorLineNr         guifg=#AFAF87   guibg=#262626
hi Question             guifg=#5FFF5F                   gui=bold
hi StatusLine                                           gui=reverse,bold
hi StatusLineNC                                         gui=reverse
hi Title                guifg=#FF87FF                   gui=bold
hi Visual                               guibg=NONE      gui=reverse
hi VisualNOS                                            gui=bold,underline
hi WarningMsg           guifg=#D7D700
hi WildMenu             guifg=bg        guibg=#D7D700
hi Folded               guifg=#AF87AF   guibg=#303030   gui=italic
hi FoldColumn           guifg=#5F8787   guibg=#303030
hi DiffAdd                              guibg=#123012
hi DiffChange                           guibg=#121230
hi DiffDelete           guifg=fg        guibg=#301212   gui=none
hi DiffText                             guibg=#303012   gui=none
hi SignColumn                           guibg=#303030
hi SpellBad                                             gui=undercurl           guisp=#FF0000
hi SpellCap                                             gui=undercurl           guisp=#0000FF
hi SpellRare                                            gui=undercurl           guisp=#FF00FF
hi SpellLocal                                           gui=undercurl           guisp=#00FFFF
hi Pmenu                guifg=fg        guibg=#D787D7
hi PmenuSel             guifg=fg        guibg=#878787
hi PmenuSbar            guifg=fg        guibg=#878787
hi PmenuThumb                                           gui=reverse
hi TabLine              guifg=bg        guibg=fg        gui=none
hi TabLineSel           guifg=fg        guibg=bg        gui=bold
hi TabLineFill          guifg=fg        guibg=bg        gui=reverse
hi CursorLine                           guibg=#303030
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

" Custom {{{2
hi colorIndentOdd                       guibg=#121212
hi colorIndentEven                      guibg=#262626
" mail {{{3
hi mailQuoted1          guifg=#AFAFD7   guibg=#303030
hi mailQuoted2          guifg=#D7AFAF   guibg=#303030
hi mailQuoted3          guifg=#AFD7AF   guibg=#303030
hi mailQuoted4          guifg=#D7AFD7   guibg=#303030
hi mailQuoted5          guifg=#AFD7D7   guibg=#303030
hi mailQuoted6          guifg=#D7D7AF   guibg=#303030
hi mailEmail            guifg=#5F87FF                   gui=underline
hi mailSignature        guifg=#8A8A8A

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
hi LineNr               ctermfg=DarkYellow
hi CursorLineNr         ctermfg=Yellow
hi Question             ctermfg=Green
hi StatusLine                                                           cterm=reverse,bold
hi StatusLineNC                                                         cterm=reverse
hi Title                ctermfg=Magenta
hi Visual                                       ctermbg=bg              cterm=reverse
hi VisualNOS                                                            cterm=underline
hi WarningMsg           ctermfg=DarkYellow
hi WildMenu             ctermfg=bg              ctermbg=Yellow
hi Folded               ctermfg=DarkMagenta     ctermbg=bg
hi FoldColumn           ctermfg=DarkCyan        ctermbg=bg
hi DiffAdd              ctermfg=Black           ctermbg=DarkGreen
hi DiffChange                                   ctermbg=DarkBlue
hi DiffDelete           ctermfg=Black           ctermbg=DarkRed
hi DiffText             ctermfg=Black           ctermbg=DarkYellow      cterm=none
hi SignColumn                                   ctermbg=bg
hi SpellBad                                     ctermbg=DarkRed         cterm=underline
hi SpellCap                                     ctermbg=DarkBlue        cterm=underline
hi SpellRare                                    ctermbg=DarkMagenta     cterm=underline
hi SpellLocal                                   ctermbg=DarkCyan        cterm=underline
hi Pmenu                ctermfg=fg              ctermbg=DarkMagenta
hi PmenuSel             ctermfg=fg              ctermbg=DarkGray
hi PmenuSbar            ctermfg=fg              ctermbg=DarkGray
hi PmenuThumb                                                           cterm=reverse
hi TabLine              ctermfg=bg              ctermbg=fg
hi TabLineSel                                                           cterm=bold
hi TabLineFill                                                          cterm=reverse
hi CursorLine                                   ctermbg=DarkGray        cterm=none

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

" Custom {{{2
hi colorIndentOdd                               ctermbg=Black
hi colorIndentEven                              ctermbg=DarkGray
" mail {{{3
hi mailQuoted1          ctermfg=DarkBlue
hi mailQuoted2          ctermfg=DarkRed
hi mailQuoted3          ctermfg=DarkGreen
hi mailQuoted4          ctermfg=DarkMagenta
hi mailQuoted5          ctermfg=DarkCyan
hi mailQuoted6          ctermfg=DarkYellow
hi mailEmail            ctermfg=Blue                                    cterm=underline
hi mailSignature        ctermfg=DarkGray

" 8-color terminal extras {{{2
if &t_Co == 8
  hi Identifier                                                         cterm=bold
  hi CursorLine                                 ctermbg=NONE            cterm=underline
  hi! link CursorColumn NONE
endif

" CSApprox config {{{1
let g:CSApprox_hook_graywh_post = [
      \ 'hi Visual          ctermbg=NONE ctermfg=NONE cterm=reverse',
      \ 'hi IncSearch       ctermbg=NONE ctermfg=NONE cterm=reverse'
      \ ]
