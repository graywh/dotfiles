augroup filetypedetect
  " R
  autocmd BufNewFile,BufRead *.R,*.r   setfiletype r
  autocmd BufNewFile,BufRead *.Rhistory,*.rhistory     setfiletype r
  " Mako
  autocmd BufNewFile,BufRead *.mako   setfiletype mako
augroup END
