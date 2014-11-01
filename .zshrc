# prompt
PROMPT="
[%n@%m] %~
$ "
RPROMPT=""

# style
#zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# option
setopt SHARE_HISTORY
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt IGNORE_EOF
setopt NO_FLOW_CONTROL
setopt NO_BEEP

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# autoload
autoload -Uz compinit
compinit
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end \
  history-search-end

# bindkey
bindkey '^r' \
  history-incremental-pattern-search-backward
bindkey '^s' \
  history-incremental-pattern-search-forward
bindkey '^o' \
  history-beginning-search-backward-end

# function
function zman() {
    PAGER="less -g -s '+/^ {7}"$1"'" man zshall
}

# alias
#PS1='\n\[\033[1;34m\]\u \[\033[0m\]=> \[\033[1;37m\]\H\n\w/ \[\033[0m\]<= \[\033[1;34m\]$(git_branch)\n\[\033[0;31m\]$\[\033[0m\] '
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
alias his='history 1'
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
