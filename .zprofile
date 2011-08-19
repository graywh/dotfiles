# Path {{{1
if [[ -d ${HOME}'/bin' ]]; then
    path=($path ${HOME}'/bin')
fi

typeset -U path
# }}}1

export EDITOR=vim
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\""
export PYTHONSTARTUP=${HOME}'/.pythonrc.py'

# Mac OS X {{{1
if [[ ${OSTYPE} == darwin* ]]; then
    # turn on colors
    export CLICOLOR=1
    # 0 a - black   , -------------------- DIR
    # 1 b - red     | ,------------------- SYM_LINK
    # 2 c - green   | | ,----------------- SOCKET
    # 3 d - yellow  | | | ,--------------- PIPE
    # 4 e - blue    | | | | ,------------- EXE
    # 5 f - magenta | | | | | ,----------- BLOCK_SP
    # 6 g - cyan    | | | | | | ,--------- CHAR_SP
    # 7 h - gray    | | | | | | | ,------- EXE_SUID
    #   x - default | | | | | | | | ,----- EXE_GUID
    # fore/back     | | | | | | | | | ,--- DIR_STICKY
    # upper = bold  | | | | | | | | | | ,- DIR_WO_STICKY
    export LSCOLORS=ExGxFxdaCxdadahbadheec
fi
# }}}1

# vim: fdm=marker
