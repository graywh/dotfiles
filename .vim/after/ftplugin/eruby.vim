" Get the default 'comments' from CSS Erb templates
if expand('%:t:r:e') ==? 'css'
  unlet b:did_ftplugin
  runtime! ftplugin/css.vim ftplugin/css_*.vim ftplugin/css/*.vim
endif
