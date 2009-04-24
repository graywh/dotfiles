" vim:sts=2:sw=2:et
"
" Simple plugin to perform a grep on all the open buffers
"
" Author: James Vega <jamessan@jamessan.com>
" Version:    0.2
" Last Updated: 2009-04-24
" License:
" Copyright © 2008-2009, James Vega <jamessan@jamessan.com>
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

" Let people prevent the plugin from loading
if exists("loaded_bufgrep")
  finish
endif

if !has('quickfix') || !exists("*winsaveview") || !exists("*setqflist")
  echohl WarningMsg
  echo 'Need a Vim which has +quickfix, winsaveview(), and setqflist()'
  echohl None
  finish
endif

function! s:ValidBuffer(bufnr)
  return getbufvar(a:bufnr, '&buftype') != 'quickfix'
endfunction

function! s:BufGrep(pattern)
  let n = bufnr('%')
  if !s:ValidBuffer(n)
    return
  endif
  " Restore the buffer to its deleted state after we switch away from it.
  let savepos = winsaveview()
  call cursor(1, 1)
  let m = searchpos(a:pattern, 'cW')
  while m != [0, 0]
    let d = {}
    let d['bufnr'] = n
    let d['lnum'] = m[0]
    let d['col'] = m[1]
    let d['vcol'] = virtcol('.')
    let d['text'] = getline('.')
    let ret = setqflist([d], 'a')
    echo ret
    let m = searchpos(a:pattern, 'W')
  endwhile
  call winrestview(savepos)
endfunction

function! s:BufGrepAll(pattern)
  for n in range(1, bufnr('$'))
    silent exe 'b ' . n
    if !buflisted(n)
      setl bufhidden=delete
    endif
    call s:BufGrep(a:pattern)
  endfor
endfunction

function! s:BuildBufGrep(pattern, bang)
  " Save info for current buffer/window
  let curbuf = bufnr('%')
  let oldbh = &l:bufhidden
  let oldfen = &l:foldenable
  let oldview = winsaveview()

  " Clear the qflist since BufGrep simply appends to it
  call setqflist([])

  " Disable folding so we don't disturb which folds the user had open
  setl nofoldenable
  " Set the current buffer to hide when it's abandoned so we know the script
  " can switch away from this buffer
  setl bufhidden=hide

  " Only care about buffers that actually show up in ":ls", unless a:bang is
  " set.  In that case, check all buffers.
  if !a:bang
    silent bufdo call s:BufGrep(a:pattern)
  else
    call s:BufGrepAll(a:pattern)
  endif

  let &l:bufhidden = oldbh
  let &l:foldenable = oldfen

  try
    cc 1
  catch /E42:/
    " No matches, so restore things back to normal
    silent exe 'b ' . curbuf
    call winrestview(oldview)
    echohl ErrorMsg
    echo 'No match: ' . a:pattern
    echohl None
  endtry
endfunction

com! -nargs=+ -bar -bang BufGrep :call s:BuildBufGrep(<q-args>, <bang>0)
