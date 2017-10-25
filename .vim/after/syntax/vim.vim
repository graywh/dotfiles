syn case ignore
syn match	vimNotation	"\(\\\|<lt>\)\=<\([scamd]-\)\{0,4}scrollwheel\(up\|down\|left\|right\)>" contains=vimBracket
syn match	vimNotation	"\(\\\|<lt>\)\=<\([scamd]-\)\{0,4}mouse\(up\|down\)>" contains=vimBracket
syn match	vimNotation	"\(\\\|<lt>\)\=<\([scamd]-\)\{0,4}x[12]mouse>" contains=vimBracket
syn case match

" Highlight option-as-variable
syn match vimOptionVar "&\([gl]:\)\=\l*\>"
syn match vimOptionVar "&t_\(%[1i]\|#[24]\|@7\|*7\|&8\|A[BFL]\|C[SVeos]\|DL\|EI\|F[1-9]\|I[ES]\|K[13-9A-L]\|R[IV]\|S[Ibf]\|W[PS]\|Z[HR]\|al\|bc\|c[del]\|d[abl]\|fs\|k[1-9BDINPbdehlrsu]\|le\|m[bders]\|nd\|op\|s[eor]\|t[eis]\|u[est]\|v[beis]\|xs\)\>"
syn match vimOptionVar "&t_k;"
syn cluster vimOperGroup add=vimOptionVar
hi link vimOptionVar vimOption

syn clear vimLet
syn keyword vimLet let un[let] skipwhite nextgroup=vimVar,vimOptionVar,vimFuncVar
