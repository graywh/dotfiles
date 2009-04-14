syn keyword htmlTagName contained nop highlight pre verbatim
hi link twikiSimpleVariable Identifier

if exists("g:twiki_highlight_r") && g:twiki_highlight_r != 0
  unlet b:current_syntax
  syn include @rLang syntax/r.vim
  syn region twikiHighlightR matchgroup=twikiTag start=/<highlight\( lang=r\)\=>/ keepend end=/<\/highlight>/ contains=@rLang
  let b:current_syntax = "twiki"
endif

if exists("g:twiki_highlight_perl") && g:twiki_highlight_perl != 0
  unlet b:current_syntax
  syn include @perlLang syntax/perl.vim
  syn region twikiHighlightPerl matchgroup=twikiTag start=/<highlight lang=perl>/ keepend end=/<\/highlight>/ contains=@perlLang
  let b:current_syntax = "twiki"
endif
