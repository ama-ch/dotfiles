function is_number() {
  echo $1 | egrep -q '^[0-9]+$'
}

function is_not_number() {
  echo $1 | egrep -qv '^[0-9]+$'
}

function get_nth_changed_file() {
  git status -sb | grep -v "^#" | head -n $1 | tail -n 1 | awk '{print $NF}'
}

function filter_arguments() {
  local func=$1; shift
  local ret=""
  for arg in "$@"; do
    if $func $arg; then
      ret="$ret $arg"
    fi
  done
  echo $ret
}

function call_command_with_args() {
  local command=$1; shift
  local num_args="$(filter_arguments is_number $@)"
  local other_args="$(filter_arguments is_not_number $@)"
  for num in $(echo ${num_args:-1}); do
    local file=$(get_nth_changed_file ${num})
    $(echo $command) $(echo $other_args) $file
  done
}

function add_nth_file() {
  call_command_with_args "git add" $@ && \
  git status -sb
}

function diff_nth_file() {
  call_command_with_args "git diff" $@
}

function checkout_nth_file() {
  call_command_with_args "git checkout" $@ && \
  git status -sb
}

function reset_nth_file() {
  call_command_with_args "git reset HEAD" $@
}
