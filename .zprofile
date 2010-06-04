# Path {{{1
typeset -U path

if [[ -d ${HOME}'/bin' ]]; then
    path=($path ${HOME}'/bin')
fi

if [[ -d '/opt/local' ]]; then
    path=('/opt/local/sbin' '/opt/local/bin' $path)
fi

if [[ -d '/var/lib/gems' ]]; then
    path=(/var/lib/gems/*/bin $path)
fi
# }}}1

export EDITOR=vim
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\""
export BROWSER=firefox

if [[ -f ${HOME}"/.pythonrc.py" ]]; then
    export PYTHONSTARTUP=${HOME}'/.pythonrc.py'
fi

# Mac OS X {{{1
if [[ ${OSTYPE} == darwin* ]]; then
    # turn on colors
    export CLICOLOR=1
    #export LSCOLORS=ExFxCxDxBxegedabagacad
fi

# vim: fdm=marker fen
