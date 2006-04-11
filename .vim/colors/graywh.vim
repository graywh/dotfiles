" Vim color file
" Maintainer:   Will Gray <graywh@gmail.com>
" Last Change:  2006 Apr 01

" This color scheme uses a black background.

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "graywh"

hi Normal ctermbg=Black ctermfg=White guibg=White guifg=Black

" Groups used in the 'highlight' and 'guicursor' options default value.
" hi IncSearch term=reverse cterm=reverse gui=reverse
" hi ModeMsg term=bold cterm=bold gui=bold
" hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
" hi StatusLineNC term=reverse cterm=reverse gui=reverse
" hi VertSplit term=reverse cterm=reverse gui=reverse
" hi Visual term=reverse cterm=reverse gui=reverse guifg=Grey guibg=fg
" hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
" hi Cursor guibg=Green guifg=Black
" hi lCursor guibg=Cyan guifg=Black
" hi LineNr term=underline ctermfg=Yellow guifg=Yellow
" hi MoreMsg term=bold ctermfg=LightGreen gui=bold guifg=SeaGreen
" hi Question term=standout ctermfg=LightGreen gui=bold guifg=Green
" hi Search term=reverse ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
" hi SpecialKey term=bold ctermfg=LightBlue guifg=Cyan
" hi Title term=bold ctermfg=LightMagenta gui=bold guifg=Magenta
" hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
" hi FoldColumn term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue

" Groups used in the 'highlight' and 'guicursor' options default value.
hi Directory ctermfg=Cyan guifg=DarkCyan
hi DiffText cterm=inverse gui=inverse
hi DiffAdd ctermbg=Green guibg=Green
hi DiffChange  ctermbg=Yellow guibg=Yellow
hi DiffDelete ctermbg=Red guibg=Red
hi Folded ctermfg=Gray guifg=Gray gui=italic
hi ErrorMsg ctermbg=DarkRed ctermfg=White guibg=DarkRed guifg=White
hi WarningMsg ctermbg=DarkYellow ctermfg=White guibg=DarkYellow guifg=White
hi NonText ctermfg=Cyan gui=bold guifg=Cyan

" Groups for syntax highlighting.
hi Comment ctermfg=Green guifg=Green gui=italic
hi Constant ctermfg=Red guifg=Red
hi Boolean ctermfg=Blue guifg=Blue
hi String ctermfg=Magenta guifg=Magenta
hi link Character String
hi Statement ctermfg=Blue guifg=Blue
hi Operator ctermfg=White guifg=Black
hi PreProc ctermfg=Blue guifg=Blue gui=italic

