silent! let &l:grepprg=substitute(&grepprg, '\$\*', '--exclude-dir=log --exclude-dir=tmp --exclude-dir=doc --exclude-dir=coverage \0', '')

setlocal softtabstop=8

Rnavcommand seeds   db/                       -glob=                      -default=seeds
Rnavcommand sass    public/stylesheets/sass   -glob=* -suffix=.sass
Rnavcommand factory spec/factories            -glob=* -suffix=_factory.rb -default=model()
Rnavcommand feature features                  -glob=* -suffix=.feature
Rnavcommand steps   features/step_definitions -glob=* -suffix=_steps.rb
Rnavcommand support features/support          -glob=*
