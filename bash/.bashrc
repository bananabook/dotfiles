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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# custom ##############################################################################


bonsai()
{
	command /home/david/git/bonsai.sh/bonsai.sh -T $*
}
bonsaig()
{
	command /home/david/git/bonsai.sh/bonsai.sh -g 45,60 -T $*
}

rwth()
{
	command ssh -X -l db813507 login18-1.hpc.itc.rwth-aachen.de
}

# ********************************************************
source ~/.my_bashrc 
# ********************************************************

title() { printf "\033]0;$*\007"; }
#alias pipes="/home/david/git/pipes.sh/pipes.sh -p4 -r5000 -R -c1 -c2 -c3 -c4 -c5 -c6 -c7 "
alias pipes="/home/david/git/pipes.sh/pipes.sh -R -f 20 -p 2 -c1 -c2 -c3 -c4 -c5 -c6 -c7 "
alias pipesd="/home/david/git/pipes.sh/pipes.sh"

alias cl="tty-clock -c -C1"
alias cl0="clock -d 0 -a 1"

alias install="sudo apt install"
alias remove="sudo apt remove"

alias clip='xclip -selection clipboard -r'
# export CDPATH=.:/mnt/c/00RWTH/:/mnt/c/00ICH/COMP/:/mnt/c/00ICH/COMP/linux
#export CDPATH=.:/:~:/home/david/Documents/
export EDITOR=vim

export PS1="\e[40;0;31m\wΔ \e[40;0;38m"
alias ap="export PS1=\"\e[40;0;31m\wΔ \e[40;0;38m\""
alias rp="export PS1=\"\e[40;0;31mΔ \e[40;0;38m\""
# Δ
# $
# \a make sound

# alias r="source ranger"
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rc='ranger ~/Documents/rwth/compiler/ --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rr='ranger ~/Documents/rwth/rt/d/ --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rd='ranger ~/Downloads/ --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias o="setsid -f xdg-open"
alias z="setsid -f zathura"
alias rl="source ~/.bashrc"
alias eb="vim + ~/.bashrc"
alias emb="vim ~/.my_bashrc"
alias ev="vim ~/.vimrc"

alias v="vim"
alias p="python3"
#alias pip="pip3"

alias a="alsamixer"
alias b="acpi"
alias d="date"
#alias wifi="nm-connection-editor"

alias gt="gnome-terminal"

uumat(){
	python3 ~/git/unimatrix/unimatrix.py $*
}

umatdefault(){
  #-s 95
	python3 ~/git/unimatrix/unimatrix.py -a  -f $*
}

