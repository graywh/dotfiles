syn match  csIdentifier "@\w*"

"syn region csBlock start="{" end="}" transparent fold
syn region csParams start="(" end=")" transparent fold

syn region csVerbatimString start=/@"/ skip=/""/ end=/"/ contains=csVerbatimSpec,@Spell

syn region csComment start="/\*" end="\*/" contains=@csCommentHook,csTodo,@Spell fold
