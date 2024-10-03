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
#source ~/.my_bashrc 
# ********************************************************

title() { printf "\033]0;$*\007"; }
#alias pipes="/home/david/git/pipes.sh/pipes.sh -p4 -r5000 -R -c1 -c2 -c3 -c4 -c5 -c6 -c7 "
alias pipes="/home/david/git/pipes.sh/pipes.sh -R -f 20 -p 2 -c1 -c2 -c3 -c4 -c5 -c6 -c7 "
alias pipesd="/home/david/git/pipes.sh/pipes.sh"

alias cl="tty-clock -c -C1"
alias cl0="cl -d 100 -a 1"

alias install="sudo apt install"
alias remove="sudo apt remove"

alias clip='xclip -selection clipboard -r'
# export CDPATH=.:/mnt/c/00RWTH/:/mnt/c/00ICH/COMP/:/mnt/c/00ICH/COMP/linux
#export CDPATH=.:/:~:/home/david/Documents/
#export CDPATH=/home/david/p/rwth
export EDITOR=vim

export SYM=€
#export PS1="\e[40;0;31m\w$SYM \e[40;0;38m"
#alias ap="export PS1=\"\e[40;0;31m\w$SYM \e[40;0;38m\""
#alias rp="export PS1=\"\e[40;0;31m$SYM \e[40;0;38m\""
export PS1="\[\e[0;31m\]▒\w$SYM\[\e[0m\] "
alias ap="export PS1=\"▒\w$SYM \""
alias rp="export PS1=\"▒$SYM \""
# \e[0;31mhi\e[00m
# Δ
# $
# \a make sound

# alias r="source ranger"
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias i='lc'
alias rc='ranger ~/p/rwth/compiler/ --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rcl='ranger ~/p/rwth/compiler/Lectures/Slides --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rce='ranger ~/p/rwth/compiler/Exercises --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rr='ranger ~/p/rwth/rt/moodle/ --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rrr='ranger /home/david/p/rwth/rt/klausur --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
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
#alias b="acpi"
alias b="bspc"
#alias d="date"
#alias wifi="nm-connection-editor"

alias gt="gnome-terminal"

uumat(){
	python3 ~/git/unimatrix/unimatrix.py $*
}

