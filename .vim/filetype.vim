augroup filetypedetect
    au BufNewFile,BufRead *.R,*.r   setf r
    au BufNewFile,BufRead *.Rhistory,*.rhistory     setf r
augroup END
