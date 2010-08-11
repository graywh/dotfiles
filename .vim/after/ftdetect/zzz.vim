" ~/.vim/after/ftdetect/zzz.vim - Fallback filetype based on extension of file.
" Barry Arthur, 11 Aug 2010
" Only sets filetype if it hasn't already been set.
" Only sets filetype if a syntax/extension.vim file exists in runtimepath.

function! s:SetFiletypeFallback(file)
  let ext = expand(a:file.':e')
  if findfile('syntax/'.ext.'.vim', &rtp) != ''
    exe "setf " . ext
  endif
endfunction

au BufNewFile,BufRead * call <SID>SetFiletypeFallback('%')
