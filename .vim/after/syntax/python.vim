" DocStrings
syn match   pythonDocString +):\n\+\s*"""\_.\{-}"""+hs=s+2 display contains=pythonTodo
syn match   pythonDocString +):\n\+\s*'''\_.\{-}'''+hs=s+2 display contains=pythonTodo
syn match   pythonDocString +\%^\n*"""\_.\{-}"""+ display contains=pythonTodo
syn match   pythonDocString +\%^\n*'''\_.\{-}'''+ display contains=pythonTodo

syn sync linebreaks=1

hi link pythonDocString Comment
