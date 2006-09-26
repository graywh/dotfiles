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
    #eval `dircolors -b`
    LS_COLORS='no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:do=00;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.avi=00;35:*.fli=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.ogg=00;35:*.mp3=00;35:*.wav=00;35:';
    export LS_COLORS
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
# red = 31, green = 32, yellow = 33, blue = 34, bold = 1;
# change color \[\033[*;**m\]
#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
PS1='\[\033[32m\][\u@\h:\[\033[31m\]\w\[\033[32m\]]\n\$\[\033[0m\] '

# a function to put the current time in the top-right corner of the terminal
# and change the title of the terminal
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
