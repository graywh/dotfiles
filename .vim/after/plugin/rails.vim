if !exists("g:loaded_rails") || !g:loaded_rails || &cp
  finish
endif

let g:rails_projections = {
      \ 'app/decorators/*_decorator.rb': {'command': 'decorator'},
      \ 'app/interactors/*.rb': {
      \   'affinity': 'model',
      \   'command': 'interactor',
      \   'test': [
      \     'test/unit/%s_test.rb',
      \     'spec/interactors/%s_spec.rb']},
      \ 'db/seeds/*.rb': {'command': 'seeds'},
      \ 'db/seeds.rb': {'command': 'seeds'}}

let g:rails_gem_projections = {
      \ 'aasm': {
      \   'app/models/*.rb': {
      \     'keywords': 'aasm_column aasm_initial_state aasm_state aasm_event'}},
      \ 'authlogic': {
      \   'app/models/*.rb': {
      \     'keywords': 'acts_as_authentic'}},
      \ 'cancan': {
      \   'app/controllers/*.rb': {
      \     'keywords': 'load_and_authorize_resource load_resource authorize_resource skip_load_and_authorize_resource skip_load_resource skip_authorize_resource check_authorization skip_authorization_check authorize!'},
      \   'app/models/*.rb': {
      \     'keywords': 'can cannot'},
      \   'app/views/*': {
      \     'keywords': 'can? cannot?'}},
      \ 'conditional_validation': {
      \   'app/models/*.rb': {
      \     'keywords': 'validates_conditional'}},
      \ 'cqs_form_helpers': {
      \   'app/views/*': {
      \     'keywords': 'select_with_options'}},
      \ 'cqs_validations': {
      \   'app/models/*.rb': {
      \     'keywords': 'validates_date validates_continuity_of'}},
      \ 'cucumber-rails': {
      \   'features/*.feature': {
      \     'command': 'feature'},
      \   'features/step_definitions/*_steps.rb': {
      \     'command': 'steps'},
      \   'features/support/*.rb': {
      \     'command': 'support'}},
      \ 'devise': {
      \   'app/models/*.rb': {
      \     'keywords': 'devise'}},
      \ 'factory_girl': {
      \   'spec/factories.rb': {
      \     'command': 'factory'},
      \   'spec/factories/*_factory.rb': {
      \     'command': 'factory',
      \     'affinity': 'model',
      \     'alternate': 'app/models/%s.rb',
      \     'related': 'db/schema.rb#%p',
      \     'test': 'spec/models/%s_spec.rb',
      \     'template': "FactoryGirl.define do\n  factory :%s do\n  end\nend",
      \     'keywords': 'factory sequence'},
      \   'spec/factories/*.rb': {
      \     'command': 'factory',
      \     'affinity': 'collection',
      \     'alternate': 'app/models/%o.rb',
      \     'related': 'db/schema.rb#%s',
      \     'test': 'spec/models/%o_spec.rb',
      \     'template': "FactoryGirl.define do\n  factory :%o do\n  end\nend",
      \     'keywords': 'factory sequence'}},
      \ 'paperclip': {
      \   'app/models/*.rb': {
      \     'keywords': 'has_attached_file'}},
      \ 'paranoia': {
      \   'app/models/*.rb': {
      \     'keywords': 'acts_as_paranoid'}},
      \ 'radio_array': {
      \   'app/views/*': {
      \     'keywords': 'radio_array'}},
      \ 'rspec-core': {
      \   'spec/support/*.rb': {
      \     'command': 'support'}},
      \ 'save_as_draft': {
      \   'app/views/*': {
      \     'keywords': 'savable_as_draft'},
      \   'app/models/*.rb': {
      \     'keywords': 'savable_as_draft'}},
      \ 'soft_validations': {
      \   'app/models/*.rb': {
      \     'keywords': 'softy'}},
      \ 'userstamp': {
      \   'app/models/*.rb': {
      \     'keywords': 'stampable model_stamper'}}}

if has('autocmd')
  augroup railsPluginAfter
    autocmd!

    autocmd GUIEnter *
          \   if filereadable(getcwd().'/config/environment.rb')
          \ |   silent! set columns=140 lines=60
          \ | end

    autocmd User Rails
          \   silent! Rlcd
          \
          \ | exec 'command! -buffer -bang RRake Rake<bang> -'
          \ | exec 'command! -buffer WA windo A'
          \ | exec 'command! -buffer WR windo R'
          \ | exec 'command! -buffer Console   Start -title=console rails console'
          \ | exec 'command! -buffer Dbconsole Start -title=mysql rails db -p'
          \ | exec 'command! -buffer Log       Start -title=log tail -f log/development.log'
          \
          \ | if rails#buffer().relative() =~# '^db/migrate/.*.rb$'
          \ |   nnoremap <silent> <buffer> <C-Left>  :1R<CR>
          \ |   nnoremap <silent> <buffer> <C-Right> :$R<CR>
          \ | endif
          \
          \ | if rails#buffer().relative() =~# '^spec/.*_spec.rb$\|^features/.*.feature$'
          \ |   nnoremap <silent> <buffer> <Leader>R :.Rake<CR>
          \ | endif
          \
          \ | " silent! let &l:grepprg=substitute(&grepprg, '\$\*', '--exclude-dir=log --exclude-dir=tmp --exclude-dir=doc --exclude-dir=coverage \0', '')

  augroup END
endif
