syn match irssiHighlight "\<graywh\k*\>"
syn match irssiSelf "<[ @~&+]\=graywh\(_\+\||work\||mac\)>" contained

hi link irssiHighlight Underlined
hi link irssiSelf irssiNick_graywh
syn cluster irssiItems add=irssiSelf

hi link irssiNickRegion Statement
hi link irssiTimestamp None
