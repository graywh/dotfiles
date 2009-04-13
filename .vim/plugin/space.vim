" space.vim - Smart Space key
" Author:       Henrik Öhman <spiiphNOSPAM@hotmail.com>
" URL:          http://skota.org/spiff/vim/plugin/space.vim
" Version:      1.5
" LastChanged:  $LastChangedDate: 2009-02-06 12:26:57 +0100 (Fri, 06 Feb 2009) $
" Revision:     $Revision: 156 $
"
" Licensed under the same terms as Vim itself.
"
" NOTE: Using this script disables 'foldopen', since vim won't open folds if a
" command is part of a mapping. This could possibly be fixed by issuing a zv
" in the appropriate parts of setup_space() and possibly also do_space(), but
" this feels hackish and not like a good solution. 
" ============================================================================

" Set this variable to disable space.vim
"
"   let g:loaded_space = 1
"

if exists("g:loaded_space")
    finish
endif
let g:loaded_space = 1

nmap <silent> <Space>   :call <SID>do_space(0, 0)<CR>
nmap <silent> <S-Space> :call <SID>do_space(1, 0)<CR>
nmap <silent> <BS>      :call <SID>do_space(2, 0)<CR>
vmap <silent> <Space>   :<C-u>call <SID>do_space(0, 1)<CR>
vmap <silent> <Space>   :<C-u>call <SID>do_space(1, 1)<CR>
vmap <silent> <BS>      :<C-u>call <SID>do_space(2, 1)<CR>

" character movement commands
if !exists("g:space_no_character_movements") || !g:space_no_character_movements
    nnoremap <silent> f :call <SID>setup_space("char")<CR>f
    nnoremap <silent> F :call <SID>setup_space("char")<CR>F
    nnoremap <silent> t :call <SID>setup_space("char")<CR>t
    nnoremap <silent> T :call <SID>setup_space("char")<CR>T
    nnoremap <silent> ; :call <SID>setup_space("char")<CR>;
    nnoremap <silent> , :call <SID>setup_space("char")<CR>,
    vnoremap <silent> f :<C-u>call <SID>setup_space("char")<CR>gvf
    vnoremap <silent> F :<C-u>call <SID>setup_space("char")<CR>gvF
    vnoremap <silent> t :<C-u>call <SID>setup_space("char")<CR>gvt
    vnoremap <silent> T :<C-u>call <SID>setup_space("char")<CR>gvT
    vnoremap <silent> ; :<C-u>call <SID>setup_space("char")<CR>gv;
    vnoremap <silent> , :<C-u>call <SID>setup_space("char")<CR>gv,
endif

" search commands
if !exists("g:space_no_search") || !g:space_no_search
    nnoremap <silent> * :call <SID>setup_space("search")<CR>*
    nnoremap <silent> # :call <SID>setup_space("search")<CR>#
    nnoremap          / :call <SID>setup_space("search")<CR>/
    nnoremap          ? :call <SID>setup_space("search")<CR>?
    nnoremap <silent> n :call <SID>setup_space("search")<CR>n
    nnoremap <silent> N :call <SID>setup_space("search")<CR>N
    vnoremap <silent> * :<C-u>call <SID>setup_space("search")<CR>gv*
    vnoremap <silent> # :<C-u>call <SID>setup_space("search")<CR>gv#
    vnoremap          / :<C-u>call <SID>setup_space("search")<CR>gv/
    vnoremap          ? :<C-u>call <SID>setup_space("search")<CR>gv?
    vnoremap <silent> n :<C-u>call <SID>setup_space("search")<CR>gvn
    vnoremap <silent> N :<C-u>call <SID>setup_space("search")<CR>gvN
endif

