" space.vim - Smart Space key
" Author:       Henrik Öhman <speeph@gmail.com>
" URL:          http://skota.org/spiff/vim/plugin/space.vim
" Version:      1.6
" LastChanged:  $LastChangedDate: 2009-04-22 16:17:14 +0200 (Wed, 22 Apr 2009) $
" Revision:     $Revision: 169 $
"
" Licensed under the same terms as Vim itself.
"
" NOTE: Using this script disables 'foldopen', since vim won't open folds if a
" command is part of a mapping. This is possible to emulate in a few cases,
" such as the quickfix and location list commands. For the major part of the
" remapped commands, however, it is not possible to immitate Vim exactly, and
" I have therefore opted not to do it at all.
" ============================================================================


" Set this variable to disable space.vim
"
"   let g:loaded_space = 1

" These variables disables the usage of <Space> for groups of different
" movement commands
"
" Disable <Space> for character movements, e.g. fFtT;,
"   let g:space_no_character_movements = 1
"
" Disable <Space> for searches, e.g. /?#*nN
"   let g:space_no_search = 1
"
" Disable <Space> for diff commands, e.g. [c and ]c
"   let g:space_no_diff = 1
"
" Disable <Space> for brace movement commands, e.g. [(, ]), [{ and ]}
"   let g:space_no_brace = 1
"
" Disable <Space> for method movement commands, e.g. [m, ]m, [M and ]M
"   let g:space_no_method = 1
"
" Disable <Space> for section movement commands, e.g. [[, ]], [] and ][
"   let g:space_no_section = 1
"
" Disable <Space> for quickfix and location list commands, e.g. :cc, :ll, etc.
"   let g:space_no_quickfix = 1
"

if exists("g:space_debug")
    let g:space_no_character_movements = 0
    let g:space_no_search = 0
    let g:space_no_diff = 0
    let g:space_no_brace = 0
    let g:space_no_method = 0
    let g:space_no_section = 0
    let g:space_no_quickfix = 0
    echomsg "Running space.vim in debug mode."
elseif exists("g:loaded_space")
    finish
endif
let g:loaded_space = 1

noremap <expr> <silent> <Space>   <SID>do_space(0, "<Space>")
noremap <expr> <silent> <S-Space> <SID>do_space(1, "<S-Space>")
noremap <expr> <silent> <BS>      <SID>do_space(1, "<BS>")

" character movement commands
if !exists("g:space_no_character_movements") || !g:space_no_character_movements
    nnoremap <expr> <silent> f <SID>setup_space("char", "f")
    nnoremap <expr> <silent> F <SID>setup_space("char", "F")
    nnoremap <expr> <silent> t <SID>setup_space("char", "t")
    nnoremap <expr> <silent> T <SID>setup_space("char", "T")
    nnoremap <expr> <silent> ; <SID>setup_space("char", ";")
    nnoremap <expr> <silent> , <SID>setup_space("char", ",")
    vnoremap <expr> <silent> f <SID>setup_space("char", "f")
    vnoremap <expr> <silent> F <SID>setup_space("char", "F")
    vnoremap <expr> <silent> t <SID>setup_space("char", "t")
    vnoremap <expr> <silent> T <SID>setup_space("char", "T")
    vnoremap <expr> <silent> ; <SID>setup_space("char", ";")
    vnoremap <expr> <silent> , <SID>setup_space("char", ",")
endif

" search commands
if !exists("g:space_no_search") || !g:space_no_search
    nnoremap <expr> <silent> *  <SID>setup_space("search", "*")
    nnoremap <expr> <silent> #  <SID>setup_space("search", "#")
    nnoremap <expr> <silent> g* <SID>setup_space("search", "g*")
    nnoremap <expr> <silent> g# <SID>setup_space("search", "g#")
    nnoremap <expr> <silent> n  <SID>setup_space("search", "n")
    nnoremap <expr> <silent> N  <SID>setup_space("search", "N")
    vnoremap <expr> <silent> *  <SID>setup_space("search", "*")
    vnoremap <expr> <silent> #  <SID>setup_space("search", "#")
    vnoremap <expr> <silent> g* <SID>setup_space("search", "g*")
    vnoremap <expr> <silent> g# <SID>setup_space("search", "g#")
    vnoremap <expr> <silent> n  <SID>setup_space("search", "n")
    vnoremap <expr> <silent> N  <SID>setup_space("search", "N")
