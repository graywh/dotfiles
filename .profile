# Terminal Stuff {{{1
# use ^? for backspace
tty -s && stty erase 

# Environment {{{1
# Path {{{2
if [ -d "${HOME}/bin" ]; then
    PATH="${PATH}:${HOME}/bin"
fi

export PATH
#}}}2

MAILPATH="/var/spool/mail/`whoami`?\"You have mail\""
export MAILPATH

EDITOR=vim
export EDITOR

MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\""
export MANPAGER

PYTHONSTARTUP=${HOME}/.pythonrc.py
export PYTHONSTARTUP

# Mac OS X options {{{2
if [ "${OSTYPE}" == darwin* ]; then
    # turn on colors
    export CLICOLOR
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
    LSCOLORS=ExGxFxdaCxdadahbadheec
    export LSCOLORS
fi
#}}}1
# vim: fdm=marker
