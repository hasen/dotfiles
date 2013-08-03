# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias ll='ls -l'
alias la='ls -al'
alias tm='tmux attach -t'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PATH=$PATH:/usr/local/rvm/bin # Add RVM to PATH for scripting
source ~/perl5/perlbrew/etc/bashrc 
