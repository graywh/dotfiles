syntax sync fromstart

" Add self to keywords {{{1
syntax keyword pythonSelf self
highlight link pythonSelf Constant
" }}}1

" Add some operators {{{1
syn keyword pythonOperator + - / % = :
" }}}1

" Add DocString highlighting {{{1
syn region pythonDocString start=/"""/ end=/"""/ keepend contains=pythonDocTest2,pythonTodo contained 
syn region pythonDocString start=/'''/ end=/'''/ keepend contains=pythonDocTest,pythonTodo contained
syn region pythonDocString start=/\%^\n*"""/ end=/"""/ contains=pythonTodo
syn region pythonDocString start=/\%^\n*'''/ end=/'''/ contains=pythonTodo

highlight link pythonDocString Comment
" }}}1

" Re-define some groups {{{1
" #! line {{{2
syn match pythonRun "\%^#!.*$" nextgroup=pythonDocString skipnl
" Classes {{{2
syntax keyword pythonClass class nextgroup=pythonType skipwhite
syntax match pythonType "[a-zA-Z_][a-zA-Z0-9_]*" display contained nextgroup=pythonClassInherit
syntax region pythonClassInherit start=/(/ end=/):/ contained contains=PythonType nextgroup=pythonDocString skipnl skipwhite contains=PythonType
highlight link pythonClass Define
highlight link pythonType Type
" Functions {{{2
syntax keyword pythonStatement def nextgroup=pythonFunction skipwhite
syntax match pythonFunction "[a-zA-Z_][a-zA-Z0-9_]*" display contained nextgroup=pythonFunctionSignature
syntax region pythonFunctionSignature start=/(/ end=/):/ contained nextgroup=pythonDocString skipnl skipwhite
" }}}1

" Re-link some groups {{{1
highlight link pythonImport Include
" }}}1
