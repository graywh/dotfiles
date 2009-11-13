" This scheme was created by CSApproxSnapshot
" on Thu, 12 Mar 2009

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = 'graywh-csapproxsnapshot'
else
    let g:colors_name = 'graywh-csapproxsnapshot'
endif

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || &term =~? "^konsole"
    CSAHi Normal term=NONE cterm=NONE ctermbg=0 ctermfg=7 gui=NONE guibg=#1e1e1e guifg=#cccccc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=8 gui=NONE guibg=#1e1e1e guifg=#515151
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=11 gui=NONE guibg=#282828 guifg=#66ffff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=3 gui=NONE guibg=bg guifg=#009999
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=0 ctermfg=4 gui=NONE guibg=#1e1e1e guifg=#cc0000
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=14 ctermfg=0 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=10 gui=bold guibg=bg guifg=#339966
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=14 gui=NONE guibg=#282828 guifg=#cccc99
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=5 ctermfg=7 gui=NONE guibg=#cc66cc guifg=#cccccc
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=8 ctermfg=7 gui=NONE guibg=#666666 guifg=#cccccc
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=8 ctermfg=7 gui=NONE guibg=#666666 guifg=#cccccc
    CSAHi PmenuThumb term=NONE cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=7 ctermfg=0 gui=NONE guibg=#cccccc guifg=#1e1e1e
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=#1e1e1e guifg=#cccccc
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=#1e1e1e guifg=#cccccc
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=8 ctermfg=fg gui=NONE guibg=#282828 guifg=fg
    CSAHi CursorLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=NONE guibg=#282828 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=#cccccc guifg=#1e1e1e
    CSAHi lCursor term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=#cccccc guifg=#1e1e1e
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=3 ctermfg=fg gui=NONE guibg=#00ffff guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=10 gui=italic guibg=bg guifg=#99ff99
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=11 gui=NONE guibg=bg guifg=#99ffff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=9 gui=NONE guibg=bg guifg=#6699ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=3 gui=NONE guibg=bg guifg=#33ffff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=14 gui=NONE guibg=bg guifg=#ffff99
    CSAHi NONE term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=13 gui=underline guibg=bg guifg=#99aaff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=0 gui=NONE guibg=bg guifg=#1e1e1e
    CSAHi Error term=reverse cterm=NONE ctermbg=12 ctermfg=15 gui=NONE guibg=#ff3333 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=14 ctermfg=1 gui=NONE guibg=#ffff33 guifg=#0000cc
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=13 gui=NONE guibg=bg guifg=#ff99ff
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=9 gui=bold guibg=bg guifg=#3366ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=11 gui=NONE guibg=bg guifg=#99ccff
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=9 gui=NONE guibg=bg guifg=#ff9966
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=12 gui=NONE guibg=bg guifg=#ff9999
    CSAHi VimSynMtchCchar term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=4 gui=NONE guibg=bg guifg=#ff3333
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=10 gui=bold guibg=bg guifg=#33ff33
    CSAHi StatusLine term=reverse,bold cterm=reverse,bold ctermbg=bg ctermfg=fg gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=13 gui=bold guibg=bg guifg=#ff66ff
    CSAHi Visual term=reverse cterm=reverse ctermbg=0 ctermfg=fg gui=reverse guibg=#1e1e1e guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=6 gui=NONE guibg=bg guifg=#cccc00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=14 ctermfg=0 gui=NONE guibg=#cccc00 guifg=#1e1e1e
    CSAHi Folded term=NONE cterm=NONE ctermbg=0 ctermfg=13 gui=italic guibg=#474747 guifg=#ffccff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=0 ctermfg=11 gui=NONE guibg=#474747 guifg=#66ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=2 ctermfg=0 gui=NONE guibg=#1e331e guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=8 ctermfg=fg gui=NONE guibg=#282828 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=4 ctermfg=0 gui=NONE guibg=#331e1e guifg=#cccccc
    CSAHi DiffText term=reverse cterm=NONE ctermbg=6 ctermfg=0 gui=NONE guibg=#33331e guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=0 ctermfg=14 gui=NONE guibg=#474747 guifg=#ffff66
    CSAHi SpellBad term=reverse cterm=underline ctermbg=4 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=underline ctermbg=1 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=underline ctermbg=5 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=underline ctermbg=3 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#00ffff
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=0 ctermfg=7 gui=NONE guibg=#1e1e1e guifg=#cccccc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=8 gui=NONE guibg=#1e1e1e guifg=#515151
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=11 gui=NONE guibg=#282828 guifg=#66ffff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=3 gui=NONE guibg=bg guifg=#009999
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=0 ctermfg=4 gui=NONE guibg=#1e1e1e guifg=#cc0000
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=14 ctermfg=0 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=10 gui=bold guibg=bg guifg=#339966
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=14 gui=NONE guibg=#282828 guifg=#cccc99
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=5 ctermfg=7 gui=NONE guibg=#cc66cc guifg=#cccccc
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=8 ctermfg=7 gui=NONE guibg=#666666 guifg=#cccccc
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=8 ctermfg=7 gui=NONE guibg=#666666 guifg=#cccccc
    CSAHi PmenuThumb term=NONE cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=7 ctermfg=0 gui=NONE guibg=#cccccc guifg=#1e1e1e
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=#1e1e1e guifg=#cccccc
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=#1e1e1e guifg=#cccccc
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=8 ctermfg=fg gui=NONE guibg=#282828 guifg=fg
    CSAHi CursorLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=NONE guibg=#282828 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=#cccccc guifg=#1e1e1e
    CSAHi lCursor term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=#cccccc guifg=#1e1e1e
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=3 ctermfg=fg gui=NONE guibg=#00ffff guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=10 gui=italic guibg=bg guifg=#99ff99
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=11 gui=NONE guibg=bg guifg=#99ffff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=9 gui=NONE guibg=bg guifg=#6699ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=3 gui=NONE guibg=bg guifg=#33ffff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=14 gui=NONE guibg=bg guifg=#ffff99
    CSAHi NONE term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=13 gui=underline guibg=bg guifg=#99aaff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=0 gui=NONE guibg=bg guifg=#1e1e1e
    CSAHi Error term=reverse cterm=NONE ctermbg=12 ctermfg=15 gui=NONE guibg=#ff3333 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=14 ctermfg=1 gui=NONE guibg=#ffff33 guifg=#0000cc
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=13 gui=NONE guibg=bg guifg=#ff99ff
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=9 gui=bold guibg=bg guifg=#3366ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=11 gui=NONE guibg=bg guifg=#99ccff
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=9 gui=NONE guibg=bg guifg=#ff9966
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=12 gui=NONE guibg=bg guifg=#ff9999
    CSAHi VimSynMtchCchar term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=4 gui=NONE guibg=bg guifg=#ff3333
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=10 gui=bold guibg=bg guifg=#33ff33
    CSAHi StatusLine term=reverse,bold cterm=reverse,bold ctermbg=bg ctermfg=fg gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=13 gui=bold guibg=bg guifg=#ff66ff
    CSAHi Visual term=reverse cterm=reverse ctermbg=0 ctermfg=fg gui=reverse guibg=#1e1e1e guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=6 gui=NONE guibg=bg guifg=#cccc00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=14 ctermfg=0 gui=NONE guibg=#cccc00 guifg=#1e1e1e
    CSAHi Folded term=NONE cterm=NONE ctermbg=0 ctermfg=13 gui=italic guibg=#474747 guifg=#ffccff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=0 ctermfg=11 gui=NONE guibg=#474747 guifg=#66ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=2 ctermfg=0 gui=NONE guibg=#1e331e guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=8 ctermfg=fg gui=NONE guibg=#282828 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=4 ctermfg=0 gui=NONE guibg=#331e1e guifg=#cccccc
    CSAHi DiffText term=reverse cterm=NONE ctermbg=6 ctermfg=0 gui=NONE guibg=#33331e guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=0 ctermfg=14 gui=NONE guibg=#474747 guifg=#ffff66
    CSAHi SpellBad term=reverse cterm=underline ctermbg=4 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=underline ctermbg=1 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=underline ctermbg=5 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=underline ctermbg=3 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#00ffff
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=0 ctermfg=7 gui=NONE guibg=#1e1e1e guifg=#cccccc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=8 gui=NONE guibg=#1e1e1e guifg=#515151
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=11 gui=NONE guibg=#282828 guifg=#66ffff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=3 gui=NONE guibg=bg guifg=#009999
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=0 ctermfg=4 gui=NONE guibg=#1e1e1e guifg=#cc0000
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=14 ctermfg=0 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=10 gui=bold guibg=bg guifg=#339966
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=14 gui=NONE guibg=#282828 guifg=#cccc99
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=5 ctermfg=7 gui=NONE guibg=#cc66cc guifg=#cccccc
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=8 ctermfg=7 gui=NONE guibg=#666666 guifg=#cccccc
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=8 ctermfg=7 gui=NONE guibg=#666666 guifg=#cccccc
    CSAHi PmenuThumb term=NONE cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=7 ctermfg=0 gui=NONE guibg=#cccccc guifg=#1e1e1e
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=#1e1e1e guifg=#cccccc
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=#1e1e1e guifg=#cccccc
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=8 ctermfg=fg gui=NONE guibg=#282828 guifg=fg
    CSAHi CursorLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=NONE guibg=#282828 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=#cccccc guifg=#1e1e1e
    CSAHi lCursor term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=#cccccc guifg=#1e1e1e
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=3 ctermfg=fg gui=NONE guibg=#00ffff guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=10 gui=italic guibg=bg guifg=#99ff99
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=11 gui=NONE guibg=bg guifg=#99ffff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=9 gui=NONE guibg=bg guifg=#6699ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=3 gui=NONE guibg=bg guifg=#33ffff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=14 gui=NONE guibg=bg guifg=#ffff99
    CSAHi NONE term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=13 gui=underline guibg=bg guifg=#99aaff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=0 gui=NONE guibg=bg guifg=#1e1e1e
    CSAHi Error term=reverse cterm=NONE ctermbg=12 ctermfg=15 gui=NONE guibg=#ff3333 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=14 ctermfg=1 gui=NONE guibg=#ffff33 guifg=#0000cc
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=13 gui=NONE guibg=bg guifg=#ff99ff
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=9 gui=bold guibg=bg guifg=#3366ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=11 gui=NONE guibg=bg guifg=#99ccff
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=9 gui=NONE guibg=bg guifg=#ff9966
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=12 gui=NONE guibg=bg guifg=#ff9999
    CSAHi VimSynMtchCchar term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=4 gui=NONE guibg=bg guifg=#ff3333
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=10 gui=bold guibg=bg guifg=#33ff33
    CSAHi StatusLine term=reverse,bold cterm=reverse,bold ctermbg=bg ctermfg=fg gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=13 gui=bold guibg=bg guifg=#ff66ff
    CSAHi Visual term=reverse cterm=reverse ctermbg=0 ctermfg=fg gui=reverse guibg=#1e1e1e guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=6 gui=NONE guibg=bg guifg=#cccc00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=14 ctermfg=0 gui=NONE guibg=#cccc00 guifg=#1e1e1e
    CSAHi Folded term=NONE cterm=NONE ctermbg=0 ctermfg=13 gui=italic guibg=#474747 guifg=#ffccff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=0 ctermfg=11 gui=NONE guibg=#474747 guifg=#66ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=2 ctermfg=0 gui=NONE guibg=#1e331e guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=8 ctermfg=fg gui=NONE guibg=#282828 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=4 ctermfg=0 gui=NONE guibg=#331e1e guifg=#cccccc
    CSAHi DiffText term=reverse cterm=NONE ctermbg=6 ctermfg=0 gui=NONE guibg=#33331e guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=0 ctermfg=14 gui=NONE guibg=#474747 guifg=#ffff66
    CSAHi SpellBad term=reverse cterm=underline ctermbg=4 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=underline ctermbg=1 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=underline ctermbg=5 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=underline ctermbg=3 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#00ffff
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=0 ctermfg=7 gui=NONE guibg=#1e1e1e guifg=#cccccc
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=8 gui=NONE guibg=#1e1e1e guifg=#515151
    CSAHi NonText term=bold cterm=NONE ctermbg=bg ctermfg=11 gui=NONE guibg=#282828 guifg=#66ffff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=3 gui=NONE guibg=bg guifg=#009999
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=0 ctermfg=4 gui=NONE guibg=#1e1e1e guifg=#cc0000
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=14 ctermfg=0 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=NONE ctermbg=bg ctermfg=10 gui=bold guibg=bg guifg=#339966
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=14 gui=NONE guibg=#282828 guifg=#cccc99
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=5 ctermfg=7 gui=NONE guibg=#cc66cc guifg=#cccccc
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=8 ctermfg=7 gui=NONE guibg=#666666 guifg=#cccccc
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=8 ctermfg=7 gui=NONE guibg=#666666 guifg=#cccccc
    CSAHi PmenuThumb term=NONE cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=7 ctermfg=0 gui=NONE guibg=#cccccc guifg=#1e1e1e
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=#1e1e1e guifg=#cccccc
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=#1e1e1e guifg=#cccccc
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=8 ctermfg=fg gui=NONE guibg=#282828 guifg=fg
    CSAHi CursorLine term=underline cterm=underline ctermbg=bg ctermfg=fg gui=NONE guibg=#282828 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=#cccccc guifg=#1e1e1e
    CSAHi lCursor term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=#cccccc guifg=#1e1e1e
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=3 ctermfg=fg gui=NONE guibg=#00ffff guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=10 gui=italic guibg=bg guifg=#99ff99
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=11 gui=NONE guibg=bg guifg=#99ffff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=9 gui=NONE guibg=bg guifg=#6699ff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=3 gui=NONE guibg=bg guifg=#33ffff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=14 gui=NONE guibg=bg guifg=#ffff99
    CSAHi NONE term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=13 gui=underline guibg=bg guifg=#99aaff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=0 gui=NONE guibg=bg guifg=#1e1e1e
    CSAHi Error term=reverse cterm=NONE ctermbg=12 ctermfg=15 gui=NONE guibg=#ff3333 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=14 ctermfg=1 gui=NONE guibg=#ffff33 guifg=#0000cc
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=13 gui=NONE guibg=bg guifg=#ff99ff
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=9 gui=bold guibg=bg guifg=#3366ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=11 gui=NONE guibg=bg guifg=#99ccff
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=9 gui=NONE guibg=bg guifg=#ff9966
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=12 gui=NONE guibg=bg guifg=#ff9999
    CSAHi VimSynMtchCchar term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=4 gui=NONE guibg=bg guifg=#ff3333
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=10 gui=bold guibg=bg guifg=#33ff33
    CSAHi StatusLine term=reverse,bold cterm=reverse,bold ctermbg=bg ctermfg=fg gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=NONE ctermbg=bg ctermfg=13 gui=bold guibg=bg guifg=#ff66ff
    CSAHi Visual term=reverse cterm=reverse ctermbg=0 ctermfg=fg gui=reverse guibg=#1e1e1e guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=6 gui=NONE guibg=bg guifg=#cccc00
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=14 ctermfg=0 gui=NONE guibg=#cccc00 guifg=#1e1e1e
    CSAHi Folded term=NONE cterm=NONE ctermbg=0 ctermfg=13 gui=italic guibg=#474747 guifg=#ffccff
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=0 ctermfg=11 gui=NONE guibg=#474747 guifg=#66ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=2 ctermfg=0 gui=NONE guibg=#1e331e guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=8 ctermfg=fg gui=NONE guibg=#282828 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=4 ctermfg=0 gui=NONE guibg=#331e1e guifg=#cccccc
    CSAHi DiffText term=reverse cterm=NONE ctermbg=6 ctermfg=0 gui=NONE guibg=#33331e guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=0 ctermfg=14 gui=NONE guibg=#474747 guifg=#ffff66
    CSAHi SpellBad term=reverse cterm=underline ctermbg=4 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=underline ctermbg=1 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=underline ctermbg=5 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=underline ctermbg=3 ctermfg=fg gui=undercurl guibg=bg guifg=fg guisp=#00ffff
endif

if 1
    delcommand CSAHi
endif
