# Environment {{{1
# Path {{{2
if [ -d ~/bin ]; then
    PATH=${PATH}:~/bin
fi

export PATH
# }}}2

MAILPATH="/var/spool/mail/`whoami`?\"You have mail\""
export MAILPATH

EDITOR=vim
export EDITOR

MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\""
export MANPAGER

PYTHONSTARTUP=~/.pythonrc.py
export PYTHONSTARTUP

# GREP_OPTIONS='--color=auto --line-number --binary-files=without-match'
# export GREP_OPTIONS

GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWDIRTYSTATE
GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWSTASHSTATE
GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUNTRACKEDFILES

# Mac OS X options {{{2
if [ "${OSTYPE}" == darwin* ]; then
    # turn on colors
    CLICOLOR=1
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
# }}}1
# vim: fdm=marker
