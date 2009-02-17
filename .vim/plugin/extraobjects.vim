" --- First some marker functions to set `[ and `] marks to the beginning and
"     end of an object

" Set marks around an object bounded by startchar / endchar
" Single characters only; considers \\ escapes.
" Must be contained on the current line
function MarkBounded(startchar,endchar)
  let lineno = line(".")
  let colno  = col(".")

  normal 0

  while 1
    " We have to work around search()'s lack of ability to consider a match
    " exactly where the cursor currently is
    if getline(".")[col(".")] != a:startchar
      if search(a:startchar, "W") != lineno | return 0 | endif " Fell off the current line
    endif
    let startcol = col(".")
    if startcol > colno | return 0 | endif " Starts after the cursor
    if search('\%([^\\]\%(\\\\\)*\)\@<=' . a:endchar, "W") != lineno | return 0 | endif
    let endcol = col(".")
    if endcol < colno | continue | endif " Haven't found our string yet
    " If we got this far, we must be inside the string - woo! :)
    execute "normal " . startcol . "|m[" . endcol . "|m]"
    return 1
  endwhile
endf

" Double-quoted string
function MarkAQQ()
  return MarkBounded('"', '"')
endf

function MarkIQQ()
  if ! MarkAQQ() | return 0 | endif
  normal `[lm[
  normal `]hm]
  return 1
endf

" Single-quoted string
function MarkAQ()
  return MarkBounded("'", "'")
endf

function MarkIQ()
  if ! MarkAQ() | return 0 | endif
  normal `[lm[
  normal `]hm]
  return 1
endf

" A line - excluding the EOL mark - this is a character-wise operation
function MarkALine()
  normal 0m[$m]
  return 1
endf

function MarkILine()
  normal ^m[$m]
  return 1
endf

" --- Now the main operation function; this runs op on the object

function OpObject(obj,op)
  let my_reg = v:register
  " Will default to " if not otherwise set
  
  let save_line = line(".")
  let save_col  = col(".")

  execute "let callresult = Mark" . a:obj . "()"

  let startline = line("'[")
  let endline   = line("']")
  let startcol  = col("'[")
  let endcol    = col("']")
  
  let isoneline = ( startline == endline )
  let isempty = isoneline && ( startcol == endcol + 1 )

  let isvalid = callresult && ( isempty || ( isoneline || endcol > startcol ) || ( endline > startline ) )
  
  " See if the range is sensible
  if ( ! isvalid )
    echo "No suitable " . a:obj . " object was found."
    execute "normal " . save_line . "G" . save_col . "|"
    return
  endif

  normal `[

  " The c operator goes into insert mode. Since this is a script function, we
  " must handle it specially. 
  " Also, empty selections require special treatment
  if isempty
    if a:op == "c"
      startinsert
    else
      echo "Operation" a:op "cannot be performed on an empty object"
    endif
  else
    if a:op == "c"
      execute "normal \"" . my_reg . "dv`]"
      startinsert
    else
      execute "normal \"" . my_reg . a:op . "v`]"
    endif
  endif
endf

function VisObject(obj)
  execute "let callresult = Mark" . a:obj . "()"

  " See if the range is sensible
  if ( ! callresult || ( line("'[") > line("']") ) || ( ( line("'[") == line("']") ) && ( col("'[") > col("']") ) ) )
    echo "No suitable " . a:obj . " object was found."
    return
  endif

  " We're in normal mode currently
  normal `[v`]
endf

" --- Helper functions for running large numbers of maps

function DefineNOps(op,obj,markfn)
  execute "nmap <silent> " . a:op . "a" . a:obj . " :call OpObject(\"A" . a:markfn . "\", \"" . a:op . "\")<CR>"
  execute "nmap <silent> " . a:op . "i" . a:obj . " :call OpObject(\"I" . a:markfn . "\", \"" . a:op . "\")<CR>"
endf

function DefineAllOps(obj,markfn)
  call DefineNOps("d", a:obj,a:markfn)
  call DefineNOps("c", a:obj,a:markfn)
  call DefineNOps("y", a:obj,a:markfn)
  call DefineNOps("g~",a:obj,a:markfn)
  call DefineNOps("gu",a:obj,a:markfn)
  call DefineNOps("gU",a:obj,a:markfn)
  call DefineNOps("!", a:obj,a:markfn)
  call DefineNOps("=", a:obj,a:markfn)
  call DefineNOps("gq",a:obj,a:markfn)
  call DefineNOps("g?",a:obj,a:markfn)
  call DefineNOps(">", a:obj,a:markfn)
  call DefineNOps("<", a:obj,a:markfn)
  call DefineNOps("zf",a:obj,a:markfn)

  execute "vmap <silent> a" . a:obj . " <ESC>:call VisObject(\"A" . a:markfn . "\")<CR>"
  execute "vmap <silent> i" . a:obj . " <ESC>:call VisObject(\"I" . a:markfn . "\")<CR>"
endf

" --- Now make the actual maps

call DefineAllOps("\"","QQ")
call DefineAllOps("'","Q")
call DefineAllOps("l","Line")
