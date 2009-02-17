" Bart Trojanowski <bart@jukie.net>
"
" git:file.vim v0.1
"
" This will handle git show rev:file files when you open <branch>:<file> patterns.
" You can do both
"  $ vim HEAD~10:file
" and
"  :e branch:file
"
" Idea based on file:line.vim by Victor Bogado da Silva Lins.
"
" If you modify this file, please email me with your improvements.
"
" Install in ~/.vim/plugins/git:file.vim
"
" TODO:
"   - handle relative paths (right now you have to be at top of working dir)
"   - tab completion for :e (is that even possible?)
if &cp || exists("g:loaded_gitfile")
  finish
endif
let g:loaded_gitfile = "blah"
let s:cpo_save = &cpo
set cpo&vim

function s:GitFile()
  let buf = bufnr("%")
  let file = bufname("%")
  if !filereadable(file) && line('$')==1
    let cmd = "git show " . file
    exec 'sil r!LANG=C ' . cmd
    1 delete
    setlocal readonly nomodifiable buftype=nofile
  endif
endfunction

autocmd BufNewFile [^~/]*:*,[^~/]*:**/*,[^~/]**/*:*,[^~/]**/*:**/* call s:GitFile()

let &cpo = s:cpo_save
unlet s:cpo_save
