if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " Brew
  autocmd! BufNewFile,BufRead *.brew setfiletype brew
  " R
  autocmd! BufNewFile,BufRead *.R,*.r setfiletype r
  autocmd! BufNewFile,BufRead *.Rhistory,*.rhistory setfiletype r
augroup END
