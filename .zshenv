export GPGKEY=17F954B1

# Terminal Stuff {{{1
if [[ ${COLORTERM} == "gnome-terminal" ]]; then
    TERM="gnome-256color"
    unset COLORTERM
fi

# Don't let these variables be propogated {{{1
# (usually when starting a new terminal)
if [[ ${TERM} != screen* ]]; then
    unset STY
    unset TMUX
fi

# vim: fdm=marker fen
