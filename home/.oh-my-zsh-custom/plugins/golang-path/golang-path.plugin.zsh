if [[ -d /usr/local/go ]]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME
  export PATH=$PATH:$GOPATH/bin
fi
