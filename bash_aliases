#!/bin/bash

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

# some more ls aliases
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias free="free -tlm"
alias tl="ps -aux"
alias tt="pstree -plhu"

alias ls='ls -F -h --color=auto'
alias ll='ls $LS_OPTIONS -ltr'
alias ll='ls -alF'
alias l='ls $LS_OPTIONS -ltrA'
alias l.='ls -d .* --color=auto'
alias la='ls -A'

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias rgrep='rgrep --colour=auto'
alias svn='svn'
alias df='df -kTh'
alias less='less -R'
alias more='less -R'
export PAGER='less -R'
alias make='make SHELL=/bin/bash'
alias cp='cp -i'
#alias diff='diff -Naur'
alias diff='colordiff'
alias who='who -Hwbu'
alias whatare='whatis -r'
alias g=git

alias open='nautilus .'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias beep='paplay /usr/share/sounds/ubuntu/notifications/Amsterdam.ogg'
alias alert='beep; notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || \
             echo error)" "$(history | tail -n1 | \
             sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias cbc="awk '{q=p;p=\$0}NR>1 { print q } END{ORS = \"\"; print p}' | xclip -sel clip"
alias cbp='xclip -sel clip -o'

alias eps2pdf='epstopdf'

alias myshell='ps -p $$'

alias listusers='cat /etc/passwd |grep /bin/bash |grep [5-9][0-9][0-9] |cut -d: -f1'

# ce hpc servers
alias hpc1='ssh -X iashraf@ce-hpc01.ewi.tudelft.nl'
alias hpc2='ssh -X iashraf@ce-hpc02.ewi.tudelft.nl'
alias hpc3='ssh -X iashraf@ce-hpc03.et.tudelft.nl'
alias dev1='ssh -X iashraf@ce-dev01.et.tudelft.nl'

# aliases for headless start of virtual machines
# alias vmheadlessrose='VBoxHeadless --startvm RoseVM'

alias tmux='tmux -2'
