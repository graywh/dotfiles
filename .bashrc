# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# disable messages
mesg n

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval `dircolors -b`
    alias ls='ls -hFG --color=always'
    #alias dir='ls -l'
    #alias vdir='ls -C'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -a'
#alias dir='ll -A'
alias lla='ls -la'
#alias vnc='vncserver -geometry 1152x864'
#alias vnckill='vncserver -kill'

# set a fancy prompt
# red = 31, blue = 34, green = 32, yellow = 33, bold = 1;
# change color \[\033[*;**m\]
#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
PS1='\[\033[32m\][\u@\h:\[\033[31m\]\w\[\033[32m\]]\n\$\[\033[0m\] '

# a function to put the current time in the top-right corner of the terminal
function prompt_command
{
    # If this is an xterm set the title to user@host:dir
    case $TERM in
    xterm*)
        echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
        ;;
    *)
        ;;
    esac

    #  prompt_x is where to position the cursor to write the clock
    let prompt_x=$(tput cols)-10
    #  Move up one; not sure why we need to do this, but without this, I always
    #  got an extra blank line between prompts
    # tput cuu1
    tput sc
    tput cup 1 ${prompt_x}
    echo -en "\033[32m[$(date +%H:%M:%S)]"
    tput rc
}

PROMPT_COMMAND=prompt_command

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#  . /etc/bash_completion
#fi

function calc()
{
    echo "$@" | bc -l
}
