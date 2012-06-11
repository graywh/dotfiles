" For Ruby's 0d syntax for decimal numbers
" Necessary for highlighting decimal numbers with leading 0's
" syn match yamlNumber display '0d\d\+'
" And Ruby's 0o syntax for octal numbers
" syn match yamlNumber display '0o\o\+'
" hi def link yamlNumber Number

" Modified to allow leading 0's in the month and day parts of the timestamp
" syn match   yamlTimestamp       '\d\d\d\d-\%(1[0-2]\|\%[0]\d\)-\%(3[0-2]\|[12]\d\|\%[0]\d\)\%( \%([01]\d\|2[0-3]\):[0-5]\d:[0-5]\d.\d\d [+-]\%([01]\d\|2[0-3]\):[0-5]\d\|t\%([01]\d\|2[0-3]\):[0-5]\d:[0-5]\d.\d\d[+-]\%([01]\d\|2[0-3]\):[0-5]\d\|T\%([01]\d\|2[0-3]\):[0-5]\d:[0-5]\d.\dZ\)\=' contains=yamlTimestampOperator
" Timestamp separators for more highlighting options
" syn match yamlTimestampOperator '-\|:' contained
" hi def link yamlTimestampOperator Operator

setlocal iskeyword=@,65-90,45,48-57,_
