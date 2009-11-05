syn match rubyInteger "\<\%(0[dD]\)\=\%(-\)\=\%(0\|[1-9]\d*\%(_\d\+\)*\)\>" display

syn match rubyRange "\<\%(0[dD]\)\=\%(-\)\=\%(0\|[1-9]\d*\%(_\d\+\)*\)\.\.\.\=\%(0[dD]\)\=\%(-\)\=\%(0\|[1-9]\d*\%(_\d\+\)*\)\>" display

hi link rubyRange Number
