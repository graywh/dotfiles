syn sync fromstart

" Add self to keywords {{{1
syn keyword pythonSelf	self
hi link pythonSelf	Constant

" Add some operators {{{1
syn match pythonOperator	'[-+*/%<>]'
syn match pythonOperator	'\*\*\|<=\|>=\|==\|!='
" syn match pythonDelimiter	'[,;]'
" syn match pythonDelimiter	':' contained containedin=pythonCurlyRegion,pythonBraceRegion
" syn match pythonDelimiter	',' contained containedin=pythonCurlyRegion

" Add () {} [] pairs {{{1
syn region pythonParenRegion matchgroup=pythonParenDelimiter start=/(/ end=/)/ transparent contains=ALLBUT,pythonError,pythonBraceError,pythonCurlyError,pythonFunction,pythonType
syn region pythonCurlyRegion matchgroup=pythonCurlyDelimiter start=/{/ end=/}/ transparent contains=ALLBUT,pythonError,pythonBraceError,pythonParenError,pythonFunction,pythonType
syn region pythonBraceRegion matchgroup=pythonBraceDelimiter start=/\[/ end=/]/ transparent contains=ALLBUT,pythonError,pythonParenError,pythonCurlyError,pythonFunction,pythonType
hi link pythonParenDelimiter Delimiter
hi link pythonCurlyDelimiter Delimiter
hi link pythonBraceDelimiter Delimiter

" Add DocString highlighting {{{1
" syn region pythonDocString start=/"""/ end=/"""/ keepend contains=pythonDocTest2,pythonTodo contained
" syn region pythonDocString start=/'''/ end=/'''/ keepend contains=pythonDocTest,pythonTodo contained
" syn region pythonDocString start=/\%^\n*"""/ end=/"""/ contains=pythonTodo
" syn region pythonDocString start=/\%^\n*'''/ end=/'''/ contains=pythonTodo

hi link pythonDocString Comment

" Re-define some groups {{{1
" Decorators {{{2
syn match pythonDecorator '@\k\+' contains=pythonFunction
" #! line {{{2
syn match pythonRun "\%^#!.*$" nextgroup=pythonDocString skipnl

" Classes {{{2
syn keyword pythonClass class nextgroup=pythonType skipwhite
syn match pythonType '[a-zA-Z_][a-zA-Z0-9_]*' contained
" syn match pythonClassDefinition 'class \k\{-}([^()]\{-}):' contains=pythonClass,pythonClass,pythonType,pythonClassInherit
" syn keyword pythonClass class
" syn match pythonClass 'class 'me=e-1 contained containedin=pythonClassDefinition nextgroup=pythonType skipwhite
" syn match pythonType '[a-zA-Z_][a-zA-Z0-9_]*' contained containedin=pythonClassDefinition nextgroup=pythonClassInherit
" syn region pythonClassInherit matchgroup=pythonParenDelimiter start=/(/ end=/):/he=e-1 contained contains=PythonType containedin=pythonClassDefinition nextgroup=pythonDocString skipnl skipwhite
hi link pythonClass Define
hi link pythonType Type

" Functions {{{2
syn keyword pythonDefine def nextgroup=pythonFunction skipwhite
syn match pythonFunction '[a-zA-Z_][a-zA-Z0-9_]*' contained
" syn match pythonFunctionDefinition 'def \k{-}([^()]\{-}):' contains=pythonDefine,pythonDefine,pythonFunction,pythonFunctionSignature
" syn keyword pythonDefine def
" syn match pythonDefine 'def 'me=e-1 contained containedin=pythonFunctionDefinition nextgroup=pythonFunction skipwhite
" syn match pythonFunction '[a-zA-Z_][a-zA-Z0-9_]*' contained containedin=pythonFunctionDefinition nextgroup=pythonFunctionSignature
" syn region pythonFunctionSignature matchgroup=pythonParenDelimiter start=/(/ end=/):/he=e-1 contained containedin=pythonFunctionDefinition nextgroup=pythonDocString skipnl skipwhite
hi link pythonDefine Define


" Re-link some groups {{{1
hi link pythonImport Include
