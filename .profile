# Terminal Stuff {{{1
# use ^? for backspace so ^H can be used for other things
tty -s && stty erase 

# Environment {{{1
# Path {{{2
# set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/bin" ]]; then
    PATH="${PATH}:${HOME}/bin"
fi
if [[ -d "/opt/local/bin" ]]; then
    PATH="/opt/local/bin:${PATH}"
fi
if [[ -d "/opt/local/sbin" ]]; then
    PATH="/opt/local/sbin:${PATH}"
fi
if [[ -d "/var/lib/gems/1.8/bin" ]]; then
    PATH="/var/lib/gems/1.8/bin:${PATH}"
fi

# Mac OS X options {{{3
if [[ "${OSTYPE}" == "darwin8.0" ]]; then
    if [[ -d "/usr/local/mysql/bin" ]]; then
        # include location of MySQL
        PATH="${PATH}:/usr/local/mysql/bin"
    fi
fi
#}}}3

export PATH
#}}}2

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# use a sensible editor
export EDITOR=vim

# use vim as my pager
export MANPAGER="/bin/sh -c \"col -b | view -c 'set ft=man' -\""

# use firefox when available
export BROWSER=firefox

export PYTHONSTARTUP=${HOME}/.pythonrc.py

# use Unicode
export LC_ALL=en_US.UTF-8

# Mac OS X options {{{2
if [[ "${OSTYPE}" == "darwin8.0" ]]; then
    # turn on colors
    export CLICOLOR=1
    #export LSCOLORS=ExFxCxDxBxegedabagacad
fi
#}}}2

#}}}1

# vim: fdm=marker
