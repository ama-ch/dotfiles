os=$(uname -s)
if [[ "$os" == "Darwin" ]]; then
  # alias
  alias em='open -a Emacs'

  # global alias
  alias -g P='| pbcopy'
fi
