# .bashrc
# option
set -o ignoreeof

# delete until slash
stty werase undef
bind '"\C-w": unix-filename-rubout'

# colorful primary prompt string
git_branch() {
  echo $(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
PS1='\n\[\033[1;34m\]\u \[\033[0m\]=> \[\033[0;31m\]B\[\033[0m\] => \[\033[1;37m\]\H\n\w/ \[\033[0m\]<= \[\033[1;34m\]$(git_branch)\n\[\033[0;31m\]$\[\033[0m\] '
MYSQL_PS1='\U> '

export LESS='-R'
export LESSOPEN=' | /usr/local/share/source-highlight/src-hilite-lesspipe.sh %s'

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias ls='ls -G'
#alias ls='gls --color=auto'
alias ll='ls -l -G'
#alias la='ls -al -G'
alias la='ls -al'
alias lm='ls -al -G | more'
alias tm='tmux attach -t'
alias tmnew='tmux new-session -s'
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
alias todo='vi ~/projects/Tech_Documents/todo.txt'
alias vg='vagrant'
alias ng='nginx'
alias neta='vi ~/projects/Tech_Documents/neta.txt'
alias lhosts='cat ~/projects/Tech_Documents/Localhosts.txt'
#alias which='which -a'
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'

## Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## Ruby
## Add RVM to PATH for scripting
#export PATH="/usr/local/rvm/bin:$PATH"
#export PATH="$HOME/.rbenv/bin:~/.rbenv/shims:$PATH"
#eval "$(rbenv init -)"

# Perl
# switch to plenv
#source ~/perl5/perlbrew/etc/bashrc
#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
export PATH="$HOME/.plenv/bin:~/.plenv/shims:$PATH"
eval "$(plenv init -)"

# Python
#export PYTHONPATH="$PYTHONPATH:/usr/bin/python2.7"
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

# Go
export GOPATH="$HOME/go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# node
export PATH="$HOME/.nodebrew/current/bin:$PATH"

## PHP
#export PATH="$HOME/pear/bin:$PATH"
#export PATH="$HOME/.phpenv/bin:$PATH"
#export PATH="$HOME/.phpenv/plugins/php-build/bin:$PATH"
#export PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH"
#eval "$(phpenv init -)"

# D
export PATH="$HOME/.denv/bin:$PATH"
eval "$(denv init -)"

# JS
export PATH="/usr/local/bin/Sencha/Cmd/4.0.0.203:$PATH"
export SENCHA_CMD_3_0_0="/usr/local/bin/Sencha/Cmd/4.0.0.203"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home"
export JAVA="$JAVA_HOME/bin"

# Git
eval "$(hub alias -s)"

# Cake
export PATH="$HOME/projects/localhost/PHP/Book_Digitalcircus/sample_MVC/cake/app/Console:$PATH"

# Phalcon
export PTOOLSPATH=/Users/You/projects/localhost/PHP/Phalcon/phalcon-devtools/
export PATH=$PATH:/Users/You/projects/localhost/PHP/Phalcon/phalcon-devtools
export PTOOLSPATH=/Library/WebServer/Documents/PHP/Phalcon/phalcon-devtools/
export PATH=$PATH:/Library/WebServer/Documents/PHP/Phalcon/phalcon-devtools
export PTOOLSPATH=/Library/WebServer/Documents/PHP/Phalcon/phalcon-devtools/phalcon-devtools/
export PATH=$PATH:/Library/WebServer/Documents/PHP/Phalcon/phalcon-devtools/phalcon-devtools

# Docker
export DOCKER_HOST="192.168.11.4:5422"

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# hsenv
export PATH="$HOME/.hsenv/bin:$PATH"
precmd() {
  local search_dir=$PWD
  while [ $search_dir != "/" ]; do
    local hsenv_found=false
    for dir in `cd $search_dir && find . -maxdepth 1 -type d -name ".hsenv*"`; do
      if $hsenv_found; then
        echo multiple environments in $search_dir , manual activaton required
        return        
      elif [ -n "$dir" ] && [ -e $search_dir/$dir/bin/activate ]; then
        hsenv_found=true
      fi
    done
    if ! $hsenv_found; then
      search_dir=`cd $search_dir/.. && pwd`
      continue
    fi
    if [ -n "$HSENV" ] && [ "$HSENV" != "$search_dir" ]; then
      deactivate_hsenv
    fi
    if [ -z "$HSENV" ]; then
      pwd_backup=$PWD
      cd $search_dir
      source .hsenv*/bin/activate
      cd $pwd_backup
    fi
    return
  done
  if [ -n "$HSENV" ]; then
    deactivate_hsenv
  fi
}
export PROMPT_COMMAND=precmd

# added by Anaconda 2.1.0 installer
#export PATH="/Users/You/anaconda/bin:$PATH"

# boot2docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/You/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
