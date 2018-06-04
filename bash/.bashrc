# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vim='nvim'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#Aliases I like
alias clock='tty-clock -sScn -C 7'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#'/home/stan/.scripts/base16-google.dark.sh'



function launch () {
    nohup $@ > /dev/null
}


#export PATH=$PATH:$HOME/.bin


#Stuff I might use for one of my promps

BLK='\[\e[0;30m\]'
RED='\[\e[0;31m\]'
GRN='\[\e[0;32m\]'
YLW='\[\e[0;33m\]'
BLU='\[\e[0;34m\]'
PUR='\[\e[0;35m\]'
CYN='\[\e[0;36m\]'
BRED="\e[31m"
BGRN="\e[32m"
BYLW="\e[33m"
BBLU="\e[34m"
BPUR="\e[35m"
BCYN="\e[36m"
WHT='\[\e[0;37m\]'
RST='\[\e[0;0m\]'
BAR="━━"


export PATH=$PATH:$HOME/.bin

lower_case_table_names=1

PS1="\`if [ \$? = 0 ]; then echo \"\[\033[0;31m\]$BAR\[\033[0;32m\]$BAR\[\033[0;33m\]$BAR\[\033[0;34m\]$BAR\[\033[0;35m\]$BAR\[\033[0;0m\] \$(pwd) \n\A\[\033[0;0m\] » \"; else echo \"\[\033[0;31m\]━━━━━━━━━━━━━━━ \$(pwd) \n\[\033[0;31m\]\A »\"; fi\`"

PROMPT="$RED»$GRN»$YLW»$BLU»$PUR» $RST"
PS1="\`if [ \$? = 0 ]; then echo \"$RST\A  \$(pwd) \n\[\033[0;0m\]$PROMPT \"; else echo \"\[\033[0;31m\]\$(pwd) \n\[\033[0;31m\]\A »»»»» $RST\";fi\`"

alias p1="source p1"
alias p2="source p2"

alias cl='clear'

traysize=0
#LS_COLORS=$(/home/stan/bin/ls_colours_generator.py)


run_ls() {
    ls-i --color=auto -w $(tput cols) "$@"
}

run_dir() {
    dir-i --color=auto -w $(tput cols) "$@"
}

run_vdir() {
    vdir-i --color=auto -w $(tput cols) "$@"
}
#alias ls="run_ls"
#alias dir="run_dir"
#alias vdir="run_vdir"
#alias la="ls -A --group-directories-first"
alias config='/usr/bin/git --git-dir=/home/stan/.cfg/ --work-tree=/home/stan'
alias open="xdg-open"


alias bpv="baka-mplayer"
alias conm="connman-ncurses" 

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export BSPWM_STATE=/tmp/bspwm-state.json

alias config='/usr/bin/git --git-dir=/home/stan/.cfg/ --work-tree=/home/stan'

export _JAVA_AWT_WM_NONREPARENTING=1

export GOPATH=$HOME/.go

