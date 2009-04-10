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

# Function path {{{1
typeset -U fpath
if [[ -d ${ZDIR}'/functions' ]]; then
    fpath=(${ZDIR}'/functions' $fpath)
fi

#}}}1

# Don't let these variables be propogated {{{1
if [[ ${TERM} != screen* ]]; then
    unset INTERM
    unset STY
fi
# }}}1

mailpath=(/var/spool/mail/`whoami`'?You have mail')

export EDITOR=vim

export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -c 'nnoremap <buffer> q ZQ' -\""

export BROWSER=firefox

export PYTHONSTARTUP=${HOME}'/.pythonrc.py'

# Mac OS X options {{{1
if [[ ${OSTYPE} == darwin* ]]; then
    # turn on colors
    export CLICOLOR=1
    #export LSCOLORS=ExFxCxDxBxegedabagacad
fi

#}}}1

# vim: fdm=marker
