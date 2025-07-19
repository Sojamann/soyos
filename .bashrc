# If not running interactively, don't do anything
[[ $- == *i* ]] || return

HISTCONTROL=ignoreboth
HISTFILESIZE=20000
HISTIGNORE=ls:cd:exit:poweroff:shutdown
HISTSIZE=10000

shopt -s histappend
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s checkjobs

PATH="$PATH:/home/robin/.local/bin"

alias gb='git rev-parse --symbolic-full-name --abbrev-ref HEAD'
alias gbu='git branch --set-upstream-to=origin/$(gb) $(gb)'
alias gd='git diff'
alias gg='git pull --rebase'
alias gh='git show HEAD'
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'
alias gs='git status'
alias k=kubectl
alias kuse='kubectl config use-context'
alias lss='ls -la --sort=time'
alias pysource='source venv/bin/activate 2>/dev/null || source .venv/bin/activate'
alias v=nvim
alias vd='nvim -d'
alias y=yazi
alias config='git --git-dir=$HOME/.soyos --work-tree=$HOME'

command -v mise &>/dev/null && eval "$(mise activate bash)"
command -v starship &>/dev/null && eval "$(starship init bash)"

command -v kubectl &>/dev/null && eval "$(kubectl completion bash)"
command -v helm &>/dev/null && eval "$(helm completion bash)"
command -v k9s &>/dev/null && eval "$(k9s completion bash)"

