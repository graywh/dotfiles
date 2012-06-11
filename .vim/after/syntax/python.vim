syntax sync fromstart

" Add self to keywords {{{1
syntax keyword pythonSelf	self
highlight link pythonSelf	Constant

" Add some operators {{{1
syntax match pythonOperator	'[-+*/%<>]'
syntax match pythonOperator	'\*\*\|<=\|>=\|==\|!='
" syntax match pythonDelimiter	'[,;]'
" syntax match pythonDelimiter	':' contained containedin=pythonCurlyRegion,pythonBraceRegion
" syntax match pythonDelimiter	',' contained containedin=pythonCurlyRegion

" Add () {} [] pairs {{{1
syntax region pythonParenRegion matchgroup=pythonParenDelimiter start=/(/ end=/)/ transparent contains=ALLBUT,pythonError,pythonBraceError,pythonCurlyError,pythonFunction,pythonType
syntax region pythonCurlyRegion matchgroup=pythonCurlyDelimiter start=/{/ end=/}/ transparent contains=ALLBUT,pythonError,pythonBraceError,pythonParenError,pythonFunction,pythonType
syntax region pythonBraceRegion matchgroup=pythonBraceDelimiter start=/\[/ end=/]/ transparent contains=ALLBUT,pythonError,pythonParenError,pythonCurlyError,pythonFunction,pythonType
highlight link pythonParenDelimiter Delimiter
highlight link pythonCurlyDelimiter Delimiter
highlight link pythonBraceDelimiter Delimiter

" Add DocString highlighting {{{1
" syntax region pythonDocString start=/"""/ end=/"""/ keepend contains=pythonDocTest2,pythonTodo contained
" syntax region pythonDocString start=/'''/ end=/'''/ keepend contains=pythonDocTest,pythonTodo contained
" syntax region pythonDocString start=/\%^\n*"""/ end=/"""/ contains=pythonTodo
" syntax region pythonDocString start=/\%^\n*'''/ end=/'''/ contains=pythonTodo

highlight link pythonDocString Comment

" Re-define some groups {{{1
" Decorators {{{2
syntax match pythonDecorator '@\k\+' contains=pythonFunction
" #! line {{{2
syntax match pythonRun "\%^#!.*$" nextgroup=pythonDocString skipnl

" Classes {{{2
syntax keyword pythonClass class nextgroup=pythonType skipwhite
syntax match pythonType '[a-zA-Z_][a-zA-Z0-9_]*' contained
" syntax match pythonClassDefinition 'class \k\{-}([^()]\{-}):' contains=pythonClass,pythonClass,pythonType,pythonClassInherit
" syntax keyword pythonClass class
" syntax match pythonClass 'class 'me=e-1 contained containedin=pythonClassDefinition nextgroup=pythonType skipwhite
" syntax match pythonType '[a-zA-Z_][a-zA-Z0-9_]*' contained containedin=pythonClassDefinition nextgroup=pythonClassInherit
" syntax region pythonClassInherit matchgroup=pythonParenDelimiter start=/(/ end=/):/he=e-1 contained contains=PythonType containedin=pythonClassDefinition nextgroup=pythonDocString skipnl skipwhite
highlight link pythonClass Define
highlight link pythonType Type

" Functions {{{2
syntax keyword pythonDefine def nextgroup=pythonFunction skipwhite
syntax match pythonFunction '[a-zA-Z_][a-zA-Z0-9_]*' contained
" syntax match pythonFunctionDefinition 'def \k{-}([^()]\{-}):' contains=pythonDefine,pythonDefine,pythonFunction,pythonFunctionSignature
" syntax keyword pythonDefine def
" syntax match pythonDefine 'def 'me=e-1 contained containedin=pythonFunctionDefinition nextgroup=pythonFunction skipwhite
" syntax match pythonFunction '[a-zA-Z_][a-zA-Z0-9_]*' contained containedin=pythonFunctionDefinition nextgroup=pythonFunctionSignature
" syntax region pythonFunctionSignature matchgroup=pythonParenDelimiter start=/(/ end=/):/he=e-1 contained containedin=pythonFunctionDefinition nextgroup=pythonDocString skipnl skipwhite
highlight link pythonDefine Define


" Re-link some groups {{{1
highlight link pythonImport Include
