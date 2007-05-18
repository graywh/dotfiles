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
    alias ls='ls -F'
    
    if [ "$OSTYPE" != "darwin8.0" ]; then
    {
        export LS_COLORS='no=00:fi=00:di=33:ln=36:pi=40;33:so=35:do=35:bd=40;33;01:cd=40;33:or=40;31:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=32:*.tar=31:*.tgz=31:*.arj=31:*.taz=31:*.lzh=31:*.zip=31:*.z=31:*.Z=31:*.gz=31:*.bz2=31:*.deb=31:*.rpm=31:*.jar=31:*.jpg=35:*.jpeg=35:*.gif=35:*.bmp=35:*.pbm=35:*.pgm=35:*.ppm=35:*.tga=35:*.xbm=35:*.xpm=35:*.tif=35:*.tiff=35:*.png=35:*.mov=35:*.mpg=35:*.mpeg=35:*.avi=35:*.fli=35:*.gl=35:*.dl=35:*.xcf=35:*.xwd=35:*.ogg=35:*.flac=35:*.mpc=35:*.mp3=35:*.wav=35:'
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
Black="$(tput setaf 0)"
BlackBG="$(tput setab 0)"
DarkGray="$(tput setaf 8)"
LightGray="$(tput setaf 7)"
LightGrayBG="$(tput setab 7)"
White="$(tput setaf 15)"
Red="$(tput setaf 9)"
DarkRed="$(tput setaf 1)"
RedBG="$(tput setab 1)"
Green="$(tput setaf 10)"
DarkGreen="$(tput setaf 2)"
GreenBG="$(tput setab 2)"
Yellow="$(tput setaf 11)"
DarkYellow="$(tput setaf 3)"
YellowBG="$(tput setab 3)"
Blue="$(tput setaf 12)"
DarkBlue="$(tput setaf 4)"
BlueBG="$(tput setab 4)"
Magenta="$(tput setaf 13)"
DarkMagenta="$(tput setaf 5)"
MagentaBG="$(tput setab 5)"
Cyan="$(tput setaf 14)"
DarkCyan="$(tput setaf 6)"
CyanBG="$(tput setab 6)"
None="$(tput sgr0)"
PS1='\[$Green\][\u@\h:\[$Red\]\w\[$Green\]]\n\$\[$None\] '

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
    tput setf 10
    echo -en "[$(date +%H:%M:%S)]"
    tput sgr0
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
