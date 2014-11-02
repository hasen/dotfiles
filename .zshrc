# prompt
PROMPT="
%F{blue}%n%f => %F{red}Z%f => %F{white}%m%f
%F{white}%~%f <= %F{white}%v%f
%F{red}$%f "
RPROMPT=""

# style
#zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b | %a]'

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

# path(should write before compinit)
fpath=($HOME/projects/dotfiles/.zsh/zsh-completions/src(N-/) $fpath)
[[ -f $HOME/projects/dotfiles/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $HOME/projects/dotfiles/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
path=(/usr/local/bin(N-/) $path)

# autoload
autoload -Uz compinit
  compinit
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end \
  history-search-end
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
  add-zsh-hook chpwd chpwd_recent_dirs
autoload -Uz rmv
autoload -Uz vcs_info
  add-zsh-hook precmd _update_vcs_info_msg

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
function _update_vcs_info_msg() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]="$vcs_info_msg_0_"
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
