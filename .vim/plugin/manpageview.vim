if &cp || exists("g:loaded_manpageview")
 finish
endif
let g:loaded_manpageview = "v17g"
let no_man_maps = "blah"
let s:cpo_save = &cpo
let $MANPAGER=''
"let $PAGER=''
set cpo&vim

com! -nargs=* Man call s:ManPageView(<q-args>)

function s:GetArticle(topic)
  let file = (split(system("man -w ".a:topic." 2>/dev/null"), '\n') + [""])[0]
  let basename = substitute(file, '.*/', '', '')
  return matchlist(basename, '\(.\{-}\)\.\(.\{-}\)\(\.gz\)\=$')[1:2]
endfunction

function s:ManPageView(topic)
  let article = s:GetArticle(a:topic)
  if article == []
    echoerr "No article found matching \"" . a:topic . "\""
    return
  endif
  new
  exe 'sil! file!' escape(article[0].'('.article[1].')', ' \')
  setlocal noswapfile
  exe 'sil r!man' a:topic '| col -bx'
  sil 0d
  setlocal ro nomod bh=wipe ft=man nolist nonu nowrap bt=nofile
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
