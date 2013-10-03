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
alias diff='colordiff'
alias top='htop'
alias grep='egrep -n --color=always'
alias tree='tree -a'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Add RVM to PATH for scripting
PATH=$PATH:/usr/local/rvm/bin 
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#perlbrew用の設定perlenvに切り替えたのでコメントアウト
#source ~/perl5/perlbrew/etc/bashrc 
#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

PYTHONPATH=$PYTHONPATH:/usr/bin/python2.7
