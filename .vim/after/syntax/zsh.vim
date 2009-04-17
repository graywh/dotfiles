syn region zshSubst matchgroup=zshSubstDelim start=/[$=<>](/ skip=/\\)/ end=/)/ transparent contains=TOP

hi link zshStringDelimiter Delimiter
