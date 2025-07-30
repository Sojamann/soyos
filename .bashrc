# If not running interactively, don't do anything
[[ $- == *i* ]] || return


#================
# OPTS
#================
HISTCONTROL=ignoreboth
HISTFILESIZE=20000
HISTIGNORE=ls:cd:exit:poweroff:shutdown
HISTSIZE=10000

shopt -s histappend
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s checkjobs


PATH="$PATH:$HOME/.local/bin"

#================
# ALIASES
#================

alias config='git --git-dir=$HOME/.soyos --work-tree=$HOME'

# SHELL SHIZZLE
alias y=yazi
alias v=nvim
alias vd='nvim -d'
alias lss='ls -la --sort=time'
alias pysource='source venv/bin/activate 2>/dev/null || source .venv/bin/activate'

# GIT
alias gb='git rev-parse --symbolic-full-name --abbrev-ref HEAD'
alias gbu='git branch --set-upstream-to=origin/$(gb) $(gb)'
alias gd='git diff'
alias gg='git pull --rebase'
alias gh='git show HEAD'
alias gl='git log'
alias gs='git status'

# K8S
alias k=kubectl
alias kuse='kubectl config use-context'


#================
# COMPLETION
#================

command -v mise &>/dev/null && eval "$(mise activate bash)"
command -v starship &>/dev/null && eval "$(starship init bash)"

command -v kubectl &>/dev/null && eval "$(kubectl completion bash)"
command -v helm &>/dev/null && eval "$(helm completion bash)"
command -v k9s &>/dev/null && eval "$(k9s completion bash)"

