source "$ZSH_CUSTOM/plugins/git-orig/git-orig.zsh"

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
alias gr='git rebase'
compdef _git gr=git-rebase
alias gsh='git stash'
compdef _git gsh=git-stash
alias gsp='git stash pop'
compdef _git gsp=git-stash
alias gsl='git stash list'
compdef _git gsl=git-stash
alias gpr='git pr'
compdef _git gpr=git-pull
alias gc='git ci'
compdef _git gc=git-commit
alias gw='git web'
alias gsa='add_nth_file'
alias gsd='diff_nth_file'
alias gsco='checkout_nth_file'
alias gsrh='reset_nth_file'
