augroup filetypedetect
    au BufNewFile,BufRead *.R,*.r   setf r
    au BufNewFile,BufRead *.Rhistory,*.rhistory     setf r
    au BufNewFile,BufRead *.psp     setf psp
augroup END
