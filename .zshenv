# Variables {{{1
mailpath=/var/spool/mail/`whoami`?'You have mail in \$_'
WORDCHARS=${WORDCHARS:s#/#}

# History {{{2
HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000

# Function path {{{2
typeset -U fpath

if [[ -d ~/.zsh/functions ]]; then
    fpath=(~/.zsh/functions $fpath)
fi

# Terminal stuff {{{1
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

# }}}1
# vim: fdm=marker
