# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# Controlling how commands are saved on the history file ##
# ignoreboth means:                       ##
# a) Command which begin with a space character are not saved in the history
# list               ##
# b) Command matching the previous history entry  to  not  be  saved (avoid
# duplicate commands) ##
HISTCONTROL=ignoreboth
#HISTCONTROL=ignoredups:erasedups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=5000000
HISTTIMEFORMAT="%d/%m/%y %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# How to list all available terminal types
#    find /usr/share/terminfo/ -type f -printf '%f\n' | sort | less

# Determining number of colors supported by a terminal
#     tput colors

# Terminal type is determined from value of $TERM environment variable
#export TERM=screen-256color # this creates problem in vim (HOME/END key)
export TERM=xterm-256color  # this creates problem with vi (mustang) colorscheme
                            # solution is to start tmux -2

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

environment_specifier=$debian_chroot;
if [ -e ~/.location ]; then
    environment_specifier=$(cat ~/.location)
fi

function gitbr ()
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# check and modify the command prompt if run from inside ranger
InRanger=""
[ -n "$RANGER_LEVEL" ] && InRanger='(in ranger)'

# check if we are in screen
InScreen=""
if [ -n "$STY" ];
then
    Session=`echo $STY | cut -f2 -d"."`
    InScreen="(screen = $Session:$WINDOW)";
fi


if [ "$color_prompt" = yes ]; then
export PS1="\
\[\e[01;32m\]
${environment_specifier:+[$environment_specifier] }\
\[\e[1;34m\]\
\u\
\[\e[0;32m\]\
@\
\[\e[01;31m\]\
\h\
\[\e[0;32m\]\
: \
\[\e[0;36m\]\
\w\
\[\e[1;32m\]\
\$(gitbr)\
\[\e[0;33m\]\
\${InRanger}\
\[\e[0;35m\]\
\${InScreen}\
\[\e[0;31m\]\
\n\$ \
\[\e[m\]"

    # Comment in the above and uncomment this below for a simple color prompt
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export EDITOR=vim
#export EDITOR=kate.sh
export SVN_EDITOR=vim

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export MOZ_DISABLE_PANGO=1

#code highlight less
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en"


export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"

export TZ='Europe/Amsterdam'


# some useful scripts
export PATH=~/dotfiles/scripts:$PATH

export LD_LIBRARY_PATH=/lib:/usr/lib64:/usr/lib:/usr/lib/x86_64-linux-gnu:/usr/local/lib:$LD_LIBRARY_PATH

# export JAVA_HOME=/usr/lib/jvm/java-8-oracle
# export PIN_HOME=/home/iashraf/pin-3.0-76991

#default printer
# export PRINTER=ceCorridor

# for cuda
# export CUDA_INSTALL_PATH=/opt/cuda/cuda70

# boost library
# export BOOSTHOME=/opt/boost/boost148

if [ -d "$CUDA_INSTALL_PATH" ]; then
    export PATH=$CUDA_INSTALL_PATH/bin:$PATH
    export LD_LIBRARY_PATH=$CUDA_INSTALL_PATH/lib64:$LD_LIBRARY_PATH
    export C_INCLUDE_PATH=$CUDA_INSTALL_PATH/include:$C_INCLUDE_PATH
    export CPLUS_INCLUDE_PATH=$CUDA_INSTALL_PATH/include:$CPLUS_INCLUDE_PATH
fi

if [ -d "$PIN_HOME" ]; then
    export PIN_KIT=$PIN_HOME
    export PIN_ROOT=$PIN_HOME
    export PATH=$PIN_HOME:$PATH
fi


if [ -d "$XPUHOME" ]; then
    export C_INCLUDE_PATH=$XPUHOME:$C_INCLUDE_PATH
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$XPUHOME/.libs
fi

if [ -d "$BOOSTHOME" ]; then
    export LD_LIBRARY_PATH=$BOOSTHOME/lib:$LD_LIBRARY_PATH
    export C_INCLUDE_PATH=$BOOSTHOME/include:$C_INCLUDE_PATH
    export CPLUS_INCLUDE_PATH=$BOOSTHOME/include:$CPLUS_INCLUDE_PATH
fi

if [ -f ~/dotfiles/tmux.completions.bash ]; then
    . ~/dotfiles/tmux.completions.bash
fi

# following script adds more history to cd command
# from http://linuxgazette.net/109/marinov.html
# cd -- shows the numbered list of recently visited directories
# cd -2 e.g. will cd into the second directory on this list
source ~/dotfiles/scripts/cd_func.sh

# regular colors
#local K="\[\033[0;30m\]"    # black
#local R="\[\033[0;31m\]"    # red
#local G="\[\033[0;32m\]"    # green
#local Y="\[\033[0;33m\]"    # yellow
#local B="\[\033[0;34m\]"    # blue
#local M="\[\033[0;35m\]"    # magenta
#local C="\[\033[0;36m\]"    # cyan
#local W="\[\033[0;37m\]"    # white
