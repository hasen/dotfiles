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

# bindkey
bindkey '^r' \
  history-incremental-pattern-search-backward
bindkey '^s' \
  history-incremental-pattern-search-forward

# function
function zman() {
    PAGER="less -g -s '+/^ {7}"$1"'" man zshall
}
