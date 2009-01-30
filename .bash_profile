# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

# include .profile if it exists
if [[ -f ${HOME}/.profile ]]; then
    . ${HOME}/.profile
fi

# include .bashrc if it exists
if [[ -f ${HOME}/.bashrc ]]; then
    . ${HOME}/.bashrc
fi

# vim: fdm=marker
