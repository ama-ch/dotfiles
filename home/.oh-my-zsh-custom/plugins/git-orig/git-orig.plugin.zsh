# Aliases
alias gs='git s'
compdef _git gs=git-status
alias gl='git l'
compdef _git gl=git-log
alias glp='git lp'
compdef _git glp=git-log
alias gd='git d'
compdef _git gd=git-diff
alias gdc='git dc'
compdef _git gdc=git-diff
alias gsh='git stash'
compdef _git gsh=git-stash
alias gsp='git stash pop'
compdef _git gsp=git-stash
alias gsl='git stash list'
compdef _git gsl=git-stash
alias gpr='git pr'
compdef _git gpr=git-pull
alias gw='git web'

function add_nth_file() {
  if [ $# -eq 1 ]; then
    local file=`git status -sb | grep -v "^#" | head -n $1 | tail -n 1 | awk '{print $NF}'`
    git add $file
    git status -sb
  else
    exit 1
  fi
}

function diff_nth_file() {
  if [ $# -eq 1 ]; then
    local file=`git status -sb | grep -v "^#" | head -n $1 | tail -n 1 | awk '{print $NF}'`
    git diff $file
  else
    exit 1
  fi
}

alias gsa='add_nth_file'
alias gsd='diff_nth_file'
