# If not running interactively, don't do anything
# Important for ssh+svn support
if [[ -z ${PS1} ]]; then
    return
fi

# Terminal stuff {{{1
if [[ ${COLORTERM} == 'gnome-terminal' && ${TERM} == 'xterm' ]]; then
    TERM=gnome-256color
fi

if [[ ${TERM} != screen* ]]; then
    unset STY
    unset TMUX
fi

# if [[ -n ${STY} ]]; then
#     screen -X "shelltitle '% |zsh:'"
# fi

# Bash Options {{{1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file
shopt -s histappend
# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups

# Set a fancy prompt {{{1
# Color definitions {{{2
if [[ -x $(which tput) ]]; then
    COLORS=$(tput colors)
    None="\[$(tput sgr0)\]"
    if (( ${COLORS} >= 16 )); then
        # For 16+ color term {{{
        Black="\[$(tput setaf 0)\]"
        DarkGray="\[$(tput setaf 8)\]"
        LightGray="\[$(tput setaf 7)\]"
        White="\[$(tput setaf 15)\]"
        Red="\[$(tput setaf 9)\]"
        DarkRed="\[$(tput setaf 1)\]"
        Green="\[$(tput setaf 10)\]"
        DarkGreen="\[$(tput setaf 2)\]"
        Yellow="\[$(tput setaf 11)\]"
        DarkYellow="\[$(tput setaf 3)\]"
        Blue="\[$(tput setaf 12)\]"
        DarkBlue="\[$(tput setaf 4)\]"
        Magenta="\[$(tput setaf 13)\]"
        DarkMagenta="\[$(tput setaf 5)\]"
        Cyan="\[$(tput setaf 14)\]"
        DarkCyan="\[$(tput setaf 6)\]"
        BlackBg="\[$(tput setab 0)\]"
        DarkGrayBg="\[$(tput setab 8)\]"
        LightGrayBg="\[$(tput setab 7)\]"
        WhiteBg="\[$(tput setab 15)\]"
        RedBg="\[$(tput setab 9)\]"
        DarkRedBg="\[$(tput setab 1)\]"
        GreenBg="\[$(tput setab 10)\]"
        DarkGreenBg="\[$(tput setab 2)\]"
        YellowBg="\[$(tput setab 11)\]"
        DarkYellowBg="\[$(tput setab 3)\]"
        BlueBg="\[$(tput setab 12)\]"
        DarkBlueBg="\[$(tput setab 4)\]"
        MagentaBg="\[$(tput setab 13)\]"
        DarkMagentaBg="\[$(tput setab 5)\]"
        CyanBg="\[$(tput setab 14)\]"
        DarkCyanBg="\[$(tput setab 6)\]"
        # }}}
    elif (( ${COLORS} == 8 )); then
        # For 8 color term {{{
        Black="\[$(tput setaf 0)\]"
        DarkGray="\[$(tput setaf 0;tput bold)\]"
        LightGray="\[$(tput setaf 7)\]"
        White="\[$(tput setaf 7;tput bold)\]"
        Red="\[$(tput setaf 1;tput bold)\]"
        DarkRed="\[$(tput setaf 1)\]"
        Green="\[$(tput setaf 2;tput bold)\]"
        DarkGreen="\[$(tput setaf 2)\]"
        Yellow="\[$(tput setaf 3;tput bold)\]"
        DarkYellow="\[$(tput setaf 3)\]"
        Blue="\[$(tput setaf 4;tput bold)\]"
        DarkBlue="\[$(tput setaf 4)\]"
        Magenta="\[$(tput setaf 5;tput bold)\]"
        DarkMagenta="\[$(tput setaf 5)\]"
        Cyan="\[$(tput setaf 6;tput bold)\]"
        DarkCyan="\[$(tput setaf 6)\]"
        BlackBg="\[$(tput setab 0)\]"
        DarkGrayBg="\[$(tput setab 0;tput blink)\]"
        LightGrayBg="\[$(tput setab 7)\]"
        WhiteBg="\[$(tput setab 7;tput blink)\]"
        RedBg="\[$(tput setab 1;tput blink)\]"
        DarkRedBg="\[$(tput setab 1)\]"
        GreenBg="\[$(tput setab 2;tput blink)\]"
        DarkGreenBg="\[$(tput setab 2)\]"
        YellowBg="\[$(tput setab 3;tput blink)\]"
        DarkYellowBg="\[$(tput setab 3)\]"
        BlueBg="\[$(tput setab 4;tput blink)\]"
        DarkBlueBg="\[$(tput setab 4)\]"
        MagentaBg="\[$(tput setab 5;tput blink)\]"
        DarkMagentaBg="\[$(tput setab 5)\]"
        CyanBg="\[$(tput setab 6;tput blink)\]"
        DarkCyanBg="\[$(tput setab 6)\]"
        # }}}
    fi
else
    # {{{
    Black=""
    DarkGray=""
    LightGray=""
    White=""
    Red=""
    DarkRed=""
    Green=""
    DarkGreen=""
    Yellow=""
    DarkYellow=""
    Blue=""
    DarkBlue=""
    Magenta=""
    DarkMagenta=""
    Cyan=""
    DarkCyan=""
    BlackBg=""
    DarkGrayBg=""
    LightGrayBg=""
    WhiteBg=""
    RedBg=""
    DarkRedBg=""
    GreenBg=""
    DarkGreenBg=""
    YellowBg=""
    DarkYellowBg=""
    BlueBg=""
    DarkBlueBg=""
    MagentaBg=""
    DarkMagentaBg=""
    CyanBg=""
    DarkCyanBg=""
    None=""
    # }}}
fi
# }}}2
my_big_ps1="${None}(${Blue}\$?${None})--(${Cyan}\t${None})--(${Green}\u${None}@${Magenta}\h${None})--(${Red}\w${Yellow}\$(___git_ps1 ' %s')${None})\n\\$ "

my_small_ps1="${NONE}\w \\$ "
PS1=${my_big_ps1}

function prompt_command { #{{{2
    # If this is an xterm set the title to user@host:dir
    case ${TERM} in
        (xterm*|gnome*|konsole*|putty*|screen*)
            __xtermicontitle "${USER}@${HOSTNAME}: ${PWD}"
            ;;
    esac
    # If this is tmux or screen, print a bel
    if [[ ${TERM} == screen* && ( -n ${TMUX} || -n ${STY} ) ]]; then
        echo -ne "\a"
    fi
    # if [[ ${TERM} == screen* ]]; then
    #     __screentitle
    # fi
}

PROMPT_COMMAND=prompt_command

# Enable color support of ls and others {{{1
if [[ -x $(which dircolors) ]]; then
    if [[ -f ~/.dircolors-${COLORS} ]]; then
        eval "$(dircolors -b ~/.dircolors-${COLORS})"
    else
        eval "$(dircolors -b ~/.dircolors)"
    fi
fi

# Load other configurations {{{1
if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

if [[ -f ~/.bash_functions ]]; then
    source ~/.bash_functions
fi

# enable programmable completion features
if [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
fi

# }}}1
# vim: fdm=marker fen