umat(){ 
	re='^[0-9]+$'
	if [ $# -eq 0 ]; then
		umatdefault
	elif [[ $1 =~ $re ]];then
		if [ $1 -eq 3 ]; then
			umatdefault -c 'red' -g 'black'
		fi
		if [ $1 -eq 2 ]; then
			umatdefault -c 'red' -g 'white'
		fi
		if [ $1 -eq 1 ]; then
			umatdefault -c 'white' -g 'red'
		fi
	else
		umatdefault $*
	fi
}

alias busy='~/p/gen_busy/genact-v0.10.0-linux-x86_64'
alias busyb='~/p/gen_busy/genact-v0.10.0-linux-x86_64 -m bootlog'
sshpry(){
	if [ $# -eq 0 ]; then
		sudo python3 ~/git/SSHPry2.0/sshpry2.py --list
	else
		sudo python3 ~/git/SSHPry2.0/sshpry2.py $*
	fi
}

s(){
	date
#	cal
	acpi
}
matexit(){
	umat -w -s 96
	exit
}
sherlock(){
	SHERLOCK_PATH=~/git/sherlock/
	echo $SHERLOCK_PATH
	source $SHERLOCK_PATH/venv/sherlock/bin/activate  # commented out by conda initialize
	python3 $SHERLOCK_PATH/sherlock/sherlock.py --print-found --timeout 30 --output sherlock_output_$*.txt $*
	
	deactivate
}

activate-anaconda(){
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/david/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/david/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/david/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/david/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
}

# bspwm
alias ebs='vim ~/.config/bspwm/bspwmrc'
alias esx='vim ~/.config/sxhkd/sxhkdrc'
alias ele='vim ~/.config/lemonbar/lemonbar.sh'
alias ero='vim ~/.config/rofi/config.rasi'
alias epc='vim ~/.config/polybar/config'
alias epl='vim ~/.config/polybar/launch.sh'
alias eza='vim ~/.config/zathura/zathurarc'
alias egi='vim ~/.gitconfig'
c(){
	cd $*
	ls
}

sb(){
	# xrandr -q
	#xrandr --output eDP-1 --brightness $*
  xbacklight -set $*
}

alias vl=vclip
alias el=eclip
vclip(){
	#rm ~/p/message -f
	echo > ~/p/message
	$EDITOR ~/p/message
	if [ -f ~/p/message ]
		then
			cat ~/p/message|clip
			#rm ~/p/message
	fi
}
eclip(){
	$EDITOR ~/p/message
	if [ -f ~/p/message ]
		then
			cat ~/p/message|clip
			#rm ~/p/message
	fi
}

#dlip(){
#	cp ~/p/defaultmessage ~/p/message
#	$EDITOR ~/p/message
#	cat ~/p/message|clip
#}

#dclip(){
#	rm p/message
#}

#rclip(){
#	$EDITOR p/message
#}

alias f='firefox --search'
alias tmuxa='tmux attach'

alias cal='ncal -b'

#cisco
alias ca='/opt/cisco/anyconnect/bin/vpn'
alias cac='/opt/cisco/anyconnect/bin/vpn connect $VPN_IRT'
alias cad='/opt/cisco/anyconnect/bin/vpn disconnect'

alias shut='shutdown now'
alias lock='xdg-screensaver lock'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

alias update='sudo apt update; sudo apt upgrade -y'

alias t='vim + ~/p/t'
alias f='vim ~/p/fortschritt'

# gurobi
export PATH="/opt/gurobi910/linux64/bin:$PATH"
export PATH="/home/david/git/bspswallow:$PATH"
export GUROBI_HOME="/opt/gurobi910/linux64"

# bspc
alias bsn="bspc config center_pseudo_tiled false"
alias bsc="bspc config center_pseudo_tiled true"
#alias fan="sensors|sed -nr 's/.*([0-9][0-9]*) RPM.*/\1 RPM/p'"
alias fan="sensors|grep --color=never fan"
bst(){
	bspc config top_padding $1
}
bsb(){
	bspc config bottom_padding $1
}
bsr(){
	bspc config right_padding $1
}
bsl(){
	bspc config left_padding $1
}
bsp(){
	bspc config top_padding $1
	bspc config bottom_padding $1
	bspc config right_padding $1
	bspc config left_padding $1
}
cmkdir(){
	mkdir $1
		cd $_
}

export LD=/home/david/Documents/hiwi/recovery/Linux_for_Tegra
export RT=/home/david/Documents/rwth/rt/
alias g=git
matlab(){
	export _JAVA_AWT_WM_NONREPARENTING=1
	setsid -f /usr/local/MATLAB/R2020b/bin/matlab $*
	#setsid -f /usr/local/MATLAB/R2020b/bin/matlab
}
export _JAVA_AWT_WM_NONREPARENTING=1
alias myip="echo $(ifconfig | grep broadcast | awk '{print $2}'|tail -n1)"
alias h=htop
alias e="cd ~/p/test"
alias x="while ! ping -i 2 x.com ; do sleep 2 ; done"
alias n="nmcli"
lsb_release(){
	echo Release:\t16.04
}
alias kc="nmcli device disconnect ipv6leakintrf0 wlp3s0 docker0"



export IP_SPARK='10.134.57.50'
#export IP_SPARK='192.168.2.117'
export SSH_SPARK='david@'$IP_SPARK
#alias nn='nmap -sn 10.134.57.*'
alias nn='nmap -sn 10.134.57.*'
alias np='ping '$IP_SPARK
alias spark='ssh -X $SSH_SPARK'
