augroup filetypedetect
    au BufNewFile,BufRead *.R,*.r   setf r
    au BufNewFile,BufRead *.Rhistory,*.rhistory     setf r
    au BufNewFile,BufRead *.psp     setf psp
    au BufNewFile,BufRead *.rjs     setf ruby
augroup END
