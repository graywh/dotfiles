" space.vim - Smart Space key
" Author:       Henrik Öhman <spiiphNOSPAM@hotmail.com>
" $Revision$
"
" Licensed under the same terms as Vim itself.

" ============================================================================

" Set this variable to disable smart space
"let g:space_no_mappings = 1

if !exists("g:space_no_mappings") || !g:space_no_mappings
    nmap <silent> <Space>   :call <SID>do_space(0, 0)<CR>
    nmap <silent> <S-Space> :call <SID>do_space(1, 0)<CR>
    nmap <silent> <BS>      :call <SID>do_space(1, 0)<CR>
    vmap <silent> <Space>   :<C-u>call <SID>do_space(0, 1)<CR>
    vmap <silent> <BS>      :<C-u>call <SID>do_space(1, 1)<CR>

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

    nnoremap <silent> ]c :call <SID>setup_space("diff")<CR>]c
    nnoremap <silent> [c :call <SID>setup_space("diff")<CR>[c
    vnoremap <silent> ]c :<C-u>call <SID>setup_space("diff")<CR>gv]c
    vnoremap <silent> [c :<C-u>call <SID>setup_space("diff")<CR>gv[c

    cnoremap <CR> <C-\>e<SID>parse_cmd_line()<CR><CR>
endif

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
endfunc

function! s:parse_cmd_line()
    let cmd = getcmdline()
    if cmd =~ "^c\\%(p\\%[revious]\\|[nN]\\%[ext]\\|c!\\=\\|f\\%[irst]\\|l\\%[ast]\\|nf\\%[ile]\\|r\\%[ewind]\\|f\\%[ile]\\|g\\%[etfile]\\|addf\\[ile]\\)"
        call <SID>setup_space("qf")
    elseif cmd =~ "^l\\%(p\\%[revious]\\|[nN]\\%[ext]\\|c!\\=\\|f\\%[irst]\\|l\\%[ast]\\|nf\\%[ile]\\|r\\%[ewind]\\|f\\%[ile]\\|g\\%[etfile]\\|addf\\[ile]\\)"
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
        let s:space_move = "silent! ln"
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

    if a:shift == 0
        "echomsg "Called do_space(0)"
        if exists("s:space_move") && exists("l:prefix")
            execute l:prefix . s:space_move
        else
            execute "norm! <Space>"
        endif
    else
        "echomsg "Called do_space(1)"
        if exists("s:shift_space_move") && exists("l:prefix")
            execute l:prefix . s:shift_space_move
        else
            execute "norm! <S-Space>"
        endif
    endif
endfunc

