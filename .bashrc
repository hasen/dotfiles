# colorful primary prompt string
git_branch() {
  echo $(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
PS1='\n\[\033[0;33m\]\w/ \[\033[1;32m\]$(git_branch)\[\033[0m\]\n \[\033[0;31m\]$\[\033[0m\] '

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

## Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

# Ruby
# Add RVM to PATH for scripting
PATH=$PATH:/usr/local/rvm/bin 
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Perl
# switch to plenv
#source ~/perl5/perlbrew/etc/bashrc 
#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

# Python
PYTHONPATH=$PYTHONPATH:/usr/bin/python2.7
