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
# 38;5;___m for 256 color support
if [ "$TERM" != "dumb" ]; then
    alias ls='ls -F'
    
    if [ "$OSTYPE" != "darwin8.0" ]; then
    {
        export LS_COLORS='no=00:fi=00:di=38;5;12:ln=38;5;14:pi=40;33:so=38;5;13:do=38;5;13:bd=40;33;01:cd=40;33:or=40;38;5;9:su=38;5;15;41:sg=30;43:tw=30;42:ow=38;5;12;42:st=38;5;15;44:ex=38;5;10:*.tar=38;5;9:*.tgz=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lzh=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.gz=38;5;9:*.bz2=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.ogg=38;5;13:*.flac=38;5;13:*.mpc=38;5;13:*.mp3=38;5;13:*.wav=38;5;13:'
        alias ls='ls -F --color=always'
    }
    fi
fi

# some more ls aliases
alias ll='ls -hlFG'
alias la='ls -AF'
alias lla='ls -hlAFG'

# set a fancy prompt
# red = 31, green = 32, yellow = 33, blue = 34, bold = 1;
# change color \[\033[*;**m\]
#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# Color definitions
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
None="[0m"
PS1='$Green[\u@\h:$Red\w$Green]\n\$$None '

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
    # But I did not.
    #tput cuu1
    tput sc
    tput cup 1 ${prompt_x}
    echo -en "$Green[$(date +%H:%M:%S)]$None"
    tput rc
}

PROMPT_COMMAND=prompt_command

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

function calc()
{
    echo "$@" | bc -l
}
