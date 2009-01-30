# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
# Important for ssh+svn support
[[ -z "${PS1}" ]] && return

# Terminal stuff {{{1
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [[ "${COLORTERM}" == "gnome-terminal" ]]; then
    export TERM="gnome-256color"
fi

# Set a fancy prompt {{{1
# Color definitions {{{2
if (( "`tput colors`" >= 16 )); then
    # For 16+ color term {{{
    Black="$(tput setaf 0)"
    DarkGray="$(tput setaf 8)"
    LightGray="$(tput setaf 7)"
    White="$(tput setaf 15)"
    Red="$(tput setaf 9)"
    DarkRed="$(tput setaf 1)"
    Green="$(tput setaf 10)"
    DarkGreen="$(tput setaf 2)"
    Yellow="$(tput setaf 11)"
    DarkYellow="$(tput setaf 3)"
    Blue="$(tput setaf 12)"
    DarkBlue="$(tput setaf 4)"
    Magenta="$(tput setaf 13)"
    DarkMagenta="$(tput setaf 5)"
    Cyan="$(tput setaf 14)"
    DarkCyan="$(tput setaf 6)"
    BlackBg="$(tput setab 0)"
    DarkGrayBg="$(tput setab 8)"
    LightGrayBg="$(tput setab 7)"
    WhiteBg="$(tput setab 15)"
    RedBg="$(tput setab 9)"
    DarkRedBg="$(tput setab 1)"
    GreenBg="$(tput setab 10)"
    DarkGreenBg="$(tput setab 2)"
    YellowBg="$(tput setab 11)"
    DarkYellowBg="$(tput setab 3)"
    BlueBg="$(tput setab 12)"
    DarkBlueBg="$(tput setab 4)"
    MagentaBg="$(tput setab 13)"
    DarkMagentaBg="$(tput setab 5)"
    CyanBg="$(tput setab 14)"
    DarkCyanBg="$(tput setab 6)"
    # }}}
else
    # For 8 color term {{{
    Black="$(tput setaf 0)"
    DarkGray="$(tput setaf 0;tput bold)"
    LightGray="$(tput setaf 7)"
    White="$(tput setaf 7;tput bold)"
    Red="$(tput setaf 1;tput bold)"
    DarkRed="$(tput setaf 1)"
    Green="$(tput setaf 2;tput bold)"
    DarkGreen="$(tput setaf 2)"
    Yellow="$(tput setaf 3;tput bold)"
    DarkYellow="$(tput setaf 3)"
    Blue="$(tput setaf 4;tput bold)"
    DarkBlue="$(tput setaf 4)"
    Magenta="$(tput setaf 5;tput bold)"
    DarkMagenta="$(tput setaf 5)"
    Cyan="$(tput setaf 6;tput bold)"
    DarkCyan="$(tput setaf 6)"
    BlackBg="$(tput setab 0)"
    DarkGrayBg="$(tput setab 0;tput blink)"
    LightGrayBg="$(tput setab 7)"
    WhiteBg="$(tput setab 7;tput blink)"
    RedBg="$(tput setab 1;tput blink)"
    DarkRedBg="$(tput setab 1)"
    GreenBg="$(tput setab 2;tput blink)"
    DarkGreenBg="$(tput setab 2)"
    YellowBg="$(tput setab 3;tput blink)"
    DarkYellowBg="$(tput setab 3)"
    BlueBg="$(tput setab 4;tput blink)"
    DarkBlueBg="$(tput setab 4)"
    MagentaBg="$(tput setab 5;tput blink)"
    DarkMagentaBg="$(tput setab 5)"
    CyanBg="$(tput setab 6;tput blink)"
    DarkCyanBg="$(tput setab 6)"
    # }}}
fi
None="$(tput sgr0)"
#}}}2
PS1="${Green}[\u@\h:${Red}\w${Yellow}\$(___git_ps1)${Green}]\n${None}\$ "

