function! CsharpRegionFoldExpr(lnum)
  let l = getline(a:lnum)
  if l =~? '^\s*#region'
    return 'a1'
  elseif l =~? '^\s*#endregion'
    return 's1'
  else
    return '='
  end
endfunction

setlocal foldmethod=expr
setlocal foldexpr=CsharpRegionFoldExpr(v:lnum)

let b:undo_ftplugin = 'setl fdm< fde<'