" diff next/prev
if !exists("g:space_no_diff") || !g:space_no_diff
    nnoremap <silent> ]c :call <SID>setup_space("diff")<CR>]c
    nnoremap <silent> [c :call <SID>setup_space("diff")<CR>[c
    vnoremap <silent> ]c :<C-u>call <SID>setup_space("diff")<CR>gv]c
    vnoremap <silent> [c :<C-u>call <SID>setup_space("diff")<CR>gv[c
endif

" previous/next unmatched ( or [
if !exists("g:space_no_brace") || !g:space_no_brace
    nnoremap <silent> ]) :call <SID>setup_space("paren")<CR>])
    vnoremap <silent> ]) :<C-u>call <SID>setup_space("paren")<CR>gv])
    nnoremap <silent> [( :call <SID>setup_space("paren")<CR>[(
    vnoremap <silent> [( :<C-u>call <SID>setup_space("paren")<CR>gv[(
    nnoremap <silent> ]} :call <SID>setup_space("curly")<CR>]}
    vnoremap <silent> ]} :<C-u>call <SID>setup_space("curly")<CR>gv]}
    nnoremap <silent> [{ :call <SID>setup_space("curly")<CR>[{
    vnoremap <silent> [{ :<C-u>call <SID>setup_space("curly")<CR>gv[{
endif

" start/end of a method
if !exists("g:space_no_method") || !g:space_no_method
    nnoremap <silent> ]m :call <SID>setup_space("method_start")<CR>]c
    nnoremap <silent> [m :call <SID>setup_space("method_start")<CR>[c
    vnoremap <silent> ]m :<C-u>call <SID>setup_space("method_start")<CR>gv]c
    vnoremap <silent> [m :<C-u>call <SID>setup_space("method_start")<CR>gv[c
    nnoremap <silent> ]M :call <SID>setup_space("method_end")<CR>]c
    nnoremap <silent> [M :call <SID>setup_space("method_end")<CR>[c
    vnoremap <silent> ]M :<C-u>call <SID>setup_space("method_end")<CR>gv]c
    vnoremap <silent> [M :<C-u>call <SID>setup_space("method_end")<CR>gv[c
endif

" previous/next section or '}'/'{' in the first column
if !exists("g:space_no_section") || !g:space_no_section
    nnoremap <silent> ]] :call <SID>setup_space("section_start")<CR>]]
    vnoremap <silent> ]] :<C-u>call <SID>setup_space("section_start")<CR>gv]]
    nnoremap <silent> [[ :call <SID>setup_space("section_start")<CR>[[
    vnoremap <silent> [[ :<C-u>call <SID>setup_space("section_start")<CR>gv[[
    nnoremap <silent> ][ :call <SID>setup_space("section_end")<CR>][
    vnoremap <silent> ][ :<C-u>call <SID>setup_space("section_end")<CR>gv][
    nnoremap <silent> [] :call <SID>setup_space("section_end")<CR>[]
    vnoremap <silent> [] :<C-u>call <SID>setup_space("section_end")<CR>gv[]
endif

cnoremap <expr> <CR> (getcmdtype() == ':' && <SID>parse_cmd_line() ?  "\<CR>" : "\<CR>")

command! SpaceRemoveMappings call <SID>remove_space_mappings()
function! s:remove_space_mappings()
    silent! nunmap <Space>
    silent! nunmap <S-Space>
    silent! vunmap <Space>
    silent! vunmap <S-Space>

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

    silent! nunmap /
    silent! nunmap ?
    silent! nunmap *
    silent! nunmap #
    silent! nunmap n
    silent! nunmap N
    silent! vunmap /
    silent! vunmap ?
    silent! vunmap *
    silent! vunmap #
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

    silent! nunmap ]m
    silent! nunmap [m
    silent! vunmap ]m
    silent! vunmap [m
    silent! nunmap ]M
    silent! nunmap [M
    silent! vunmap ]M
    silent! vunmap [M

    silent! nunmap [[
    silent! nunmap ]]
    silent! vunmap [[
    silent! vunmap ]]
    silent! nunmap []
    silent! nunmap ][
    silent! vunmap []
    silent! vunmap ][
endfunc

function! s:parse_cmd_line()
    let cmd = getcmdline()
    if cmd =~ "^c\\%(p\\%[revious]\\|[nN]\\%[ext]\\|c!\\=\\|fir\\%[st]\\|la\\%[st]\\|nf\\%[ile]\\|r\\%[ewind]\\|f\\%[ile]\\|g\\%[etfile]\\|addf\\[ile]\\)"
        call <SID>setup_space("qf")
    elseif cmd =~ "^l\\%(p\\%[revious]\\|N\\%[ext]\\|ne\\%[ext]\\|l!\\=\\|fir\\%[st]\\|la\\%[st]\\|nf\\%[ile]\\|r\\%[ewind]\\|f\\%[ile]\\|g\\%[etfile]\\|addf\\[ile]\\)"
        call <SID>setup_space("lf")
    endif
    return cmd
endfunc

function! s:setup_space(type)
    if a:type == "char"
        let s:space_move = ";"
        let s:shift_space_move = ","
        let s:prefix = "norm! "
        let s:visual_prefix = "norm! gv"
    elseif a:type == "diff"
        let s:space_move = "]c"
        let s:shift_space_move = "[c"
        let s:prefix = "silent! norm! "
        let s:visual_prefix = "norm! gv"
    elseif a:type == "method_start"
        let s:space_move = "]m"
        let s:shift_space_move = "[m"
        let s:prefix = "silent! norm! "
        let s:visual_prefix = "norm! gv"
    elseif a:type == "method_end"
        let s:space_move = "]M"
        let s:shift_space_move = "[M"
        let s:prefix = "silent! norm! "
        let s:visual_prefix = "norm! gv"
    elseif a:type == "section_start"
        let s:space_move = "]]"
        let s:shift_space_move = "[["
        let s:prefix = "silent! norm! "
        let s:visual_prefix = "norm! gv"
    elseif a:type == "section_end"
        let s:space_move = "]["
        let s:shift_space_move = "[]"
        let s:prefix = "silent! norm! "
        let s:visual_prefix = "norm! gv"
    elseif a:type == "paren"
        let s:space_move = "])"
        let s:shift_space_move = "[("
        let s:prefix = "silent! norm! "
        let s:visual_prefix = "norm! gv"
    elseif a:type == "curly"
        let s:space_move = "]}"
        let s:shift_space_move = "[{"
        let s:prefix = "silent! norm! "
        let s:visual_prefix = "norm! gv"
    elseif a:type == "search"
        let s:space_move = "n"
        let s:shift_space_move = "N"
        let s:prefix = "silent! norm! "
        let s:visual_prefix = "norm! gv"
    elseif a:type == "qf"
        let s:space_move = "silent! cn"
        let s:shift_space_move = "silent! cN"
        let s:prefix = ""
        let s:visual_prefix = ""
    elseif a:type == "lf"
        let s:space_move = "silent! lne"
        let s:shift_space_move = "silent! lN"
        let s:prefix = ""
        let s:visual_prefix = ""
    endif
endfunc

function! s:do_space(shift, visual)
    if a:visual == 0
        if exists("s:prefix")
            let l:prefix = s:prefix
        end
    else
        if exists("s:visual_prefix")
            let l:prefix = s:visual_prefix
        end
    endif

    " <Space>
    if a:shift == 0
        "echomsg "Called do_space(0)"
        if exists("s:space_move") && exists("l:prefix")
            execute l:prefix . s:space_move
        else
            execute "norm! <Space>"
        endif
    " <S-Space>
    elseif a:shift == 1
        "echomsg "Called do_space(1)"
        if exists("s:shift_space_move") && exists("l:prefix")
            execute l:prefix . s:shift_space_move
        else
            execute "norm! <S-Space>"
        endif
    " <BS>
    else
        "echomsg "Called do_space(2)"
        if exists("s:shift_space_move") && exists("l:prefix")
            execute l:prefix . s:shift_space_move
        else
            execute "norm! \<BS>"
        endif
    endif
endfunc

" vim: et sts=4 sw=4
