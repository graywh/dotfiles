setlocal iskeyword+=45

syn keyword cssColorProp contained filter opacity -moz-opacity -khtml-opacity

syn match cssFontProp contained "\<font\(-\(family\|style\|variant\|weight\|size\(-adjust\)\=\|stretch\)\>\)\="
syn match cssFontAttr contained "\<small\(-\(caps\|caption\)\>\)\="
