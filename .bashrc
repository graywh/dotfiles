# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
# Important for ssh+svn support
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
    alias ls='ls -F'
    
    if [ "$OSTYPE" != "darwin8.0" ]; then
    {
        export LS_COLORS='no=00:fi=00:di=34:ln=36:pi=40;33:so=35:do=35:bd=40;33;01:cd=40;33:or=40;31:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=32:*.tar=31:*.tgz=31:*.arj=31:*.taz=31:*.lzh=31:*.zip=31:*.z=31:*.Z=31:*.gz=31:*.bz2=31:*.deb=31:*.rpm=31:*.jar=31:*.jpg=35:*.jpeg=35:*.gif=35:*.bmp=35:*.pbm=35:*.pgm=35:*.ppm=35:*.tga=35:*.xbm=35:*.xpm=35:*.tif=35:*.tiff=35:*.png=35:*.mov=35:*.mpg=35:*.mpeg=35:*.avi=35:*.fli=35:*.gl=35:*.dl=35:*.xcf=35:*.xwd=35:*.ogg=35:*.flac=35:*.mpc=35:*.mp3=35:*.wav=35:'
        alias ls='ls -F --color=always'
    }
    fi
fi

# some more ls aliases
alias ll='ls -hlF'
alias la='ls -AF'
alias lla='ls -hlAF'

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
    #case $TERM in
    #xterm*)
    #    echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
    #    ;;
    #*)
    #    ;;
    #esac

    #  prompt_x is where to position the cursor to write the clock
    let prompt_x=$(tput cols)-10
    #  Move up one; not sure why we need to do this, but without this, I always
    #  got an extra blank line between prompts
    #tput cuu1
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
