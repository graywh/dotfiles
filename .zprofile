export ZDIR=${ZDIR:-${HOME}'/.zsh'}

# Path {{{1
typeset -U path

if [[ -d ${HOME}'/bin' ]]; then
    path=($path ${HOME}'/bin')
fi

if [[ -d '/opt/local/bin' ]]; then
    path=('/opt/local/bin' $path)
fi

if [[ -d '/opt/local/sbin' ]]; then
    path=('/opt/local/sbin' $path)
fi

if [[ -d '/var/lib/gems/1.8/bin' ]]; then
    path=('/var/lib/gems/1.8/bin' $path)
fi

if [[ -d '/var/lib/gems/1.9.0/bin' ]]; then
    path=('/var/lib/gems/1.9.0/bin' $path)
fi

# Function path {{{1
typeset -U fpath

if [[ -d ${ZDIR}'/functions' ]]; then
    fpath=(${ZDIR}'/functions' $fpath)
fi

# Variables {{{1
export EDITOR=vim
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -c 'nnoremap <buffer> q ZQ' -\""
export BROWSER=firefox

if [[ -f ${HOME}"/.pythonrc.py" ]]; then
    export PYTHONSTARTUP=${HOME}'/.pythonrc.py'
fi

# Mac OS X options {{{2
if [[ ${OSTYPE} == darwin* ]]; then
    # turn on colors
    export CLICOLOR=1
    #export LSCOLORS=ExFxCxDxBxegedabagacad
fi

# vim: fdm=marker fen
