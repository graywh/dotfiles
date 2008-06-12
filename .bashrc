# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
# Important for ssh+svn support
[ -z "$PS1" ] && return

# Path {{{
# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    export PATH="${PATH}:~/bin"
fi

# Mac OS X options {{{2
if [ "$OSTYPE" == "darwin8.0" ]; then
    # include location of MySQL
    export PATH="${PATH}:/usr/local/mysql/bin"
fi
# }}}1

# Environment variables {{{1
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
if [ "$OSTYPE" == "darwin8.0" ]; then
    # turn on colors
    export CLICOLOR=1
    #export LSCOLORS=ExFxCxDxBxegedabagacad

    # export X11 Display (for Terminal.app)
    export DISPLAY=:0.0
fi
# }}}1

# Bash Options {{{1
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# }}}1

# Terminal stuff {{{1
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# use ^? for backspace so ^H can be used for other things
if tty -s; then
    stty erase '^?'
fi
# }}}1

# enable color support of ls {{{1
# 38;5;___ for 256 color support
if [ "$TERM" != "dumb" ]; then
    if [ "$OSTYPE" == "darwin8.0" ]; then
        alias ls='ls -FG'
    else
        # set LS_COLORS {{{2
        export LS_COLORS='no=00:fi=00:di=38;5;12:ln=38;5;14:pi=40;33:so=38;5;13:do=38;5;13:bd=40;33;01:cd=40;33:or=40;38;5;9:su=38;5;15;41:sg=30;43:tw=30;42:ow=38;5;12;42:st=38;5;15;44:ex=38;5;10:*.tar=38;5;9:*.tgz=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lzh=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.gz=38;5;9:*.bz2=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.ogg=38;5;13:*.flac=38;5;13:*.mpc=38;5;13:*.mp3=38;5;13:*.wav=38;5;13:'
        # }}}
        alias ls='ls -F --color=auto'
    fi
fi
# }}}

# Aliases {{{1
# some more ls aliases
alias la='ls -A'
alias l.='ls -d .*' # make better
alias ll='ls -hl'
alias lla='ll -A'
alias ll.='ll -d .*' # make better
# }}}

# Set a fancy prompt {{{
# red = 31, green = 32, yellow = 33, blue = 34, bold = 1;
# change color \[\033[*;**m\]
#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# Color definitions {{{
if [ `tput colors` == 256 ]; then
    # For 256 color term {{{
    #Foreground="[38;5;${n}m"
    #Background="[48;5;${n}m"
    Black="[38;5;0m"
    DarkGray="[38;5;8m"
    LightGray="[38;5;7m"
    White="[38;5;15m"
    Red="[38;5;9m"
    DarkRed="[38;5;1m"
    Green="[38;5;10m"
    DarkGreen="[38;5;2m"
    Yellow="[38;5;11m"
    DarkYellow="[38;5;3m"
    Blue="[38;5;12m"
    DarkBlue="[38;5;4m"
    Magenta="[38;5;13m"
    DarkMagenta="[38;5;5m"
    Cyan="[38;5;14m"
    DarkCyan="[38;5;6m"
    # }}}
else
    # For 8/16 color term {{{
    Black="[30m"
    DarkGray="[1;30m"
    LightGray="[37m"
    White="[1;37m"
    Red="[31m"
    BoldRed="[1;31m"
    Green="[32m"
    BoldGreen="[1;32m"
    Yellow="[33m"
    BoldYellow="[1;33m"
    Blue="[34m"
    BoldBlue="[1;34m"
    Magenta="[35m"
    BoldMagenta="[1;35m"
    Cyan="[36m"
    BoldCyan="[1;36m"
    # }}}
fi
None="[0m"
# }}}
PS1='$Green[\u@\h:$Red\w$Yellow$(git_branch)$Green]\n\$$None '

# a function to put the current time in the top-right corner of the terminal
# and change the title of the terminal
# function prompt_command {{{
function prompt_command
{
    # If this is an xterm set the title to user@host:dir
    case $TERM in
    xterm*|gnome-*|putty)
        echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
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
    #echo -en "$Green[$(date +%H:%M:%S)]$None"
    #tput rc
}
# }}}

PROMPT_COMMAND=prompt_command
# }}}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# include the local system modifications
if [ -f ~/.bashrc_local ]; then
  . ~/.bashrc_local
fi

# Functions {{{
function calc() {
    echo "$@" | bc -l
}

function git_branch() {
    git name-rev HEAD 2> /dev/null | sed s/^HEAD//
}
# }}}

# vim: fdm=marker
