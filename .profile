# Terminal Stuff {{{1
# use ^? for backspace
tty -s && stty erase 

# Environment {{{1
# Path {{{2
if [ -d "${HOME}/bin" ]; then
    PATH="${PATH}:${HOME}/bin"
fi
if [ -d "/opt/local/bin" ]; then
    PATH="/opt/local/bin:${PATH}"
fi
if [ -d "/opt/local/sbin" ]; then
    PATH="/opt/local/sbin:${PATH}"
fi
if [ -d "/var/lib/gems/1.8/bin" ]; then
    PATH="/var/lib/gems/1.8/bin:${PATH}"
fi

export PATH
#}}}2

MAILPATH="/var/spool/mail/`whoami`?\"You have mail\""
export MAILPATH

EDITOR=vim
export EDITOR

MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -c 'nnoremap <buffer> q ZQ' -\""
export MANPAGER

BROWSER=firefox
export BROWSER

PYTHONSTARTUP=${HOME}/.pythonrc.py
export PYTHONSTARTUP

# Mac OS X options {{{2
if [ "${OSTYPE}" == darwin* ]; then
    # turn on colors
    CLICOLOR=1
    export CLICOLOR
    #LSCOLORS=ExFxCxDxBxegedabagacad
    #export LSCOLORS
fi
#}}}2

#}}}1

# vim: fdm=marker
