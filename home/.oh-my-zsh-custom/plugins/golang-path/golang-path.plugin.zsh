if [[ -d /usr/local/go ]]; then
  export PATH=$PATH:/usr/local/go/bin
  if [[ ! -d $HOME/go ]]; then
    mkdir $HOME/go
    export GOPATH=$HOME/go
  fi
  export PATH=$PATH:$GOPATH/bin
fi
