# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

# turn on colors (Mac OS X Terminal.app)
export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    export PATH="~/bin:${PATH}"
fi

# include location of MySQL
export PATH="${PATH}:/usr/local/mysql/bin"

# export X11 Display
if [ "$OSTYPE" == "darwin8.0" ]; then
    export DISPLAY=:0.0
fi
