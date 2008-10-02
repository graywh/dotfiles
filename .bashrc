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

# use ^? for backspace so ^H can be used for other things
tty -s && stty erase 

if [[ "${COLORTERM}" == "gnome-terminal" ]]
then
    export TERM="gnome-256color"
fi

# Environment {{{1
# Path {{{2
# set PATH so it includes user's private bin if it exists
if [[ -d "~/bin" ]]
then
    PATH="${PATH}:~/bin"
fi
if [[ -d "/opt/local/bin" ]]
then
    PATH="/opt/local/bin:${PATH}"
fi
if [[ -d "/opt/local/sbin" ]]
then
    PATH="/opt/local/sbin:${PATH}"
fi
if [[ -d "/var/lib/gems/1.8/bin" ]]
then
    PATH="/var/lib/gems/1.8/bin:${PATH}"
fi

# Mac OS X options {{{3
if [[ "${OSTYPE}" == "darwin8.0" ]]
then
    if [[ -d /usr/local/mysql/bin ]]
    then
        # include location of MySQL
        PATH="${PATH}:/usr/local/mysql/bin"
    fi
fi
#}}}3

export PATH
#}}}2

# use a sensible editor
export EDITOR=vim

# use vim as my pager
export MANPAGER="/bin/sh -c \"col -b | view -c 'set ft=man' -\""

# use firefox when available
export BROWSER=firefox

export PYTHONSTARTUP=~/.pythonrc.py

# Override default setting of en_US.utf8
export LANG=en_US

# Mac OS X options {{{2
if [[ "${OSTYPE}" == "darwin8.0" ]]
then
    # turn on colors
    export CLICOLOR=1
    #export LSCOLORS=ExFxCxDxBxegedabagacad

    # export X11 Display (for Terminal.app)
    #export DISPLAY=:0.0
fi

