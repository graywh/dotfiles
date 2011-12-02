# include .profile if it exists
if [[ -f ~/.profile ]]; then
    emulate sh -c '. ~/.profile'
fi

typeset -aU path

# vim: fdm=marker
