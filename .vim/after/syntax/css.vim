" My CSS3 additions

syn match cssFontProp contained /\<font\(-\(family\|style\|variant\|weight\|size\(-adjust\)\=\|stretch\)\>\)\=/
syn match cssFontAttr contained /\<small\(-\(caps\|caption\)\>\)\=/

syn keyword cssColorProp contained filter
syn match cssColorProp contained /\<\(-\(moz\|webkit\|khtml\)-\)\=opacity\>/

syn keyword cssTextProp contained word-wrap text-overflow

syn match cssBoxProp contained /\<\(-\(moz\|webkit\)-\)\=box-shadow\>/
syn match cssBoxProp contained /\<\(-webkit-\)\=border\(-\(top\|bottom\)-\(left\|right\)\)\=-radius\>/
syn match cssBoxProp contained /\<-moz-border-radius\(-\(top\|bottom\)\(left\|right\)\)\=\>/
syn match cssBoxProp contained /\<\(-\(moz\|webkit\)-\)\=box-sizing\>/
syn match cssBoxAttr contained /\<content-box\|border-box\|inherit\>/

syn keyword cssRenderAttr contained none list-item run-in table inherit
syn match cssRenderAttr contained /inline-\(block\|table\)/
