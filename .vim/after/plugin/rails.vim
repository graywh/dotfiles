if !exists("g:loaded_rails") || !g:loaded_rails || &cp
  finish
endif

if exists(':function') == 2

  function! s:rails_gui_init()
    if filereadable(getcwd().'/config/environment.rb')
      silent! set columns=140 lines=60
    end
  endfunction

endif

if has('autocmd')
  augroup railsPluginAfter
    autocmd!

    if exists('*<SID>rails_gui_init')
      autocmd GUIEnter * call <SID>rails_gui_init()
    endif

    autocmd User Rails/README silent! Rlcd

    autocmd User Rails.migration* nnoremap <silent> <buffer> <C-Left>  :A<CR>
    autocmd User Rails.migration* nnoremap <silent> <buffer> <C-Right> :R<CR>

    autocmd User Rails.view.\(partial.\)\=\(erb\|haml\)*
          \ syntax keyword erubyRailsHelperMethod error_messages submit contained containedin=@erubyRailsRegions

  augroup END
endif
