alias install="sudo apt install"
alias remove="sudo apt remove"

export EDITOR=vim

export SYM=€
export PS1="▒\w$SYM "
alias ap="export PS1=\"▒\w$SYM \""
alias rp="export PS1=\"▒$SYM \""

alias rl="source ~/.bashrc"
alias eb="vim + ~/.bashrc"
alias emb="vim ~/.my_bashrc"
alias ev="vim ~/.vimrc"

alias v="vim"
alias p="python3"

c(){
	cd $*
	ls
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias update='sudo apt update; sudo apt upgrade -y'

alias f=fg

cmkdir(){
	mkdir $1
		cd $_
}

alias g=git
alias dfr="df / -h"

alias t="tmux"
alias te="tmux;exit"
alias ta="tmux attach"
alias tae="tmux attach;exit"
alias aptf="apt list|grep -P "
