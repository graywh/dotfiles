[[ -o nointeractive ]] && return

# if [[ -n ${STY} ]]; then
#     screen -X "shelltitle '% |zsh:'"
# fi

autoload zsh/terminfo

# Options {{{1
# Changing directories {{{2
setopt   autopushd
setopt   pushdignoredups
# Completion {{{2
setopt noalwayslastprompt
# setopt noautolist
setopt noautomenu
setopt noautonamedirs
setopt   listpacked
# Expansion and globbing {{{2
setopt nomarkdirs
setopt nonomatch
# History {{{2
setopt   histignoredups
setopt   histreduceblanks
setopt   sharehistory
# Job control {{{2
setopt nohup
setopt   longlistjobs
# Prompting {{{2
setopt   promptsubst
# Zle {{{2
setopt nobeep

# Completion {{{1
autoload -U compinit
compinit

# Complete uppercase when lowercase was typed
zstyle :completion:* matcher-list 'm:{a-z-}={A-Z_}' # allows lower->upper
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # adds upper->lower

# Better handling of rake tasks
zstyle :completion:* matcher-list 'r:|[:]=*'

# Page long lists
zstyle :completion:* list-prompt '%S%L -- More --%s'

# Warn when nothing found
zstyle :completion:*:warnings format '%BNo matches for: %d%b'

# Complete hosts from ssh_config
zstyle :completion:*:hosts use-ssh-config on
zstyle *:my-accounts users-hosts rails@cbc biostat@cbc

# Keybindings {{{1
bindkey -e
# Navigation {{{2
# line
bindkey "\e[1~" vi-beginning-of-line
bindkey "\e[H" vi-beginning-of-line
bindkey '^A' vi-beginning-of-line
bindkey "\e[4~" vi-end-of-line
bindkey "\e[F" vi-end-of-line
bindkey '^E' vi-end-of-line
# word
bindkey "\e[1;2D" backward-word
bindkey "\e[1;9D" backward-word
bindkey "\e[1;5D" vi-backward-blank-word
bindkey "\e[1;2C" forward-word
bindkey "\e[1;9C" forward-word
bindkey "\e[1;5C" vi-forward-blank-word
# char
# bindkey "^B" backward-char
bindkey "^H" backward-char
# bindkey "^F" forward-char
# History {{{2
# bindkey "\e[5;5~" beginning-of-history
# bindkey "\e[6;5~" end-of-history
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
# Editing {{{2
bindkey "\e[2~" vi-quoted-insert
bindkey "\e[3~" delete-char
# bindkey '^K' kill-line
bindkey '^U' backward-kill-line
# bindkey '^W' backward-kill-word
# bindkey '^?' backward-delete-char
# Completion {{{2
bindkey '^I' expand-or-complete
# bindkey "\e[Z" reverse-menu-complete
# Misc {{{2
bindkey '^J' self-insert-unmeta
[[ ${TERM} == 'dumb' ]] && bindkey '^J' accept-line # for vim
bindkey '^O' push-input
bindkey '^T' get-line
bindkey '^Y' undo

