if [[ -d /usr/local/go || -f /usr/local/bin/go ]]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME
  export PATH=$PATH:$GOPATH/bin
fi
