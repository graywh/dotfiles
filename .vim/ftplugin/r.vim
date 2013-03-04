if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1

setlocal fo-=t fo+=croql
setlocal comments=:# commentstring=#%s

let b:match_words = &matchpairs . ',\<if\>:\<else if\>:\<else\>,\<function\>:\<return\>'
let b:match_skip = 's:comment\|string\|character'

let b:undo_ftplugin = 'setlocal fo< com< cms< | unlet b:match_words b:match_skip'