umatdefault(){
  #-s 95
	python3 ~/git/unimatrix/unimatrix.py -c red -a  -f $*
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

alias u=umat

alias busy='clear; ~/p/install/gen_busy/genact'
alias busyb='clear; ~/p/install/gen_busy/genact -m bootlog'
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
	if [[ "$*" == "" ]];then
		cd
		ls
	else
		cd "$*"
		ls
	fi
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
	#vim -c 'startinsert' ~/p/message
	vim ~/p/message
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

alias tmuxa='tmux attach'

#alias cal='ncal -b'

#cisco
VPN_RWTH=vpn.rwth-aachen.de
alias ca='/opt/cisco/anyconnect/bin/vpn'
alias cac='/opt/cisco/anyconnect/bin/vpn connect $VPN_RWTH'
alias cad='/opt/cisco/anyconnect/bin/vpn disconnect'

alias shut='shutdown now;echo bye'
alias lock='xdg-screensaver lock'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

alias update='sudo apt update; sudo apt upgrade -y'

#alias t='vim + ~/p/t'
alias todo='vim ~/p/todo'
alias f=fg

# gurobi
#export PATH="/opt/gurobi910/linux64/bin:$PATH"
#export PATH="/home/david/git/bspswallow:$PATH"
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

alias g=git
matlab(){
	#export _JAVA_AWT_WM_NONREPARENTING=1
	#setsid -f /usr/local/MATLAB/R2020b/bin/matlab $*
	setsid -f /usr/local/MATLAB/R2022a/bin/matlab $*
}
matlob(){
	/usr/local/MATLAB/R2022a/bin/matlab -nodisplay -nosplash -nodesktop $*
}
export _JAVA_AWT_WM_NONREPARENTING=1
#alias myip="echo $(ifconfig | grep broadcast | awk '{print $2}'|tail -n1)"
#alias myip="echo $(hostname -I|awk '{print $1}')"
#alias mysecip="hostname -I|cut -d ' ' -f 2"
alias h=htop
alias e="cd ~/p/test"
alias x="while ! ping -i 1 1.1.1.1 ; do sleep 1 ; done"
alias n="nmcli"
#alias kc="nmcli device disconnect wlp3s0 docker0"
alias dfr="df / -h"

alias sf="source ~/git/foam/david/discreteadjointopenfoam_adwrapper/etc/bashrc"
title Terminal
export PATH="$PATH:/home/david/p/script/"

alias edp1="bspc monitor eDP1 -d 1 2 3 4 5 6 7 8 9 10"

export WI=wlan0
export LA=enx000ec6d6e2ed

export IP_SPARK='10.134.57.91'
export IP_SPARK='10.134.57.60'
#export IP_SPARK='192.168.2.117'
export SSH_SPARK='david@'$IP_SPARK
#alias nn='nmap -sn 10.134.57.*'
alias nn='nmap -sn 10.134.57.*'
alias np='ping $(find_spark.sh)'
alias spark='ssh -X  -i ~/.ssh/id_spark david@$(find_spark.sh)'
SSH_HIWI='boelke@134.130.45.20'
alias hiwi='ssh -X -i ~/.ssh/id_rsa $SSH_HIWI'
alias hack='sudo openvpn ~/p/hack/bananabook.ovpn'
wttr(){
	if [[ $1 == 'a' ]]; then
		city=Aachen
	elif [[ $1 == 'u' ]]; then
		city=Unkel
	else
		city=$1
	fi
	curl wttr.in/$city 2>/dev/null |head -n -2
}

alias drr="sudo docker run --privileged --hostname hacker --device /dev/snd --device=/dev/net/tun --cap-add=net_admin -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix -it"
alias dx="sudo docker run -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix"
alias dr="sudo docker run"
alias hh="cd ~/p/hack"
alias hb="cd ~/p/hack/battlefield"
alias xh="xhost +local:root;exit"
#alias dc="docker commit $(docker container ls -q) "
#alias con="n d c $WI"
alias con="/home/david/p/test/connect_auto/do.sh start"
alias bat="/home/david/p/script/batteryd/do.sh start"
alias t="tmux"
alias tt="tmux attach||tmux"
te(){
	tmux "$@" ;exit
}
ta(){
	tmux attach "$@"
}
tl(){
	tmux "$@" ls
}
tae(){
	tmux attach "$@";exit
}
alias d="sudo docker"
alias di="sudo docker inspect -f '{{.NetworkSettings.IPAddress}}'"
alias dp="d ps -a --format 'table {{.ID}} {{.Image}}\t{{.Status}}\t{{.Names}}'"
alias ok="setsid -f okular"
lc () {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		if [ -d "$dir" ]; then
			if [ "$dir" != "$(pwd)" ]; then
				cd "$dir"
			fi
		fi
	fi
}

alias normount="sudo mount -o uid=1000,gid=1000 "
alias et="vim ~/.tmux.conf"
alias es="vim ~/.ssh/config"
alias aptf="apt list|grep -P "
alias fd="fdfind"
alias    connect="nmcli d c $WI"
alias disconnect="nmcli d d $WI"
alias  reconnect="nmcli d d $WI;nmcli d connect $WI"
alias sudo="sudo "
alias rdl="readlink -e"
alias tv="~/.tv"
alias fing5='sudo docker run --rm -it --net=host --name dockerFing apigem/docker-fing'
PROMPT_DIRTRIM=3
alias watch="watch "
# GoLang
export PATH="$PATH:/home/david/go/bin"
alias fire="firefox"
alias y="nvim"
alias generate-password="(echo {A..Z};echo {a..z};echo {0..9})|tr -d ' '|tr -d '\n'|fold -w1|shuf -n15 -r|tr -d '\n'"


# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

alias vib="ssh phone termux-vibrate -f"
a(){
	$(pwd)/a
}
#alias feh="feh --keep-zoom-vp"
alias dateb="date +'%F+%H-%M'"

# nix
#. /home/david/.nix-profile/etc/profile.d/nix.sh
alias libre="nix-shell -p librewolf"
alias fj="firejail"
alias sd="export DISPLAY=:0"
alias mind="find -maxdepth 1 \! -name '.'"
alias sphone="ssh phone -o hostname=localhost -p 8888"
alias day="vim /home/david/p/days/2024/days +"
alias dlr="realpath ./|xargs cd"
alias rdlc="realpath ./|clip"
alias repeat="while :;do !!;done"
alias wac="while :;do cac;done"
alias ardu="/home/david/p/test/suid/m"
alias m="make"
alias j="julia"

# ROS
#ros(){
#	source /opt/ros/noetic/setup.bash
#	if [[ -f ~/catkin_ws/devel/setup.bash ]];then
#		#echo devel/setup.bash found
#		source ~/catkin_ws/devel/setup.bash
#	#else
#		#echo devel/setup.bash not found
#	fi
#}
#ros
#eval $(dircolors ~/.dir_colors)
trans(){
	input=$(cat)
	nix-shell -p translate-shell --run "trans -b -t en \"$input\"" 2>/dev/null|tr "\n" " " 
}
alias vi=vim
alias note="$EDITOR ~/p/notes"

alias vs="code ."
