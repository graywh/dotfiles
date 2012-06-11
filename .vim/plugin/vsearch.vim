" vsearch.vim
" Visual mode search
function! s:VSetSearch(bound)
  let temp = @@
  norm! gvy
  let @/ = substitute(escape(@@, '\'), '\n', '\\n', 'g')
  " Use this line instead of the above to match matches spanning across lines
  " let @/ = substitute(escape(@@, '\'), '\_s\+', '\\_s\\+', 'g')
  if a:bound
    let @/ = '\<' . @/ . '\>'
  endif
  let @/ = '\V' . @/
  call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
  let @@ = temp
endfunction

xnoremap <silent> * :<C-u>call <SID>VSetSearch(1)<CR>/<CR>
xnoremap <silent> # :<C-u>call <SID>VSetSearch(1)<CR>?<CR>
xnoremap <silent> g* :<C-u>call <SID>VSetSearch(0)<CR>/<CR>
xnoremap <silent> g# :<C-u>call <SID>VSetSearch(0)<CR>?<CR>
