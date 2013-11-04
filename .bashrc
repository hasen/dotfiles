# .bashrc
# option
set -o ignoreeof

# colorful primary prompt string
git_branch() {
  echo $(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
PS1='\n\[\033[1;30m\]\H\n\w/ \[\033[1;32m\]$(git_branch)\n\[\033[0;31m\]$\[\033[0m\] '

export LESS='-R'
export LESSOPEN=' | /usr/local/share/source-highlight/src-hilite-lesspipe.sh %s'

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias ls='ls -G'
alias ll='ls -l -G'
alias la='ls -al -G'
alias lm='ls -al -G | more'
alias tm='tmux attach -t'
alias tmls='tmux ls'
alias tmmv='tmux rename -t'
alias tmus='tmux new -s'
alias his='history'
alias preview='open -a Preview'
alias diff='colordiff'
#alias top='htop'
alias grep='egrep -n --color=always'
alias tree='tree -a'
alias shrst='exec $SHELL -l'
alias gip='curl http://ipcheck.ieserver.net'

## Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

export PATH="/usr/local/sbin:$PATH"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Ruby
# Add RVM to PATH for scripting
export PATH="/usr/local/rvm/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Perl
# switch to plenv
#source ~/perl5/perlbrew/etc/bashrc 
#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

# Python
export PYTHONPATH="$PYTHONPATH:/usr/bin/python2.7"

# Go
export GOROOT="/usr/local/Cellar/go/1.1.1"
export GOPATH="/usr/local/Cellar/go/1.1.1/pkg/"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# node
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# PHP
export PATH="$HOME/pear/bin:$PATH"
export PATH="$HOME/.phpenv/bin:$PATH"
export PATH="$HOME/.phpenv/plugins/php-build/bin:$PATH"
export PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH"
eval "$(phpenv init -)"

# D
export PATH="$HOME/.denv/bin:$PATH"
eval "$(denv init -)"

# JS
export PATH=/usr/local/bin/Sencha/Cmd/4.0.0.203:$PATH
export SENCHA_CMD_3_0_0="/usr/local/bin/Sencha/Cmd/4.0.0.203"
