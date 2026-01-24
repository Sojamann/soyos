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



#=======================
# ACTIVATE HOMEBREW ENV
#=======================
test -x /opt/homebrew/bin/brew && eval "$(/opt/homebrew/bin/brew shellenv)"
PATH="$HOME/.local/bin:$PATH"

#================
# COMPLETION
#================

command -v mise &>/dev/null && eval "$(mise activate bash)"
command -v mise &>/dev/null && eval "$(mise completion bash --include-bash-completion-lib)"
command -v starship &>/dev/null && eval "$(starship init bash)"

command -v kubectl &>/dev/null && eval "$(kubectl completion bash)"
command -v helm &>/dev/null && eval "$(helm completion bash)"
command -v k9s &>/dev/null && eval "$(k9s completion bash)"

# this snippet is taken from the Homebrew page
if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi
