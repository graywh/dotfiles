syn match  csIdentifier "@\w*"

syn region csBlock start="{" end="}" transparent fold

syn region csVerbatimString start=/@"/ skip=/""/ end=/"/ contains=csVerbatimSpec,@Spell
