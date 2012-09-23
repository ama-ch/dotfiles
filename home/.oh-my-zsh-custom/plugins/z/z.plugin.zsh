# z.sh
_Z_CMD=j
source ~/z/z.sh
precmd() {
  _z --add "$(pwd -P)"
}
