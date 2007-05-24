" DocStrings
syntax match   pythonDocString +):\n\+\s*"""\_.\{-}"""+hs=s+2 display contains=pythonTodo
syntax match   pythonDocString +):\n\+\s*'''\_.\{-}'''+hs=s+2 display contains=pythonTodo
syntax match   pythonDocString +\%^\n*"""\_.\{-}"""+ display contains=pythonTodo
syntax match   pythonDocString +\%^\n*'''\_.\{-}'''+ display contains=pythonTodo

syntax sync linebreaks=1

highlight link pythonDocString Comment
