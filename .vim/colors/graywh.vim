" Vim color file
" Maintainer:   Will Gray <graywh@gmail.com>
" Last Change:  2006 Aug 09

" This color scheme uses a black background.

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "graywh"

hi Normal ctermbg=Black ctermfg=White guibg=Black guifg=White

hi Directory ctermfg=Cyan guifg=DarkCyan
hi DiffText cterm=inverse gui=inverse
hi DiffAdd ctermbg=LightGreen ctermfg=Black guibg=LightGreen guifg=Black
hi DiffChange  ctermbg=LightYellow ctermfg=Black guibg=LightYellow guifg=Black
hi DiffDelete ctermbg=LightRed ctermfg=Black guibg=LightRed guifg=Black gui=none
hi Folded ctermfg=Gray guifg=Gray gui=italic
hi ErrorMsg ctermbg=DarkRed ctermfg=White guibg=DarkRed guifg=White
hi WarningMsg ctermbg=DarkYellow ctermfg=White guibg=DarkYellow guifg=White
hi NonText ctermfg=Cyan gui=bold guifg=Cyan

hi Comment ctermfg=Green guifg=Green gui=italic
hi Constant ctermfg=Red guifg=Red
hi Boolean ctermfg=Blue guifg=Blue gui=bold
hi String ctermfg=Magenta guifg=Magenta
hi link Character String
hi Statement ctermfg=Blue guifg=Blue gui=None
hi Operator ctermfg=Blue guifg=Blue
hi PreProc ctermfg=Blue guifg=Blue gui=italic
hi Type ctermfg=Cyan guifg=Cyan gui=None

