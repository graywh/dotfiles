if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect

  " Pattern used to match file names which should not be inspected.
  " Currently finds compressed files.
  if !exists("g:ft_ignore_pat")
    let g:ft_ignore_pat = '\.\(Z\|gz\|bz2\|zip\|tgz\)$'
  endif

  " Function used for patterns that end in a star: don't set the filetype if the
  " file name matches ft_ignore_pat.
  func! s:StarSetf(ft)
    if expand("<amatch>") !~ g:ft_ignore_pat
      exe 'setf ' . a:ft
    endif
  endfunc

  " R
  autocmd BufNewFile,BufRead *.r,*.R,*.s,*.S setfiletype r
  autocmd BufNewFile,BufRead *.rhistory,*.Rhistory setfiletype r

  " Mutt config
  autocmd BufNewFile,BufRead $HOME/.mutt/* call s:StarSetf('muttrc')

  " tmux config
  autocmd BufNewFile,BufRead $HOME/.tmux.conf setfiletype tmux

  " Apache conf.d
  autocmd BufNewFile,BufRead /etc/apache2/conf.d* call s:StarSetf('apache')

augroup END
