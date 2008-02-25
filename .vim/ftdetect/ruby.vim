" Ruby
autocmd BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec	setfiletype ruby

" Ruby on Rails
autocmd BufNewFile,BufRead *.builder,*.rxml,*.rjs		setfiletype ruby

" Rakefile
autocmd BufNewFile,BufRead [rR]akefile,*.rake		setfiletype ruby

" Rantfile
autocmd BufNewFile,BufRead [rR]antfile,*.rant		setfiletype ruby

" eRuby
autocmd BufNewFile,BufRead *.erb,*.rhtml			setfiletype eruby
