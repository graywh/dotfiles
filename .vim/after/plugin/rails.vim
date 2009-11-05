autocmd User Rails/README Rlcd

autocmd User Rails setlocal softtabstop=8

autocmd User Rails Rnavcommand sass public/stylesheets/sass -glob=**/* -suffix=.sass

autocmd User Rails.migration*   nnoremap <silent> <buffer> <C-Left>  :A<CR>
autocmd User Rails.migration*   nnoremap <silent> <buffer> <C-Right> :R<CR>

autocmd User Rails.view.\(partial.\)\=erb*    syntax keyword erubyRailsHelperMethod error_messages submit contained containedin=@erubyRailsRegions
