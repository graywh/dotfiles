typeset -U path

# include .profile if it exists
if [[ -f ~/.profile ]]; then
    emulate sh -c '. ~/.profile'
fi


# vim: fdm=marker
