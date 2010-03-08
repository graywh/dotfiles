#if [[ -n ${STY} ]]; then
#    screen -X "shelltitle '% |zsh:'"
#fi

# Options {{{1
# changing directories
setopt autopushd pushdignoredups
# completion
setopt noalwayslastprompt noautolist noautomenu autonamedirs bashautolist
# expansion and globbing
setopt nomarkdirs nonomatch
# job control
setopt longlistjobs nohup
# prompting
setopt promptsubst
# zle
setopt nobeep

# history
HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
setopt appendhistory histignoredups histreduceblanks sharehistory

# Completion {{{1
autoload -U compinit
compinit

#if zstyle -t ":completion:${curcontext}:hosts" use-ssh-config; then
#    [[ -r ~/.ssh/config ]] && _cache_hosts+=(${=${${(M)${(f)"$(<~/.ssh/config)"}:#Host*}#Host }:#*\**})
#fi

# Complete uppercase when lowercase was typed
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # allows lower->upper
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # adds upper->lower

# Better handling of rake tasks
zstyle ':completion:*' matcher-list 'r:|[:]=*'

# Page long lists
zstyle ':completion:*' list-prompt '%S%L -- More --%s'

# Warn when nothing found
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'

# Keybindings {{{1
bindkey -v
# Navigation {{{2
bindkey "\e[1~" beginning-of-line
bindkey "\e[H" beginning-of-line
bindkey "^B" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[F" end-of-line
bindkey "^E" end-of-line
bindkey "\e[1;2D" backward-word
bindkey "\e[1;5D" vi-backward-blank-word
bindkey "\e[1;2C" forward-word
bindkey "\e[1;5C" vi-forward-blank-word
# History {{{2
#bindkey "\e[5~" beginning-of-history
#bindkey "\e[6~" end-of-history
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
# Editing {{{2
bindkey "\e[2~" vi-quoted-insert
bindkey "\e[3~" delete-char
bindkey "^K" kill-line
bindkey "^U" backward-kill-line
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
# Completion {{{2
bindkey "^I" complete-word
bindkey "^A" expand-word
#bindkey "\e[Z" reverse-menu-complete
# Misc {{{2
bindkey "^J" self-insert-unmeta
bindkey "^O" push-input
bindkey "^T" get-line
bindkey "^Y" undo

# Set a fancy prompt {{{1
# Color definitions {{{2
autoload zsh/terminfo
None="%{$terminfo[sgr0]%}"
if (( $terminfo[colors] >= 16 )); then
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
elif (( $terminfo[colors] == 8)); then
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
#}}}2
# VCS Info {{{2
#autoload -Uz vcs_info && vcs_info
#zstyle ':vcs_info:*' enable svn git hg
#zstyle ':vcs_info:*' check-for-changes false
#zstyle ':vcs_info:*' stagedstr "${Green}+${None}"
#zstyle ':vcs_info:*' unstagedstr "${Red}!${None}"
#zstyle ':vcs_info:*' actionformats " ${Yellow}%b%c%u${Yellow}|%a"
#zstyle ':vcs_info:*' formats " ${Yellow}%b%c%u"
#zstyle ':vcs_info:*' branchformat "%b:%r"
#zstyle ':vcs_info:*:*:graywh' disable-patterns "$HOME(/*)"
# }}}2
Bell="%{$terminfo[bel]%}"
#PS1=${Bell}${None}'('${Blue}'%?'${None}')--('${Cyan}'%*'${None}')--('${Green}'%n'${None}'@'${Magenta}'%m'${None}')--('${Red}'%~'${None}'$vcs_info_msg_0_'${None}')'${None}"
PS1=${Bell}${None}'('${Blue}'%?'${None}')--('${Cyan}'%*'${None}')--('${Green}'%n'${None}'@'${Magenta}'%m'${None}')--('${Red}'%~'${None}${Yellow}'$(___git_ps1)'${None}')'${None}"
"'%# '

# Functions {{{1
function precmd { #{{{2
    #vcs_info
    # If this is an xterm-alike set the title to user@host:dir
    case ${TERM} in
        xterm*|gnome*|konsole*|putty*|screen*)
            print -Pn "\e]0;%n@%m: %~\a"
        ;;
    esac
    #if [[ ${TERM} == screen* ]]; then
    #    print -Pn "\ek\e\\"
    #fi
}
function preexec { #{{{2
    #case ${TERM} in
    #    screen*)
    #        print -Pn "\ek$1\e\\"
    #    ;;
    #esac
}

# Enable color support of ls and others {{{1
if [[ ${TERM} != "dumb" ]]; then
    if [[ -x /usr/bin/dircolors ]]; then
        if [[ -f ${HOME}"/.dircolors-"$terminfo[colors] ]]; then
            eval $(dircolors -b ${HOME}/.dircolors-$terminfo[colors])
        else
            eval $(dircolors -b ${HOME}/.dircolors)
        fi
        zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
        alias ls="ls -F --color=auto"
        alias grep="grep --color=auto"
        alias egrep="egrep --color=auto"
    elif [[ ${OSTYPE} == darwin* ]]; then
        alias ls="ls -FG"
    fi
fi

# Load other configurations {{{1
if [[ -f ${HOME}"/.aliases" ]]; then
    source ${HOME}"/.aliases"
fi

if [[ -f ${HOME}"/.zsh_functions" ]]; then
    source ${HOME}"/.zsh_functions"
fi

# include the local system modifications
if [[ -f ${HOME}"/.zshrc.local" ]]; then
    source ${HOME}"/.zshrc.local"
fi

# vim: fdm=marker fen
