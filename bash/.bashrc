# setting
export EDITOR=nvim
export PS1="\[\e[0;31m\]▒\w€\[\e[0m\] "
export PATH="$PATH:/home/david/go/bin"
export PATH="$PATH:/home/david/p/script/"
set -o emacs


# network
alias          n="nmcli"
alias    connect="nmcli d connect $WI"
alias disconnect="nmcli d d $WI"
alias  reconnect="nmcli d d $WI;nmcli d connect $WI"

alias x="bash -c 'while ! ping -i 1 1.1.1.1 ; do sleep 1 ; done'"


# recurse
alias sudo="sudo "
alias watch="watch "


# docker
alias d="sudo docker"
alias drr="sudo docker run --privileged --hostname hacker --device /dev/snd --device=/dev/net/tun --cap-add=net_admin -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix -it"
alias dx="sudo docker run -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix"
alias dr="sudo docker run"
alias xh="xhost +local:root;exit"


# tmux
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


# clip
alias clip='xclip -selection clipboard -r'
alias clipo='xclip -selection clipboard -o'

vl(){
	echo > ~/p/message
	el
}
el(){
	$EDITOR ~/p/message
	if [ -f ~/p/message ]
		then
			cat ~/p/message|clip
			#rm ~/p/message
	fi
}


# tools
alias fing5='sudo docker run --rm -it --net=host --name dockerFing apigem/docker-fing'
PROMPT_DIRTRIM=3
alias generate-password="(echo {A..Z};echo {a..z};echo {0..9})|tr -d ' '|tr -d '\n'|fold -w1|shuf -n15 -r|tr -d '\n'"


# edits
alias  eb="$EDITOR + ~/.dotfiles/bash/.bashrc"
alias  ev="$EDITOR ~/.vimrc"
alias ebs='$EDITOR ~/.config/bspwm/bspwmrc'
alias esx='$EDITOR ~/.config/sxhkd/sxhkdrc'
alias ele='$EDITOR ~/.config/lemonbar/lemonbar.sh'
alias ero='$EDITOR ~/.config/rofi/config.rasi'
alias epc='$EDITOR ~/.config/polybar/config'
alias epl='$EDITOR ~/.config/polybar/launch.sh'
alias eza='$EDITOR ~/.config/zathura/zathurarc'
alias  et="$EDITOR ~/.tmux.conf"
alias  es="$EDITOR ~/.ssh/config"
alias  en="$EDITOR ~/.config/nvim/init.vim"
alias  eg="$EDITOR ~/.gitconfig"

alias note="$EDITOR ~/p/notes"
alias todo='$EDITOR ~/p/sec/todo'
alias day="$EDITOR /home/david/p/days/2025/days +"


# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias e="cd ~/p/test"
alias hh="cd ~/p/hack"

alias i='cd $(lf -print-last-dir)'

cl(){
	if [[ "$*" == "" ]];then
		cd
		ls
	else
		cd "$*"
		ls
	fi
}


# shortcuts
alias g=git
alias v="vim"
alias p="python3"
alias rl="source ~/.bashrc"
alias h=htop
alias shut='shutdown now;echo bye'
alias vs="code ."
alias fire="firefox"
alias y="nvim"
alias gs="git s"
alias fj="firejail"
alias m="make"
alias ma="make all"
alias rdl="readlink -e"

o(){
  setsid -f xdg-open "$*" >/dev/null 2>&1
}
cmkdir(){
	mkdir $1
	cd $_
}


# unsorted
