" This scheme was created by CSApproxSnapshot
" on Thu, 24 Oct 2024

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

function! s:old_kde()
  " Konsole only used its own palette up til KDE 4.2.0
  if executable('kde4-config') && system('kde4-config --kde-version') =~ '^4.[10].'
    return 1
  elseif executable('kde-config') && system('kde-config --version') =~# 'KDE: 3.'
    return 1
  else
    return 0
  endif
endfunction

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || (&term =~? "^konsole" && s:old_kde())
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=253 gui=NONE guibg=#262626 guifg=#DADADA
    CSAHi helpNormal term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi helpGraphic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=253 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=253 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#00AFAF guifg=fg
    CSAHi ToolbarLine term=underline cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=Grey50 guifg=fg
    CSAHi ToolbarButton term=NONE cterm=bold ctermbg=252 ctermfg=16 gui=bold guibg=LightGrey guifg=Black
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=157 gui=italic guibg=bg guifg=#AFFFAF
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#FFAFAF
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#FF5F5F
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#AFFFFF
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=235 ctermfg=239 gui=NONE guibg=bg guifg=#4E4E4E
    CSAHi NonText term=bold cterm=NONE ctermbg=236 ctermfg=123 gui=NONE guibg=#303030 guifg=#87FFFF
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00AFAF
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=235 ctermfg=160 gui=NONE guibg=bg guifg=#D70000
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=235 gui=NONE guibg=#FFFF00 guifg=bg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#5FAF87
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi mailQuoted6 term=NONE cterm=NONE ctermbg=238 ctermfg=187 gui=NONE guibg=#444444 guifg=#D7D7AF
    CSAHi mailEmail term=NONE cterm=underline ctermbg=bg ctermfg=69 gui=underline guibg=bg guifg=#5F87FF
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#FFAFFF
    CSAHi DiffText term=reverse cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#4E4E1C guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=236 ctermfg=80 gui=NONE guibg=#303030 guifg=#5FD7D7
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#FF0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000FF
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#FF00FF
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00FFFF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=176 ctermfg=253 gui=NONE guibg=#D787D7 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=102 ctermfg=253 gui=NONE guibg=#878787 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=253 gui=NONE guibg=#878787 guifg=fg
    CSAHi helpLeadBlank term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#87AFFF
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#AFFFFF
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#FFFFAF
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#AFAFFF
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=235 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=203 ctermfg=231 gui=NONE guibg=#FF5F5F guifg=#FFFFFF
    CSAHi Todo term=NONE cterm=NONE ctermbg=227 ctermfg=20 gui=NONE guibg=#FFFF5F guifg=#0000D7
    CSAHi LineNr term=underline cterm=NONE ctermbg=236 ctermfg=101 gui=NONE guibg=#303030 guifg=#87875F
    CSAHi LineNrAbove term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi LineNrBelow term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=237 ctermfg=144 gui=bold guibg=#3A3A3A guifg=#AFAF87
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#5FFF5F
    CSAHi StatusLine term=bold,reverse cterm=bold,reverse ctermbg=bg ctermfg=fg gui=bold,reverse guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi mailSignature term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8A8A8A
    CSAHi colorIndentOdd term=NONE cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#202020 guifg=fg
    CSAHi colorIndentEven term=NONE cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#303030 guifg=fg
    CSAHi mailQuoted1 term=NONE cterm=NONE ctermbg=238 ctermfg=146 gui=NONE guibg=#444444 guifg=#AFAFD7
    CSAHi mailQuoted2 term=NONE cterm=NONE ctermbg=238 ctermfg=181 gui=NONE guibg=#444444 guifg=#D7AFAF
    CSAHi mailQuoted3 term=NONE cterm=NONE ctermbg=238 ctermfg=151 gui=NONE guibg=#444444 guifg=#AFD7AF
    CSAHi mailQuoted4 term=NONE cterm=NONE ctermbg=238 ctermfg=182 gui=NONE guibg=#444444 guifg=#D7AFD7
    CSAHi PmenuThumb term=NONE cterm=reverse ctermbg=bg ctermfg=231 gui=reverse guibg=White guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=253 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=235 ctermfg=253 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=253 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=237 ctermfg=fg gui=NONE guibg=#3A3A3A guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=#870000 guifg=fg
    CSAHi StatusLineTerm term=bold,reverse cterm=bold ctermbg=120 ctermfg=235 gui=bold guibg=LightGreen guifg=bg
    CSAHi StatusLineTermNC term=reverse cterm=NONE ctermbg=120 ctermfg=235 gui=NONE guibg=LightGreen guifg=bg
    CSAHi mailQuoted5 term=NONE cterm=NONE ctermbg=238 ctermfg=152 gui=NONE guibg=#444444 guifg=#AFD7D7
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=#5F87FF
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#AFD7FF
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#FFAF87
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=213 gui=bold guibg=bg guifg=#FF87FF
    CSAHi Visual term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#D7D700
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=184 ctermfg=235 gui=NONE guibg=#D7D700 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=237 ctermfg=139 gui=italic guibg=#3A3A3A guifg=#AF87AF
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=237 ctermfg=66 gui=NONE guibg=#3A3A3A guifg=#5F8787
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#1C3A1C guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#1C264E guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=253 gui=NONE guibg=#3A1C1C guifg=fg
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=253 gui=NONE guibg=#262626 guifg=#DADADA
    CSAHi helpNormal term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi helpGraphic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=253 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=253 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#00AFAF guifg=fg
    CSAHi ToolbarLine term=underline cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=Grey50 guifg=fg
    CSAHi ToolbarButton term=NONE cterm=bold ctermbg=252 ctermfg=16 gui=bold guibg=LightGrey guifg=Black
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=157 gui=italic guibg=bg guifg=#AFFFAF
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#FFAFAF
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#FF5F5F
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#AFFFFF
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=235 ctermfg=239 gui=NONE guibg=bg guifg=#4E4E4E
    CSAHi NonText term=bold cterm=NONE ctermbg=236 ctermfg=123 gui=NONE guibg=#303030 guifg=#87FFFF
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00AFAF
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=235 ctermfg=160 gui=NONE guibg=bg guifg=#D70000
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=235 gui=NONE guibg=#FFFF00 guifg=bg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#5FAF87
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi mailQuoted6 term=NONE cterm=NONE ctermbg=238 ctermfg=187 gui=NONE guibg=#444444 guifg=#D7D7AF
    CSAHi mailEmail term=NONE cterm=underline ctermbg=bg ctermfg=69 gui=underline guibg=bg guifg=#5F87FF
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#FFAFFF
    CSAHi DiffText term=reverse cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#4E4E1C guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=236 ctermfg=80 gui=NONE guibg=#303030 guifg=#5FD7D7
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#FF0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000FF
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#FF00FF
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00FFFF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=176 ctermfg=253 gui=NONE guibg=#D787D7 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=102 ctermfg=253 gui=NONE guibg=#878787 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=253 gui=NONE guibg=#878787 guifg=fg
    CSAHi helpLeadBlank term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#87AFFF
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#AFFFFF
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#FFFFAF
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#AFAFFF
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=235 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=203 ctermfg=231 gui=NONE guibg=#FF5F5F guifg=#FFFFFF
    CSAHi Todo term=NONE cterm=NONE ctermbg=227 ctermfg=20 gui=NONE guibg=#FFFF5F guifg=#0000D7
    CSAHi LineNr term=underline cterm=NONE ctermbg=236 ctermfg=101 gui=NONE guibg=#303030 guifg=#87875F
    CSAHi LineNrAbove term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi LineNrBelow term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=237 ctermfg=144 gui=bold guibg=#3A3A3A guifg=#AFAF87
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#5FFF5F
    CSAHi StatusLine term=bold,reverse cterm=bold,reverse ctermbg=bg ctermfg=fg gui=bold,reverse guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi mailSignature term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8A8A8A
    CSAHi colorIndentOdd term=NONE cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#202020 guifg=fg
    CSAHi colorIndentEven term=NONE cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#303030 guifg=fg
    CSAHi mailQuoted1 term=NONE cterm=NONE ctermbg=238 ctermfg=146 gui=NONE guibg=#444444 guifg=#AFAFD7
    CSAHi mailQuoted2 term=NONE cterm=NONE ctermbg=238 ctermfg=181 gui=NONE guibg=#444444 guifg=#D7AFAF
    CSAHi mailQuoted3 term=NONE cterm=NONE ctermbg=238 ctermfg=151 gui=NONE guibg=#444444 guifg=#AFD7AF
    CSAHi mailQuoted4 term=NONE cterm=NONE ctermbg=238 ctermfg=182 gui=NONE guibg=#444444 guifg=#D7AFD7
    CSAHi PmenuThumb term=NONE cterm=reverse ctermbg=bg ctermfg=231 gui=reverse guibg=White guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=253 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=235 ctermfg=253 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=253 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=237 ctermfg=fg gui=NONE guibg=#3A3A3A guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=#870000 guifg=fg
    CSAHi StatusLineTerm term=bold,reverse cterm=bold ctermbg=120 ctermfg=235 gui=bold guibg=LightGreen guifg=bg
    CSAHi StatusLineTermNC term=reverse cterm=NONE ctermbg=120 ctermfg=235 gui=NONE guibg=LightGreen guifg=bg
    CSAHi mailQuoted5 term=NONE cterm=NONE ctermbg=238 ctermfg=152 gui=NONE guibg=#444444 guifg=#AFD7D7
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=#5F87FF
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#AFD7FF
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#FFAF87
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=213 gui=bold guibg=bg guifg=#FF87FF
    CSAHi Visual term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#D7D700
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=184 ctermfg=235 gui=NONE guibg=#D7D700 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=237 ctermfg=139 gui=italic guibg=#3A3A3A guifg=#AF87AF
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=237 ctermfg=66 gui=NONE guibg=#3A3A3A guifg=#5F8787
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#1C3A1C guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#1C264E guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=253 gui=NONE guibg=#3A1C1C guifg=fg
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=235 ctermfg=253 gui=NONE guibg=#262626 guifg=#DADADA
    CSAHi helpNormal term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi helpGraphic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=253 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=253 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#00AFAF guifg=fg
    CSAHi ToolbarLine term=underline cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=Grey50 guifg=fg
    CSAHi ToolbarButton term=NONE cterm=bold ctermbg=252 ctermfg=16 gui=bold guibg=LightGrey guifg=Black
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=157 gui=italic guibg=bg guifg=#AFFFAF
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#FFAFAF
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=203 gui=NONE guibg=bg guifg=#FF5F5F
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#AFFFFF
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=235 ctermfg=239 gui=NONE guibg=bg guifg=#4E4E4E
    CSAHi NonText term=bold cterm=NONE ctermbg=236 ctermfg=123 gui=NONE guibg=#303030 guifg=#87FFFF
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#00AFAF
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=235 ctermfg=160 gui=NONE guibg=bg guifg=#D70000
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=226 ctermfg=235 gui=NONE guibg=#FFFF00 guifg=bg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#5FAF87
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi mailQuoted6 term=NONE cterm=NONE ctermbg=238 ctermfg=187 gui=NONE guibg=#444444 guifg=#D7D7AF
    CSAHi mailEmail term=NONE cterm=underline ctermbg=bg ctermfg=69 gui=underline guibg=bg guifg=#5F87FF
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#FFAFFF
    CSAHi DiffText term=reverse cterm=NONE ctermbg=58 ctermfg=fg gui=NONE guibg=#4E4E1C guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=236 ctermfg=80 gui=NONE guibg=#303030 guifg=#5FD7D7
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#FF0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000FF
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#FF00FF
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00FFFF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=176 ctermfg=253 gui=NONE guibg=#D787D7 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=102 ctermfg=253 gui=NONE guibg=#878787 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=102 ctermfg=253 gui=NONE guibg=#878787 guifg=fg
    CSAHi helpLeadBlank term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#87AFFF
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#AFFFFF
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=229 gui=NONE guibg=bg guifg=#FFFFAF
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#AFAFFF
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=235 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=203 ctermfg=231 gui=NONE guibg=#FF5F5F guifg=#FFFFFF
    CSAHi Todo term=NONE cterm=NONE ctermbg=227 ctermfg=20 gui=NONE guibg=#FFFF5F guifg=#0000D7
    CSAHi LineNr term=underline cterm=NONE ctermbg=236 ctermfg=101 gui=NONE guibg=#303030 guifg=#87875F
    CSAHi LineNrAbove term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi LineNrBelow term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=237 ctermfg=144 gui=bold guibg=#3A3A3A guifg=#AFAF87
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#5FFF5F
    CSAHi StatusLine term=bold,reverse cterm=bold,reverse ctermbg=bg ctermfg=fg gui=bold,reverse guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi mailSignature term=NONE cterm=NONE ctermbg=bg ctermfg=245 gui=NONE guibg=bg guifg=#8A8A8A
    CSAHi colorIndentOdd term=NONE cterm=NONE ctermbg=234 ctermfg=fg gui=NONE guibg=#202020 guifg=fg
    CSAHi colorIndentEven term=NONE cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#303030 guifg=fg
    CSAHi mailQuoted1 term=NONE cterm=NONE ctermbg=238 ctermfg=146 gui=NONE guibg=#444444 guifg=#AFAFD7
    CSAHi mailQuoted2 term=NONE cterm=NONE ctermbg=238 ctermfg=181 gui=NONE guibg=#444444 guifg=#D7AFAF
    CSAHi mailQuoted3 term=NONE cterm=NONE ctermbg=238 ctermfg=151 gui=NONE guibg=#444444 guifg=#AFD7AF
    CSAHi mailQuoted4 term=NONE cterm=NONE ctermbg=238 ctermfg=182 gui=NONE guibg=#444444 guifg=#D7AFD7
    CSAHi PmenuThumb term=NONE cterm=reverse ctermbg=bg ctermfg=231 gui=reverse guibg=White guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=253 ctermfg=235 gui=NONE guibg=fg guifg=bg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=235 ctermfg=253 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=253 ctermfg=235 gui=reverse guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=237 ctermfg=fg gui=NONE guibg=#3A3A3A guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=#870000 guifg=fg
    CSAHi StatusLineTerm term=bold,reverse cterm=bold ctermbg=120 ctermfg=235 gui=bold guibg=LightGreen guifg=bg
    CSAHi StatusLineTermNC term=reverse cterm=NONE ctermbg=120 ctermfg=235 gui=NONE guibg=LightGreen guifg=bg
    CSAHi mailQuoted5 term=NONE cterm=NONE ctermbg=238 ctermfg=152 gui=NONE guibg=#444444 guifg=#AFD7D7
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=69 gui=bold guibg=bg guifg=#5F87FF
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#AFD7FF
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#FFAF87
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=213 gui=bold guibg=bg guifg=#FF87FF
    CSAHi Visual term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=NONE guibg=bg guifg=#D7D700
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=184 ctermfg=235 gui=NONE guibg=#D7D700 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=237 ctermfg=139 gui=italic guibg=#3A3A3A guifg=#AF87AF
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=237 ctermfg=66 gui=NONE guibg=#3A3A3A guifg=#5F8787
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=22 ctermfg=fg gui=NONE guibg=#1C3A1C guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#1C264E guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=52 ctermfg=253 gui=NONE guibg=#3A1C1C guifg=fg
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=80 ctermfg=86 gui=NONE guibg=#262626 guifg=#DADADA
    CSAHi helpNormal term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi helpGraphic term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=86 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=86 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=26 ctermfg=fg gui=NONE guibg=#00AFAF guifg=fg
    CSAHi ToolbarLine term=underline cterm=NONE ctermbg=82 ctermfg=fg gui=NONE guibg=Grey50 guifg=fg
    CSAHi ToolbarButton term=NONE cterm=bold ctermbg=86 ctermfg=16 gui=bold guibg=LightGrey guifg=Black
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=62 gui=italic guibg=bg guifg=#AFFFAF
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=74 gui=NONE guibg=bg guifg=#FFAFAF
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#FF5F5F
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=#AFFFFF
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=80 ctermfg=81 gui=NONE guibg=bg guifg=#4E4E4E
    CSAHi NonText term=bold cterm=NONE ctermbg=80 ctermfg=47 gui=NONE guibg=#303030 guifg=#87FFFF
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#00AFAF
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=80 ctermfg=48 gui=NONE guibg=bg guifg=#D70000
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=76 ctermfg=80 gui=NONE guibg=#FFFF00 guifg=bg
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=41 gui=bold guibg=bg guifg=#5FAF87
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi mailQuoted6 term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#444444 guifg=#D7D7AF
    CSAHi mailEmail term=NONE cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#5F87FF
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=75 gui=NONE guibg=bg guifg=#FFAFFF
    CSAHi DiffText term=reverse cterm=NONE ctermbg=36 ctermfg=fg gui=NONE guibg=#4E4E1C guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=80 ctermfg=42 gui=NONE guibg=#303030 guifg=#5FD7D7
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#FF0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=#0000FF
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#FF00FF
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=31 gui=undercurl guibg=bg guifg=fg guisp=#00FFFF
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=54 ctermfg=86 gui=NONE guibg=#D787D7 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=83 ctermfg=86 gui=NONE guibg=#878787 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=83 ctermfg=86 gui=NONE guibg=#878787 guifg=fg
    CSAHi helpLeadBlank term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#87AFFF
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=63 gui=NONE guibg=bg guifg=#AFFFFF
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#FFFFAF
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=59 gui=underline guibg=bg guifg=#AFAFFF
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=80 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=69 ctermfg=79 gui=NONE guibg=#FF5F5F guifg=#FFFFFF
    CSAHi Todo term=NONE cterm=NONE ctermbg=77 ctermfg=18 gui=NONE guibg=#FFFF5F guifg=#0000D7
    CSAHi LineNr term=underline cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#303030 guifg=#87875F
    CSAHi LineNrAbove term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi LineNrBelow term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=80 ctermfg=57 gui=bold guibg=#3A3A3A guifg=#AFAF87
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#5FFF5F
    CSAHi StatusLine term=bold,reverse cterm=bold,reverse ctermbg=bg ctermfg=fg gui=bold,reverse guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi mailSignature term=NONE cterm=NONE ctermbg=bg ctermfg=83 gui=NONE guibg=bg guifg=#8A8A8A
    CSAHi colorIndentOdd term=NONE cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#202020 guifg=fg
    CSAHi colorIndentEven term=NONE cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#303030 guifg=fg
    CSAHi mailQuoted1 term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#444444 guifg=#AFAFD7
    CSAHi mailQuoted2 term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#444444 guifg=#D7AFAF
    CSAHi mailQuoted3 term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#444444 guifg=#AFD7AF
    CSAHi mailQuoted4 term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#444444 guifg=#D7AFD7
    CSAHi PmenuThumb term=NONE cterm=reverse ctermbg=bg ctermfg=79 gui=reverse guibg=White guifg=fg
    CSAHi TabLine term=underline cterm=NONE ctermbg=86 ctermfg=80 gui=NONE guibg=fg guifg=bg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=80 ctermfg=86 gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=86 ctermfg=80 gui=reverse guibg=bg guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#3A3A3A guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=#870000 guifg=fg
    CSAHi StatusLineTerm term=bold,reverse cterm=bold ctermbg=45 ctermfg=80 gui=bold guibg=LightGreen guifg=bg
    CSAHi StatusLineTermNC term=reverse cterm=NONE ctermbg=45 ctermfg=80 gui=NONE guibg=LightGreen guifg=bg
    CSAHi mailQuoted5 term=NONE cterm=NONE ctermbg=80 ctermfg=58 gui=NONE guibg=#444444 guifg=#AFD7D7
    CSAHi Boolean term=NONE cterm=bold ctermbg=bg ctermfg=39 gui=bold guibg=bg guifg=#5F87FF
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#AFD7FF
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#FFAF87
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=71 gui=bold guibg=bg guifg=#FF87FF
    CSAHi Visual term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=56 gui=NONE guibg=bg guifg=#D7D700
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=56 ctermfg=80 gui=NONE guibg=#D7D700 guifg=bg
    CSAHi Folded term=NONE cterm=NONE ctermbg=80 ctermfg=54 gui=italic guibg=#3A3A3A guifg=#AF87AF
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=80 ctermfg=37 gui=NONE guibg=#3A3A3A guifg=#5F8787
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=80 ctermfg=fg gui=NONE guibg=#1C3A1C guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#1C264E guifg=fg
    CSAHi DiffDelete term=bold cterm=NONE ctermbg=80 ctermfg=86 gui=NONE guibg=#3A1C1C guifg=fg
endif

if 1
    delcommand CSAHi
endif
