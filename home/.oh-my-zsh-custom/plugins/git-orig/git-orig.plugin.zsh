source "$ZSH_CUSTOM/plugins/git-orig/git-orig.zsh"

# Aliases
alias gf='git fetch'
compdef _git gf=git-fetch
alias gs='git status --short --branch'
compdef _git gs=git-status
alias gl='git l'
compdef _git gl=git-log
alias glp='git lp'
compdef _git glp=git-log
alias gd='git diff'
compdef _git gd=git-diff
alias gdc='git diff --cached'
compdef _git gdc=git-diff
alias gr='git rebase'
compdef _git gr=git-rebase
alias gsh='git stash'
compdef _git gsh=git-stash
alias gsp='git stash pop'
compdef _git gsp=git-stash
alias gsl='git stash list'
compdef _git gsl=git-stash
alias gc='git ci'
compdef _git gc=git-commit
alias gsm='git submodule'
compdef _git gsm=git-submodule
alias gsu='git submodule update'
compdef _git gsu=git-submodule
alias gw='git browse-remote'
alias gsa='add_nth_file'
alias gsd='diff_nth_file'
alias gsco='checkout_nth_file'
alias gsrh='reset_nth_file'
