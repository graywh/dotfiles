if !exists("g:loaded_surround") || !g:loaded_surround || &cp
  finish
endif

if has('autocmd')
  augroup surroundPluginAfter
    autocmd!

    autocmd FileType eruby,php,brew let b:surround_{char2nr("-")} = "<% \r %>"
    autocmd FileType eruby,php,brew let b:surround_{char2nr("=")} = "<%= \r %>"

  augroup END
endif
