syntax match irssiHighlight "\<graywh\k*\>"
syntax match irssiSelf "<[ @~&+]\=graywh\(_\+\||work\||mac\)>" contained

highlight link irssiHighlight Underlined
highlight link irssiSelf irssiNick_graywh
syntax cluster irssiItems add=irssiSelf

highlight link irssiNickRegion Statement
highlight link irssiTimestamp None
