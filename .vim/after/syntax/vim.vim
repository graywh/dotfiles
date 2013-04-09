syn case ignore
syn match	vimNotation	"\(\\\|<lt>\)\=<\([scamd]-\)\{0,4}scrollwheel\(up\|down\|left\|right\)>" contains=vimBracket
syn match	vimNotation	"\(\\\|<lt>\)\=<\([scamd]-\)\{0,4}mouse\(up\|down\)>" contains=vimBracket
syn match	vimNotation	"\(\\\|<lt>\)\=<\([scamd]-\)\{0,4}x[12]mouse>" contains=vimBracket
syn case match
