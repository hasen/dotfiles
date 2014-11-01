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

# autoload
autoload -Uz compinit
compinit

# function
function zman() {
    PAGER="less -g -s '+/^ {7}"$1"'" man zshall
}
