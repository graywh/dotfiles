# Variables {{{1
typeset -aU path # b/c GDM uses .profile instead of .zprofile

mailpath=/var/spool/mail/$(whoami)?'You have mail in $_'
WORDCHARS='*?_-.~=&;!#$%^<>'

export EDITOR=vim
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\""
export PYTHONSTARTUP=~/.pythonrc.py
# export GREP_OPTIONS='--color=auto --line-number --binary-files=without-match'

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

# Mac OS X {{{2
if [[ ${OSTYPE} == darwin* ]]; then
    # turn on colors
    CLICOLOR=1
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
fi

# History {{{2
HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000

# Function path {{{2
typeset -aU fpath

if [[ -d ~/.zsh/functions ]]; then
    fpath=(~/.zsh/functions $fpath)
fi

# Terminal stuff {{{1
if [[ ${COLORTERM} == 'gnome-terminal' ]]; then
    TERM=gnome-256color
fi

# Don't let these variables be propogated {{{1
# (usually when starting a new terminal)
if [[ ${TERM} != screen* ]]; then
    unset STY
    unset TMUX
fi

# }}}1
# vim: fdm=marker
