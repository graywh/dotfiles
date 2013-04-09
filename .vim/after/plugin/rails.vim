if !exists("g:loaded_rails") || !g:loaded_rails || &cp
  finish
endif

let g:rails_projections = {
      \ 'app/models/*.rb': {'keywords': 'validates_conditional'},
      \ 'db/seeds/*.rb': {'command': 'seeds'},
      \ 'db/seeds.rb': {'command': 'seeds'},
      \ 'spec/factories.rb': {'command': 'factory'},
      \ 'spec/factories/*_factory.rb': {
      \   'command': 'factory',
      \   'affinity': 'model',
      \   'alternate': 'app/models/%s.rb',
      \   'related': 'db/schema.rb#%p',
      \   'test': 'spec/models/%s_spec.rb',
      \   'template': "FactoryGirl.define do\n  factory :%s do\n  end\nend",
      \   'keywords': 'factory sequence'
      \ },
      \ 'spec/factories/*.rb': {
      \   'command': 'factory',
      \   'affinity': 'collection',
      \   'alternate': 'app/models/%o.rb',
      \   'related': 'db/schema.rb#%s',
      \   'test': 'spec/models/%o_spec.rb',
      \   'template': "FactoryGirl.define do\n  factory :%o do\n  end\nend",
      \   'keywords': 'factory sequence'
      \ },
      \ 'spec/support/*.rb': {'command': 'support'},
      \ 'features/*.feature': {'command': 'feature'},
      \ 'features/step_definitions/*_steps.rb': {'command': 'steps'},
      \ 'features/support/*.rb': {'command': 'support'}}

if has('autocmd')
  augroup railsPluginAfter
    autocmd!

    autocmd GUIEnter *
          \   if filereadable(getcwd().'/config/environment.rb')
          \ |   silent! set columns=140 lines=60
          \ | end

    autocmd User Rails
          \   silent! Rlcd
          \ | silent! let &l:grepprg=substitute(&grepprg, '\$\*', '--exclude-dir=log --exclude-dir=tmp --exclude-dir=doc --exclude-dir=coverage \0', '')
          \ | command! -buffer -bang RRake Rake<bang> -
          \ | command! -buffer WA windo A
          \ | command! -buffer WR windo R

    autocmd User Rails
          \   if rails#buffer().relative() =~# '^db/migrate/.*.rb$'
          \ |   nnoremap <silent> <buffer> <C-Left>  :R<CR>
          \ |   nnoremap <silent> <buffer> <C-Right> :A<CR>
          \ | endif

    autocmd User Rails
          \   if rails#buffer().relative() =~# '^spec/.*_spec.rb$\|^features/.*.feature$'
          \ |   nnoremap <silent> <buffer> <Leader>R :.Rake<CR>
          \ | endif

  augroup END
endif
