mailpath=(/var/spool/mail/`whoami`'?You have mail')

# Terminal stuff {{{1
if [[ ${COLORTERM} == "gnome-terminal" ]]; then
    TERM="gnome-256color"
    unset COLORTERM
fi

# Don't let these variables be propogated {{{1
if [[ ${TERM} != screen* ]]; then
    unset INTERM
    unset STY
fi

# vim: fdm=marker fen