# From Debian/Ubuntu {{{3
if [[ ${TERM} != 'emacs' ]]; then
    [[ -z ${terminfo[kdch1]} ]] || bindkey -M emacs ${terminfo[kdch1]} delete-char
    [[ -z ${terminfo[khome]} ]] || bindkey -M emacs ${terminfo[khome]} beginning-of-line
    [[ -z ${terminfo[kend]} ]] || bindkey -M emacs ${terminfo[kend]} end-of-line
    [[ -z ${terminfo[kich1]} ]] || bindkey -M emacs ${terminfo[kich1]} overwrite-mode
    [[ -z ${terminfo[kdch1]} ]] || bindkey -M vicmd ${terminfo[kdch1]} vi-delete-char
    [[ -z ${terminfo[khome]} ]] || bindkey -M vicmd ${terminfo[khome]} vi-beginning-of-line
    [[ -z ${terminfo[kend]} ]] || bindkey -M vicmd ${terminfo[kend]} vi-end-of-line
    [[ -z ${terminfo[kich1]} ]] || bindkey -M vicmd ${terminfo[kich1]} overwrite-mode

    [[ -z ${terminfo[cuu1]} ]] || bindkey -M viins ${terminfo[cuu1]} vi-up-line-or-history
    [[ -z ${terminfo[cuf1]} ]] || bindkey -M viins ${terminfo[cuf1]} vi-forward-char
    [[ -z ${terminfo[kcuu1]} ]] || bindkey -M viins ${terminfo[kcuu1]} vi-up-line-or-history
    [[ -z ${terminfo[kcud1]} ]] || bindkey -M viins ${terminfo[kcud1]} vi-down-line-or-history
    [[ -z ${terminfo[kcuf1]} ]] || bindkey -M viins ${terminfo[kcuf1]} vi-forward-char
    [[ -z ${terminfo[kcub1]} ]] || bindkey -M viins ${terminfo[kcub1]} vi-backward-char

    # ncurses fogyatekos
    [[ ${terminfo[kcuu1]} == "\eO"* ]] && bindkey -M viins ${terminfo[kcuu1]/O/[} vi-up-line-or-history
    [[ ${terminfo[kcud1]} == "\eO"* ]] && bindkey -M viins ${terminfo[kcud1]/O/[} vi-down-line-or-history
    [[ ${terminfo[kcuf1]} == "\eO"* ]] && bindkey -M viins ${terminfo[kcuf1]/O/[} vi-forward-char
    [[ ${terminfo[kcub1]} == "\eO"* ]] && bindkey -M viins ${terminfo[kcub1]/O/[} vi-backward-char
    [[ ${terminfo[khome]} == "\eO"* ]] && bindkey -M viins ${terminfo[khome]/O/[} beginning-of-line
    [[ ${terminfo[kend]} == "\eO"* ]] && bindkey -M viins ${terminfo[kend]/O/[} end-of-line
    [[ ${terminfo[khome]} == "\eO"* ]] && bindkey -M emacs ${terminfo[khome]/O/[} beginning-of-line
    [[ ${terminfo[kend]} == "\eO"* ]] && bindkey -M emacs ${terminfo[kend]/O/[} end-of-line
fi

# Set a fancy prompt {{{1
# Color definitions {{{2
None="%{${terminfo[sgr0]}%}"
if (( ${terminfo[colors]} >= 16 )); then
    # For 16+ color term {{{
    Black="%{$(tput setaf 0)%}"
    DarkGray="%{$(tput setaf 8)%}"
    LightGray="%{$(tput setaf 7)%}"
    White="%{$(tput setaf 15)%}"
    Red="%{$(tput setaf 9)%}"
    DarkRed="%{$(tput setaf 1)%}"
    Green="%{$(tput setaf 10)%}"
    DarkGreen="%{$(tput setaf 2)%}"
    Yellow="%{$(tput setaf 11)%}"
    DarkYellow="%{$(tput setaf 3)%}"
    Blue="%{$(tput setaf 12)%}"
    DarkBlue="%{$(tput setaf 4)%}"
    Magenta="%{$(tput setaf 13)%}"
    DarkMagenta="%{$(tput setaf 5)%}"
    Cyan="%{$(tput setaf 14)%}"
    DarkCyan="%{$(tput setaf 6)%}"
    BlackBg="%{$(tput setab 0)%}"
    DarkGrayBg="%{$(tput setab 8)%}"
    LightGrayBg="%{$(tput setab 7)%}"
    WhiteBg="%{$(tput setab 15)%}"
    RedBg="%{$(tput setab 9)%}"
    DarkRedBg="%{$(tput setab 1)%}"
    GreenBg="%{$(tput setab 10)%}"
    DarkGreenBg="%{$(tput setab 2)%}"
    YellowBg="%{$(tput setab 11)%}"
    DarkYellowBg="%{$(tput setab 3)%}"
    BlueBg="%{$(tput setab 12)%}"
    DarkBlueBg="%{$(tput setab 4)%}"
    MagentaBg="%{$(tput setab 13)%}"
    DarkMagentaBg="%{$(tput setab 5)%}"
    CyanBg="%{$(tput setab 14)%}"
    DarkCyanBg="%{$(tput setab 6)%}"
    # }}}
elif (( ${terminfo[colors]} == 8 )); then
    # For 8 color term {{{
    Black="%{$(tput setaf 0)%}"
    DarkGray="%{$(tput setaf 0;tput bold)%}"
    LightGray="%{$(tput setaf 7)%}"
    White="%{$(tput setaf 7;tput bold)%}"
    Red="%{$(tput setaf 1;tput bold)%}"
    DarkRed="%{$(tput setaf 1)%}"
    Green="%{$(tput setaf 2;tput bold)%}"
    DarkGreen="%{$(tput setaf 2)%}"
    Yellow="%{$(tput setaf 3;tput bold)%}"
    DarkYellow="%{$(tput setaf 3)%}"
    Blue="%{$(tput setaf 4;tput bold)%}"
    DarkBlue="%{$(tput setaf 4)%}"
    Magenta="%{$(tput setaf 5;tput bold)%}"
    DarkMagenta="%{$(tput setaf 5)%}"
    Cyan="%{$(tput setaf 6;tput bold)%}"
    DarkCyan="%{$(tput setaf 6)%}"
    BlackBg="%{$(tput setab 0)%}"
    DarkGrayBg="%{$(tput setab 0;tput blink)%}"
    LightGrayBg="%{$(tput setab 7)%}"
    WhiteBg="%{$(tput setab 7;tput blink)%}"
    RedBg="%{$(tput setab 1;tput blink)%}"
    DarkRedBg="%{$(tput setab 1)%}"
    GreenBg="%{$(tput setab 2;tput blink)%}"
    DarkGreenBg="%{$(tput setab 2)%}"
    YellowBg="%{$(tput setab 3;tput blink)%}"
    DarkYellowBg="%{$(tput setab 3)%}"
    BlueBg="%{$(tput setab 4;tput blink)%}"
    DarkBlueBg="%{$(tput setab 4)%}"
    MagentaBg="%{$(tput setab 5;tput blink)%}"
    DarkMagentaBg="%{$(tput setab 5)%}"
    CyanBg="%{$(tput setab 6;tput blink)%}"
    DarkCyanBg="%{$(tput setab 6)%}"
    # }}}
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
# VCS Info {{{2
# autoload -Uz vcs_info && vcs_info
# zstyle :vcs_info:* enable svn git hg
# zstyle :vcs_info:* check-for-changes false
# zstyle :vcs_info:* stagedstr "${Green}+${None}"
# zstyle :vcs_info:* unstagedstr "${Red}!${None}"
# zstyle :vcs_info:* actionformats " ${Yellow}%b%c%u${Yellow}|%a"
# zstyle :vcs_info:* formats " ${Yellow}%b%c%u"
# zstyle :vcs_info:* branchformat "%b:%r"
# zstyle :vcs_info:*:*:graywh disable-patterns "~(/*)"
# }}}2
# PS1="${None}(${Blue}%?${None})--(${Cyan}%*${None})--(${Green}%n${None}@${Magenta}%m${None})--(${Red}%~${None}\$vcs_info_msg_0_${None})
my_big_ps1="${None}(${Blue}%?${None})--(${Cyan}%*${None})--(${Green}%n${None}@${Magenta}%m${None})--(${Red}%~${Yellow}\$(___git_ps1 ' %s')${None})
%# "

my_small_ps1="${NONE}%~ %# "
PS1=${my_big_ps1}

# Functions {{{1
function precmd { #{{{2
    # vcs_info
    # If this is an xterm-alike set the title to user@host:dir
    case ${TERM} in
        (xterm*|gnome*|konsole*|putty*|screen*)
            __xtermicontitle '%n@%m: %~'
        ;;
    esac
    # If this is tmux or screen, print a bel
    if [[ ${TERM} == screen* && ( -n ${TMUX} || -n ${STY} ) ]]; then
        print -n "\a"
    fi
    # if [[ ${TERM} == screen* ]]; then
    #     __screentitle
    # fi
}
function preexec { #{{{2
    # case ${TERM} in
    #     (screen*)
    #         __screentitle '$1'
    #     ;;
    # esac
}

# Enable color support of ls and others {{{1
if [[ -x $(which dircolors) ]]; then
    if [[ -f ~/.dircolors-${terminfo[colors]} ]]; then
        eval "$(dircolors -b ~/.dircolors-${terminfo[colors]})"
    else
        eval "$(dircolors -b ~/.dircolors)"
    fi
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# Load other configurations {{{1
if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

if [[ -f ~/.zsh_functions ]]; then
    source ~/.zsh_functions
fi

# }}}1
# vim: fdm=marker fen
