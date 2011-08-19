#!bash

function vimh {
    vim -c "help $1 | only"
}

function man {
    vim -c "Man $* | only | bd#"
}

function loop {
    while true; do
        $*
    done
}

# calc shortcut {{{1
if [[ -x $(which bc) ]]; then
    function calc {
        echo "${@}" | bc -l
    }
fi

# git ps1 stuff {{{1
function ___git_branch { # [defunct] {{{2
    local base_dir=$(git rev-parse --show-cdup 2>/dev/null) || return 1
    local ref=$(git-symbolic-ref -q HEAD || git-name-rev --name-only HEAD 2>/dev/null)
    ref=${ref#refs/heads/}
    echo " ${ref}"
}

function ___git_ps1 { # reference __git_ps1 {{{2
    local g p
    g=$(git rev-parse --git-dir 2>/dev/null) || return
    if [[ "${g}" == ".git" ]]; then
        __git_ps1 " %s"
    elif [[ "${g}" == "${HOME}/.git" ]]; then
        if [[ -f ".gitignore" ]]; then
            __git_ps1 " %s"
        else
            p=$(git rev-parse --show-prefix 2>/dev/null)
            case ${p} in
            .dotfiles/*|.vim/*)
                __git_ps1 " %s"
                ;;
            esac
        fi
    else
        __git_ps1 " %s"
    fi
}
__git_ps1 () { # copied from bash_completion.d/git {{{2
    local git_dir action branch

    git_dir=$(git rev-parse --git-dir 2>/dev/null) || return
    if [[ -d "$git_dir/rebase-apply" ]]; then
        if [[ -f "$git_dir/rebase-apply/rebasing" ]]; then
            action="|REBASE"
        elif [[ -f "$git_dir/rebase-apply/applying" ]]; then
            action="|AM"
        else
            action="|AM/REBASE"
        fi
        branch="$(git symbolic-ref HEAD 2>/dev/null)"
    elif [[ -f "$git_dir/rebase-merge/interactive" ]]; then
        action="|REBASE-i"
        branch="$(cat "$git_dir/rebase-merge/head-name")"
    elif [[ -d "$git_dir/rebase-merge" ]]; then
        action="|REBASE-m"
        branch="$(cat "$git_dir/rebase-merge/head-name")"
    elif [[ -f "$git_dir/MERGE_HEAD" ]]; then
        action="|MERGING"
        branch="$(git symbolic-ref HEAD 2>/dev/null)"
    else
        [[ -f "$git_dir/BISECT_LOG" ]] && action="|BISECTING"
        branch="$(git symbolic-ref HEAD 2>/dev/null)" || \
            branch="$(git describe --exact-match HEAD 2>/dev/null)" || \
            branch="$(cut -c1-7 "$git_dir/HEAD")..."
    fi

    branch=${branch#refs/heads/}
    if [[ -n "$1" ]]; then
        printf "$1" "${branch}${action}"
    else
        printf " (%s)" "${branch}${action}"
    fi
}

# xterm title shortcut {{{1
function __xtermicontitle {
    echo -ne "\033]0;${1}\a"
}
function __xtermicon {
    echo -ne "\033]1;${1}\a"
}
function __xtermtitle {
    echo -ne "\033]2;${1}\a"
}

function __screentitle {
    echo -ne "\033k${1}\033\\"
}

# moin current revision {{{1
function catmoin {
    for page in ${@}; do
        cat ${page}/revisions/$(cat ${page}/current)
    done
}
function lsmoin {
    for page in ${@}; do
        echo ${page}/revisions/$(cat ${page}/current)
    done
}

# vim: ft=sh fdm=marker
