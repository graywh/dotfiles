augroup filetypedetect
  " R
  autocmd! BufNewFile,BufRead *.R,*.r setfiletype r
  autocmd! BufNewFile,BufRead *.Rhistory,*.rhistory setfiletype r
augroup END