endif

" diff next/prev
if !exists("g:space_no_diff") || !g:space_no_diff
    nnoremap <expr> <silent> ]c <SID>setup_space("diff", "]c")
    nnoremap <expr> <silent> [c <SID>setup_space("diff", "[c")
    vnoremap <expr> <silent> ]c <SID>setup_space("diff", "]c")
    vnoremap <expr> <silent> [c <SID>setup_space("diff", "[c")
endif

" previous/next unmatched ( or [
if !exists("g:space_no_brace") || !g:space_no_brace
    nnoremap <expr> <silent> ]) <SID>setup_space("paren", "])")
    vnoremap <expr> <silent> ]) <SID>setup_space("paren", "])")
    nnoremap <expr> <silent> [( <SID>setup_space("paren", "[(")
    vnoremap <expr> <silent> [( <SID>setup_space("paren", "[(")

    nnoremap <expr> <silent> ]} <SID>setup_space("curly", "]}")
    vnoremap <expr> <silent> ]} <SID>setup_space("curly", "]}")
    nnoremap <expr> <silent> [{ <SID>setup_space("curly", "[{")
    vnoremap <expr> <silent> [{ <SID>setup_space("curly", "[{")
endif

" start/end of a method
if !exists("g:space_no_method") || !g:space_no_method
    nnoremap <expr> <silent> ]m <SID>setup_space("method_start", "]m")
    nnoremap <expr> <silent> [m <SID>setup_space("method_start", "[m")
    vnoremap <expr> <silent> ]m <SID>setup_space("method_start", "]m")
    vnoremap <expr> <silent> [m <SID>setup_space("method_start", "[m")

    nnoremap <expr> <silent> ]M <SID>setup_space("method_end", "]M")
    nnoremap <expr> <silent> [M <SID>setup_space("method_end", "[M")
    vnoremap <expr> <silent> ]M <SID>setup_space("method_end", "]M")
    vnoremap <expr> <silent> [M <SID>setup_space("method_end", "[M")
endif

" previous/next section or '}'/'{' in the first column
if !exists("g:space_no_section") || !g:space_no_section
    nnoremap <expr> <silent> ]] <SID>setup_space("section_start", "]]")
    vnoremap <expr> <silent> ]] <SID>setup_space("section_start", "]]")
    nnoremap <expr> <silent> [[ <SID>setup_space("section_start", "[[")
    vnoremap <expr> <silent> [[ <SID>setup_space("section_start", "[[")

    nnoremap <expr> <silent> ][ <SID>setup_space("section_end", "][")
    vnoremap <expr> <silent> ][ <SID>setup_space("section_end", "][")
    nnoremap <expr> <silent> [] <SID>setup_space("section_end", "[]")
    vnoremap <expr> <silent> [] <SID>setup_space("section_end", "[]")
endif

" quickfix and location list commands
if !exists("g:space_no_quickfix") || !g:space_no_quickfix
    cnoremap <expr> <CR> <SID>parse_cmd_line()
endif

" TODO: Have all mappings add the remapped sequence to a list, and use that
"       list to remove mappings.
command! SpaceRemoveMappings call <SID>remove_space_mappings()
function! s:remove_space_mappings()
    silent! unmap <Space>
    silent! unmap <S-Space>
    silent! unmap <BS>

    silent! nunmap f
    silent! nunmap F
    silent! nunmap t
    silent! nunmap T
    silent! nunmap ;
    silent! nunmap ,
    silent! vunmap f
    silent! vunmap F
    silent! vunmap t
    silent! vunmap T
    silent! vunmap ;
    silent! vunmap ,

    silent! nunmap *
    silent! nunmap #
    silent! nunmap g*
    silent! nunmap g#
    silent! nunmap n
    silent! nunmap N
    silent! vunmap *
    silent! vunmap #
    silent! vunmap g*
    silent! vunmap g#
    silent! vunmap n
    silent! vunmap N

    silent! nunmap ]c
    silent! nunmap [c
    silent! vunmap ]c
    silent! vunmap [c

    silent! nunmap [(
    silent! nunmap ])
    silent! vunmap [(
    silent! vunmap ])
    silent! nunmap [{
    silent! nunmap ]}
    silent! vunmap [{
    silent! vunmap ]}

    silent! nunmap ]]
    silent! nunmap [[
    silent! nunmap ][
    silent! nunmap []
    silent! vunmap ]]
    silent! vunmap [[
    silent! vunmap ][
    silent! vunmap []

    silent! nunmap ]m
    silent! nunmap [m
    silent! vunmap ]m
    silent! vunmap [m
    silent! nunmap ]M
    silent! nunmap [M
    silent! vunmap ]M
    silent! vunmap [M

    silent! cunmap <CR>

    silent! unlet g:loaded_space
endfunction

" TODO: Add matches for :[l]make, :[l]grep and :[l]vim
" TODO: Modify matches for [count] arguments
" TODO: Check if the '\>!\=' part of the pattern fails when 'iskeyword'
"       contains '!'
let s:qf_re = '^c\%(' .
    \ 'c\|' .
    \ 'p\%[revious]\|' .
    \ '[nN]\%[ext]\|' .
    \ '\(fir\|la\)\%[st]\|' .
    \ 'r\%[ewind]\|' .
    \ '\(f\|nf\|Nf\|pf\)\%[ile]' .
    \ '\)\>!\='

let s:lf_re = '^l\%(' .
    \ 'l\|' .
    \ 'p\%[revious]\|' .
    \ 'ne\%[xt]\|N\%[ext]\|' .
    \ '\(fir\|la\)\%[st]\|' .
    \ 'r\%[ewind]\|' .
    \ '\(f\|nf\|Nf\|pf\)\%[ile]' .
    \ '\)\>!\='

function! s:parse_cmd_line()
    let cmd = getcmdline()
    let type = getcmdtype()

    if type == '/' || type == '?'
        call <SID>setup_space("search", cmd)
    elseif type == ':'
        if cmd =~ s:qf_re
            call <SID>setup_space("qf", cmd)
        elseif cmd =~ s:lf_re
            call <SID>setup_space("lf", cmd)
        endif
    end
    return "\<CR>"
endfunc

function! s:setup_space(type, command)
    let cmd = a:command

    if a:type == "char"
        let s:space_move = ";"
        let s:shift_space_move = ","
    elseif a:type == "diff"
        let s:space_move = "]c"
        let s:shift_space_move = "[c"
    elseif a:type == "method_start"
        let s:space_move = "]m"
        let s:shift_space_move = "[m"
    elseif a:type == "method_end"
        let s:space_move = "]M"
        let s:shift_space_move = "[M"
    elseif a:type == "section_start"
        let s:space_move = "]]"
        let s:shift_space_move = "[["
    elseif a:type == "section_end"
        let s:space_move = "]["
        let s:shift_space_move = "[]"
    elseif a:type == "paren"
        let s:space_move = "])"
        let s:shift_space_move = "[("
    elseif a:type == "curly"
        let s:space_move = "]}"
        let s:shift_space_move = "[{"
    elseif a:type == "search"
        let s:space_move = "n"
        let s:shift_space_move = "N"
    elseif a:type == "qf"
        let s:space_move = ":\<C-u>cn\<CR>"
        let s:shift_space_move = ":\<C-u>cN\<CR>"
    elseif a:type == "lf"
        let s:space_move = ":\<C-u>lne\<CR>"
        let s:shift_space_move = ":\<C-u>lN\<CR>"
    endif
    call <SID>debug_msg("setup_space(type = " . a:type .
        \ ", command = " . cmd . ")")
    return cmd
endfunc

function! s:do_space(shift, default)
    " <Space>
    if a:shift == 0
        if exists("s:space_move")
            call <SID>debug_msg("do_space(space_move = " . s:space_move . ")")
            return s:space_move
        else
            return a:default
        endif
    " <S-Space> and <BS>
    else
        if exists("s:shift_space_move")
            call <SID>debug_msg("do_space(shift_space_move = " .
                \ s:shift_space_move . ")")
            return s:shift_space_move
        else
            return a:default
        endif
    endif
endfunc

function! s:debug_msg(string)
    if exists("g:space_debug")
        echomsg a:string
    endif
endfunc

" vim: et sts=4 sw=4