# a function to put the current time in the top-right corner of the terminal
# and change the title of the terminal
function prompt_command { #{{{2
    # If this is an xterm set the title to user@host:dir
    case $TERM in
    xterm*|screen*|gnome*|konsole*|putty*)
        echo -ne "\e]0;${USER}@${HOSTNAME}: ${PWD}\a"
        ;;
    *)
        ;;
    esac

    #  prompt_x is where to position the cursor to write the clock
    #let prompt_x=$(tput cols)-10
    #  Move up one; not sure why we need to do this, but without this, I always
    #  got an extra blank line between prompts
    # But I did not.
    #tput cuu1
    #tput sc
    #tput cup 1 ${prompt_x}
    #echo -en "${Green}[$(date +%H:%M:%S)]${None}"
    #tput rc
}

PROMPT_COMMAND=prompt_command

# Enable color support of ls and others {{{1
if [[ "${TERM}" != "dumb" ]]; then
    if [[ -x /usr/bin/dircolors ]]; then
        eval $(dircolors -b $HOME/.dircolors-$(tput colors))
        alias ls='ls -F --color=auto'
        alias grep='grep --color=auto'
        alias egrep='egrep --color=auto'
    elif [[ "${OSTYPE}" =~ "darwin" ]]; then
        alias ls='ls -FG'
    fi
fi

# Aliases {{{1
# some more ls aliases
alias la='ls -A'
alias ll='ls -hl'
alias lla='ll -A'
alias XtermIrssi='xterm +sb -T Irssi -geometry 100x25 -fs 9 -e "screen -c ${HOME}/.screenrc-irssi"'
alias XtermIrssiR='xterm +sb -T Irssi -geometry 100x25 -fs 9 -e "screen -r irssi"'
alias XtermIrssiX='xterm +sb -T Irssi -geometry 100x25 -fs 9 -e "screen -x irssi"'
alias Irssi='resize -s 25 100;___xtermtitle "Irssi";screen -c ${HOME}/.screenrc-irssi'
alias IrssiR='resize -s 25 100;___xtermtitle "Irssi";screen -r irssi'
alias IrssiX='resize -s 25 100;___xtermtitle "Irssi";screen -x irssi'
#if [[ $TERM == screen* ]]; then
#    alias vim='screen -t vim vim'
#    alias view='screen -t vim view'
#fi

function l.() {
    olddir=$PWD
    cd $1
    ls -d .*
    cd $olddir
    unset olddir
}
function ll.() {
    olddir=$PWD
    cd $1
    ls -dhl .*
    cd $olddir
    unset olddir
}

# Load other bash configurations {{{1
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc).
if [[ -f "/etc/bash_completion" ]]; then
  . /etc/bash_completion
fi

# include the local system modifications
if [[ -f "${HOME}/.bashrc_local" ]]; then
  . ${HOME}/.bashrc_local
fi

# Functions {{{1
function calc {
    echo "$@" | bc -l
}

function ___git_branch {
    local base_dir=$(git rev-parse --show-cdup 2>/dev/null) || return 1
    local ref=$(git-symbolic-ref -q HEAD || git-name-rev --name-only HEAD 2>/dev/null)
    ref=${ref#refs/heads/}
    echo " ${ref}"
}

function ___git_ps1 { # reference __git_ps1
    local g=$(git rev-parse --git-dir 2>/dev/null)
    if [[ -n "${g}" ]]; then
        if [[ "${g}" == ".git" ]]; then
            __git_ps1 " %s"
        fi
        g=${g#$HOME/}
        if [[ "${g}" == ".git" ]]; then
            local p=$(git rev-parse --show-prefix 2>/dev/null)
            case $p in
            .dotfiles/*|.vim/*)
                __git_ps1 " %s"
                ;;
            esac
        else
            __git_ps1 " %s"
        fi
    fi
}

function ___xtermtitle {
    echo -ne "\e]0;${1}\a"
}

#}}}1

# vim: fdm=marker