# Bash Options {{{1
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Set a fancy prompt {{{1
# Color definitions {{{2
if (( "`tput colors`" >= 16 ))
then
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
    xterm*|gnome*|konsole*|putty*)
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

# Enable color support of ls {{{1
if [[ "${TERM}" != "dumb" ]]
then
    if [[ "${OSTYPE}" == "darwin8.0" ]]
    then
        alias ls='ls -FG'
    else
        # set LS_COLORS {{{2
        # Color definitions {{{3
        lsBlack="${Black//[/}"
        lsDarkGray="${DarkGray//[/}"
        lsLightGray="${LightGray//[/}"
        lsWhite="${White//[/}"
        lsRed="${Red//[/}"
        lsDarkRed="${DarkRed//[/}"
        lsGreen="${Green//[/}"
        lsDarkGreen="${DarkGreen//[/}"
        lsYellow="${Yellow//[/}"
        lsDarkYellow="${DarkYellow//[/}"
        lsBlue="${Blue//[/}"
        lsDarkBlue="${DarkBlue//[/}"
        lsMagenta="${Magenta//[/}"
        lsDarkMagenta="${DarkMagenta//[/}"
        lsCyan="${Cyan//[/}"
        lsDarkCyan="${DarkCyan//[/}"
        lsBlackBg="${BlackBg//[/}"
        lsDarkGrayBg="${DarkGrayBg//[/}"
        lsLightGrayBg="${LightGrayBg//[/}"
        lsWhiteBg="${WhiteBg//[/}"
        lsRedBg="${RedBg//[/}"
        lsDarkRedBg="${DarkRedBg//[/}"
        lsGreenBg="${GreenBg//[/}"
        lsDarkGreenBg="${DarkGreenBg//[/}"
        lsYellowBg="${YellowBg//[/}"
        lsDarkYellowBg="${DarkYellowBg//[/}"
        lsBlueBg="${BlueBg//[/}"
        lsDarkBlueBg="${DarkBlueBg//[/}"
        lsMagentaBg="${MagentaBg//[/}"
        lsDarkMagentaBg="${DarkMagentaBg//[/}"
        lsCyanBg="${CyanBg//[/}"
        lsDarkCyanBg="${DarkCyanBg//[/}"
        lsBlack="${lsBlack//m/}"
        lsDarkGray="${lsDarkGray//m/}"
        lsLightGray="${lsLightGray//m/}"
        lsWhite="${lsWhite//m/}"
        lsRed="${lsRed//m/}"
        lsDarkRed="${lsDarkRed//m/}"
        lsGreen="${lsGreen//m/}"
        lsDarkGreen="${lsDarkGreen//m/}"
        lsYellow="${lsYellow//m/}"
        lsDarkYellow="${lsDarkYellow//m/}"
        lsBlue="${lsBlue//m/}"
        lsDarkBlue="${lsDarkBlue//m/}"
        lsMagenta="${lsMagenta//m/}"
        lsDarkMagenta="${lsDarkMagenta//m/}"
        lsCyan="${lsCyan//m/}"
        lsDarkCyan="${lsDarkCyan//m/}"
        lsBlackBg="${lsBlackBg//m/}"
        lsDarkGrayBg="${lsDarkGrayBg//m/}"
        lsLightGrayBg="${lsLightGrayBg//m/}"
        lsWhiteBg="${lsWhiteBg//m/}"
        lsRedBg="${lsRedBg//m/}"
        lsDarkRedBg="${lsDarkRedBg//m/}"
        lsGreenBg="${lsGreenBg//m/}"
        lsDarkGreenBg="${lsDarkGreenBg//m/}"
        lsYellowBg="${lsYellowBg//m/}"
        lsDarkYellowBg="${lsDarkYellowBg//m/}"
        lsBlueBg="${lsBlueBg//m/}"
        lsDarkBlueBg="${lsDarkBlueBg//m/}"
        lsMagentaBg="${lsMagentaBg//m/}"
        lsDarkMagentaBg="${lsDarkMagentaBg//m/}"
        lsCyanBg="${lsCyanBg//m/}"
        lsDarkCyanBg="${lsDarkCyanBg//m/}"
        #}}}3
        export LS_COLORS="no=00:fi=00:di=${lsBlue}:ln=${lsCyan}:pi=${lsBlackBg};${lsDarkYellow}:so=${lsMagenta}:do=${lsMagenta}:bd=${lsBlackBg};${lsYellow}:cd=${lsBlackBg};${lsDarkYellow}:or=${lsBlackBg};${lsRed}:su=${lsWhite};${lsDarkRedBg}:sg=${lsBlack};${lsDarkYellowBg}:tw=${lsBlack};${lsDarkGreenBg}:ow=${lsBlue};${lsDarkGreenBg}:st=${lsWhite};${lsDarkBlueBg}:ex=${lsGreen}:*.tar=${lsRed}:*.tgz=${lsRed}:*.arj=${lsRed}:*.taz=${lsRed}:*.lzh=${lsRed}:*.zip=${lsRed}:*.z=${lsRed}:*.Z=${lsRed}:*.gz=${lsRed}:*.bz2=${lsRed}:*.deb=${lsRed}:*.rpm=${lsRed}:*.jar=${lsRed}:*.jpg=${lsMagenta}:*.jpeg=${lsMagenta}:*.gif=${lsMagenta}:*.bmp=${lsMagenta}:*.pbm=${lsMagenta}:*.pgm=${lsMagenta}:*.ppm=${lsMagenta}:*.tga=${lsMagenta}:*.xbm=${lsMagenta}:*.xpm=${lsMagenta}:*.tif=${lsMagenta}:*.tiff=${lsMagenta}:*.png=${lsMagenta}:*.mov=${lsMagenta}:*.mpg=${lsMagenta}:*.mpeg=${lsMagenta}:*.avi=${lsMagenta}:*.fli=${lsMagenta}:*.gl=${lsMagenta}:*.dl=${lsMagenta}:*.xcf=${lsMagenta}:*.xwd=${lsMagenta}:*.ogg=${lsMagenta}:*.flac=${lsMagenta}:*.mpc=${lsMagenta}:*.mp3=${lsMagenta}:*.wav=${lsMagenta}:"
        # }}}
        alias ls='ls -F --color=auto'
    fi
fi

# Aliases {{{1
# some more ls aliases
alias la='ls -A'
#alias l.='ls -d .*' # make better
alias ll='ls -hl'
alias lla='ll -A'
#alias ll.='ll -d .*' # make better
alias xtermIrssi='xterm +sb -T Irssi -geometry 100x25 -e "screen -c ~/.screenrc-irssi -S irssi"'
alias xtermIrssiR='xterm +sb -T Irssi -geometry 100x25 -e "screen -r irssi"'
alias xtermIrssiX='xterm +sb -T Irssi -geometry 100x25 -e "screen -x irssi"'
alias Irssi='___xtermtitle "Irssi";screen -c ~/.screenrc-irssi -S irssi'
alias IrssiR='___xtermtitle "Irssi";screen -r irssi'
alias IrssiX='___xtermtitle "Irssi";screen -x irssi'

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
if [[ -f "/etc/bash_completion" ]]
then
  . /etc/bash_completion
fi

# include the local system modifications
if [[ -f "~/.bashrc_local" ]]
then
  . ~/.bashrc_local
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
    if [[ -n "${g}" ]]
    then
        if [[ "${g}" == ".git" ]]
        then
            __git_ps1 " %s"
        fi
        g=${g#$HOME/}
        if [[ "${g}" == ".git" ]]
        then
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
