# .bashrc

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias ll='ls -l'
alias la='ls -al -G'
alias tm='tmux attach -t'
alias his='history'
alias preview='open -a Preview'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PATH=$PATH:/usr/local/rvm/bin # Add RVM to PATH for scripting

source ~/perl5/perlbrew/etc/bashrc 
eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)


