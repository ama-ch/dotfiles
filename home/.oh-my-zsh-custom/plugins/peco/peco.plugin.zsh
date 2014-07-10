# select history
function peco-select-history() {
  typeset tac
  if which tac > /dev/null; then
    tac=tac
  else
    tac='tail -r'
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
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
function peco-select-branch() {
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

# list all functions start with "peco-"
function peco-function-list () {
  local selected=$(functions | grep "^.*\ ()\ {" | sed -e "s| () {||" | grep peco- | grep -v function-list | peco --query "$LBUFFER")
  if [ -n "$selected" ]; then
    ${selected}
  fi
}
alias pfl="peco-function-list"
