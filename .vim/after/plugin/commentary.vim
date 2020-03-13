if !exists("g:loaded_commentary") || !g:loaded_commentary || &cp
  finish
endif

if maparg('\\','n') ==# '' && maparg('\','n') ==# '' && get(g:, 'commentary_map_backslash', 1)
  nmap \\u <Plug>Commentary<Plug>Commentary
  nmap \\\ <Plug>CommentaryLine
  omap \\  <Plug>Commentary
  nmap \\  <Plug>Commentary
  xmap \\  <Plug>Commentary
endif
