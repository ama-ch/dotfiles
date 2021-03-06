# select history
function peco-select-history() {
  typeset tac
  if which tac > /dev/null; then
    tac=tac
  else
    tac='tail -r'
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | \
           peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle -R -c
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# integrate all source code with ghq
function peco-src() {
  local selected_dir=$(ghq list | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${GOPATH}/src/${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
stty -ixon
bindkey '^s' peco-src

function peco-git-list-files() {
  git ls-files | peco
}
alias -g F='`git ls-files | peco`'

# process list
function peco-ps() {
  ps aux | peco
}
alias pps="peco-ps"

# process kill
function peco-pkill() {
  for pid in `ps aux | peco | awk '{ print $2 }'`
  do
    kill $pid
    echo "Killed ${pid}"
  done
}
alias pk="peco-pkill"

# select branch
function peco-git-select-branch() {
  git branch | peco | sed -e "s/^\*[ ]*//g"
}
alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'

# select recent directory
function peco-cdr () {
  local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-cdr
bindkey '^[' peco-cdr

function peco-git-recent-branches() {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
        perl -pne 's{^refs/heads/}{}' | \
        peco)
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-recent-branches
bindkey '^x^b' peco-git-recent-branches

function peco-git-recent-all-branches() {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads refs/remotes | \
        perl -pne 's{^refs/(heads|remotes)/}{}' | \
        peco)
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout -t ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-recent-all-branches
bindkey '^xb' peco-git-recent-all-branches

function peco-git-select-commit() {
  git log --pretty=format:"%h %s - %an, %ar" | peco | cut -d" " -f1
}
alias -g C='`git log --pretty=format:"%h %s - %an, %ar" | peco | cut -d" " -f1`'

function peco-git-revert-recent-commits() {
  local commit_hash=$(git log --first-parent \
    --pretty=format:'%h %s - %an, %ar' \
    | peco | awk '{ print $1 }')
  if [ -n "$commit_hash" ]; then
    local parents=$(git rev-list --parents -n 1 ${commit_hash} | wc -w)
    echo Reverting ${commit_hash}
    if [ "$parents" -eq 2 ]; then
      git revert ${commit_hash}
    else
      git revert -m 1 ${commit_hash}
    fi
  fi
}

# list all functions start with "peco-"
function peco-function-list () {
  local selected=$(functions | grep "^.*\ ()\ {" | sed -e "s| () {||" | grep peco- | grep -v function-list | peco --query "$LBUFFER")
  if [ -n "$selected" ]; then
    ${selected}
  fi
}
alias pfl="peco-function-list"
