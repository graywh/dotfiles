" This scheme was created by CSApproxSnapshot
" on Mon, 08 Mar 2010

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || &term =~? "^konsole"
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=253 gui=NONE guibg=#1c1c1c guifg=#d7d7d7
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#afafff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1c1c1c
    CSAHi Error term=reverse cterm=NONE ctermbg=210 ctermfg=231 gui=NONE guibg=#ff5f5f guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=228 ctermfg=20 gui=NONE guibg=#ffff5f guifg=#0000d7
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffafff
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#5f87ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#afd7ff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=234 ctermfg=239 gui=NONE guibg=#1c1c1c guifg=#4e4e4e
    CSAHi NonText term=bold cterm=NONE ctermbg=235 ctermfg=159 gui=NONE guibg=#262626 guifg=#87ffff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00afaf
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=234 ctermfg=160 gui=NONE guibg=#1c1c1c guifg=#d70000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=253 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=109 gui=bold guibg=bg guifg=#5faf87
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=187 gui=NONE guibg=#262626 guifg=#d7d7af
    CSAHi mailQuoted3 term=NONE cterm=NONE ctermbg=236 ctermfg=151 gui=NONE guibg=#303030 guifg=#afd7af
    CSAHi mailQuoted4 term=NONE cterm=NONE ctermbg=236 ctermfg=182 gui=NONE guibg=#303030 guifg=#d7afd7
    CSAHi mailQuoted5 term=NONE cterm=NONE ctermbg=236 ctermfg=152 gui=NONE guibg=#303030 guifg=#afd7d7
    CSAHi mailQuoted6 term=NONE cterm=NONE ctermbg=236 ctermfg=187 gui=NONE guibg=#303030 guifg=#d7d7af
    CSAHi mailEmail term=NONE cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#5f87ff
    CSAHi mailSignature term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8a8a8a
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=182 ctermfg=253 gui=NONE guibg=#d787d7 guifg=#d7d7d7
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=245 ctermfg=253 gui=NONE guibg=#878787 guifg=#d7d7d7
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=245 ctermfg=253 gui=NONE guibg=#878787 guifg=#d7d7d7
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=253 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=253 ctermfg=234 gui=NONE guibg=#d7d7d7 guifg=#1c1c1c
    CSAHi TabLineSel term=bold cterm=bold ctermbg=234 ctermfg=253 gui=bold guibg=#1c1c1c guifg=#d7d7d7
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=253 ctermfg=234 gui=reverse guibg=#1c1c1c guifg=#d7d7d7
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=253 ctermfg=234 gui=NONE guibg=#d7d7d7 guifg=#1c1c1c
    CSAHi mailQuoted2 term=NONE cterm=NONE ctermbg=236 ctermfg=181 gui=NONE guibg=#303030 guifg=#d7afaf
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ffaf87
    CSAHi mailQuoted1 term=NONE cterm=NONE ctermbg=236 ctermfg=146 gui=NONE guibg=#303030 guifg=#afafd7
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=#5fff5f
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=253 ctermfg=234 gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=253 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=253 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ff87ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=253 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#d7d700
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=184 ctermfg=234 gui=NONE guibg=#d7d700 guifg=#1c1c1c
    CSAHi Folded term=NONE cterm=NONE ctermbg=238 ctermfg=225 gui=italic guibg=#444444 guifg=#ffd7ff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=253 ctermfg=234 gui=NONE guibg=#d7d7d7 guifg=#1c1c1c
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#00afaf guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=157 gui=italic guibg=bg guifg=#afffaf
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ffafaf
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff5f5f
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#afffff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#87afff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#5fffff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#ffffaf
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=238 ctermfg=159 gui=NONE guibg=#444444 guifg=#87ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#123012 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#121230 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=253 gui=NONE guibg=#301212 guifg=#d7d7d7
    CSAHi DiffText term=reverse cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#303012 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=238 ctermfg=229 gui=NONE guibg=#444444 guifg=#ffff87
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=231 gui=NONE guibg=#1c1c1c guifg=#d7d7d7
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=189 gui=underline guibg=bg guifg=#afafff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1c1c1c
    CSAHi Error term=reverse cterm=NONE ctermbg=210 ctermfg=255 gui=NONE guibg=#ff5f5f guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=228 ctermfg=21 gui=NONE guibg=#ffff5f guifg=#0000d7
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=225 gui=NONE guibg=bg guifg=#ffafff
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=111 gui=bold guibg=bg guifg=#5f87ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#afd7ff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=234 ctermfg=239 gui=NONE guibg=#1c1c1c guifg=#4e4e4e
    CSAHi NonText term=bold cterm=NONE ctermbg=235 ctermfg=159 gui=NONE guibg=#262626 guifg=#87ffff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=44 gui=NONE guibg=bg guifg=#00afaf
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=234 ctermfg=196 gui=NONE guibg=#1c1c1c guifg=#d70000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=231 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=115 gui=bold guibg=bg guifg=#5faf87
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=230 gui=NONE guibg=#262626 guifg=#d7d7af
    CSAHi mailQuoted3 term=NONE cterm=NONE ctermbg=236 ctermfg=194 gui=NONE guibg=#303030 guifg=#afd7af
    CSAHi mailQuoted4 term=NONE cterm=NONE ctermbg=236 ctermfg=225 gui=NONE guibg=#303030 guifg=#d7afd7
    CSAHi mailQuoted5 term=NONE cterm=NONE ctermbg=236 ctermfg=195 gui=NONE guibg=#303030 guifg=#afd7d7
    CSAHi mailQuoted6 term=NONE cterm=NONE ctermbg=236 ctermfg=230 gui=NONE guibg=#303030 guifg=#d7d7af
    CSAHi mailEmail term=NONE cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#5f87ff
    CSAHi mailSignature term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8a8a8a
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=231 gui=NONE guibg=#d787d7 guifg=#d7d7d7
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=245 ctermfg=231 gui=NONE guibg=#878787 guifg=#d7d7d7
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=245 ctermfg=231 gui=NONE guibg=#878787 guifg=#d7d7d7
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=231 ctermfg=234 gui=NONE guibg=#d7d7d7 guifg=#1c1c1c
    CSAHi TabLineSel term=bold cterm=bold ctermbg=234 ctermfg=231 gui=bold guibg=#1c1c1c guifg=#d7d7d7
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=234 gui=reverse guibg=#1c1c1c guifg=#d7d7d7
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=234 gui=NONE guibg=#d7d7d7 guifg=#1c1c1c
    CSAHi mailQuoted2 term=NONE cterm=NONE ctermbg=236 ctermfg=224 gui=NONE guibg=#303030 guifg=#d7afaf
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffaf87
    CSAHi mailQuoted1 term=NONE cterm=NONE ctermbg=236 ctermfg=189 gui=NONE guibg=#303030 guifg=#afafd7
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=#5fff5f
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=231 ctermfg=234 gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=231 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=231 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ff87ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=231 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#d7d700
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=234 gui=NONE guibg=#d7d700 guifg=#1c1c1c
    CSAHi Folded term=NONE cterm=NONE ctermbg=238 ctermfg=231 gui=italic guibg=#444444 guifg=#ffd7ff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=234 gui=NONE guibg=#d7d7d7 guifg=#1c1c1c
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=44 ctermfg=fg gui=NONE guibg=#00afaf guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=194 gui=italic guibg=bg guifg=#afffaf
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#ffafaf
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#ff5f5f
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=195 gui=NONE guibg=bg guifg=#afffff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#87afff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#5fffff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#ffffaf
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=238 ctermfg=159 gui=NONE guibg=#444444 guifg=#87ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#123012 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#121230 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=231 gui=NONE guibg=#301212 guifg=#d7d7d7
    CSAHi DiffText term=reverse cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#303012 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=238 ctermfg=229 gui=NONE guibg=#444444 guifg=#ffff87
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=234 ctermfg=188 gui=NONE guibg=#1c1c1c guifg=#d7d7d7
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#afafff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=234 gui=NONE guibg=bg guifg=#1c1c1c
    CSAHi Error term=reverse cterm=NONE ctermbg=203 ctermfg=231 gui=NONE guibg=#ff5f5f guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=227 ctermfg=20 gui=NONE guibg=#ffff5f guifg=#0000d7
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ffafff
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=#5f87ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#afd7ff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=234 ctermfg=239 gui=NONE guibg=#1c1c1c guifg=#4e4e4e
    CSAHi NonText term=bold cterm=NONE ctermbg=235 ctermfg=123 gui=NONE guibg=#262626 guifg=#87ffff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00afaf
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=234 ctermfg=160 gui=NONE guibg=#1c1c1c guifg=#d70000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=188 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#5faf87
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=235 ctermfg=187 gui=NONE guibg=#262626 guifg=#d7d7af
    CSAHi mailQuoted3 term=NONE cterm=NONE ctermbg=236 ctermfg=151 gui=NONE guibg=#303030 guifg=#afd7af
    CSAHi mailQuoted4 term=NONE cterm=NONE ctermbg=236 ctermfg=182 gui=NONE guibg=#303030 guifg=#d7afd7
    CSAHi mailQuoted5 term=NONE cterm=NONE ctermbg=236 ctermfg=152 gui=NONE guibg=#303030 guifg=#afd7d7
    CSAHi mailQuoted6 term=NONE cterm=NONE ctermbg=236 ctermfg=187 gui=NONE guibg=#303030 guifg=#d7d7af
    CSAHi mailEmail term=NONE cterm=underline ctermbg=bg ctermfg=69 gui=underline guibg=bg guifg=#5f87ff
    CSAHi mailSignature term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8a8a8a
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=176 ctermfg=188 gui=NONE guibg=#d787d7 guifg=#d7d7d7
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=102 ctermfg=188 gui=NONE guibg=#878787 guifg=#d7d7d7
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=188 gui=NONE guibg=#878787 guifg=#d7d7d7
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=188 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=188 ctermfg=234 gui=NONE guibg=#d7d7d7 guifg=#1c1c1c
    CSAHi TabLineSel term=bold cterm=bold ctermbg=234 ctermfg=188 gui=bold guibg=#1c1c1c guifg=#d7d7d7
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=188 ctermfg=234 gui=reverse guibg=#1c1c1c guifg=#d7d7d7
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=188 ctermfg=234 gui=NONE guibg=#d7d7d7 guifg=#1c1c1c
    CSAHi mailQuoted2 term=NONE cterm=NONE ctermbg=236 ctermfg=181 gui=NONE guibg=#303030 guifg=#d7afaf
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#ffaf87
    CSAHi mailQuoted1 term=NONE cterm=NONE ctermbg=236 ctermfg=146 gui=NONE guibg=#303030 guifg=#afafd7
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#5fff5f
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=188 ctermfg=234 gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=188 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=188 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=213 gui=bold guibg=bg guifg=#ff87ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=188 ctermfg=234 gui=reverse guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#d7d700
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=184 ctermfg=234 gui=NONE guibg=#d7d700 guifg=#1c1c1c
    CSAHi Folded term=NONE cterm=NONE ctermbg=238 ctermfg=225 gui=italic guibg=#444444 guifg=#ffd7ff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=234 gui=NONE guibg=#d7d7d7 guifg=#1c1c1c
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#00afaf guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=157 gui=italic guibg=bg guifg=#afffaf
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ffafaf
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#ff5f5f
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#afffff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#87afff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#5fffff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#ffffaf
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=238 ctermfg=123 gui=NONE guibg=#444444 guifg=#87ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#123012 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#121230 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=188 gui=NONE guibg=#301212 guifg=#d7d7d7
    CSAHi DiffText term=reverse cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#303012 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=238 ctermfg=228 gui=NONE guibg=#444444 guifg=#ffff87
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=86 gui=NONE guibg=#1c1c1c guifg=#d7d7d7
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=59 gui=underline guibg=bg guifg=#afafff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=#1c1c1c
    CSAHi Error term=reverse cterm=NONE ctermbg=69 ctermfg=79 gui=NONE guibg=#ff5f5f guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=77 ctermfg=18 gui=NONE guibg=#ffff5f guifg=#0000d7
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#ffafff
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=39 gui=bold guibg=bg guifg=#5f87ff
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#afd7ff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=80 ctermfg=81 gui=NONE guibg=#1c1c1c guifg=#4e4e4e
    CSAHi NonText term=bold cterm=NONE ctermbg=80 ctermfg=47 gui=NONE guibg=#262626 guifg=#87ffff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#00afaf
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=80 ctermfg=48 gui=NONE guibg=#1c1c1c guifg=#d70000
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=86 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#ffff00 guifg=#000000
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=41 gui=bold guibg=bg guifg=#5faf87
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#262626 guifg=#d7d7af
    CSAHi mailQuoted3 term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#303030 guifg=#afd7af
    CSAHi mailQuoted4 term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#303030 guifg=#d7afd7
    CSAHi mailQuoted5 term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#303030 guifg=#afd7d7
    CSAHi mailQuoted6 term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#303030 guifg=#d7d7af
    CSAHi mailEmail term=NONE cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#5f87ff
    CSAHi mailSignature term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#8a8a8a
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=54 ctermfg=86 gui=NONE guibg=#d787d7 guifg=#d7d7d7
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=83 ctermfg=86 gui=NONE guibg=#878787 guifg=#d7d7d7
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=83 ctermfg=86 gui=NONE guibg=#878787 guifg=#d7d7d7
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=86 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=86 ctermfg=80 gui=NONE guibg=#d7d7d7 guifg=#1c1c1c
    CSAHi TabLineSel term=bold cterm=bold ctermbg=80 ctermfg=86 gui=bold guibg=#1c1c1c guifg=#d7d7d7
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=86 ctermfg=80 gui=reverse guibg=#1c1c1c guifg=#d7d7d7
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#262626 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=86 ctermfg=80 gui=NONE guibg=#d7d7d7 guifg=#1c1c1c
    CSAHi mailQuoted2 term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#303030 guifg=#d7afaf
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#ffaf87
    CSAHi mailQuoted1 term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#303030 guifg=#afafd7
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#5fff5f
    CSAHi StatusLine term=reverse,bold cterm=bold ctermbg=86 ctermfg=80 gui=reverse,bold guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=86 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=86 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=#ff87ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=86 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=56 gui=NONE guibg=bg guifg=#d7d700
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=56 ctermfg=80 gui=NONE guibg=#d7d700 guifg=#1c1c1c
    CSAHi Folded term=NONE cterm=NONE ctermbg=80 ctermfg=75 gui=italic guibg=#444444 guifg=#ffd7ff
    CSAHi lCursor term=NONE cterm=NONE ctermbg=86 ctermfg=80 gui=NONE guibg=#d7d7d7 guifg=#1c1c1c
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=26 ctermfg=fg gui=NONE guibg=#00afaf guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=62 gui=italic guibg=bg guifg=#afffaf
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#ffafaf
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ff5f5f
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=#afffff
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#87afff
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=47 gui=NONE guibg=bg guifg=#5fffff
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#ffffaf
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=80 ctermfg=47 gui=NONE guibg=#444444 guifg=#87ffff
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#123012 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#121230 guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=16 ctermfg=86 gui=NONE guibg=#301212 guifg=#d7d7d7
    CSAHi DiffText term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#303012 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=80 ctermfg=77 gui=NONE guibg=#444444 guifg=#ffff87
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=31 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
endif

if 1
    delcommand CSAHi
endif
