os=$(uname -s)
if [[ "$os" == "Linux" ]]; then
  # exports
  export GDK_NATIVE_WINDOWS=1
  JAVA_HOME=/usr/lib/jvm/default-java
  MYSQL_HOME=/usr/local/mysql
  PATH=$PATH:$JAVA_HOME/bin:$MYSQL_HOME/bin
  #LD_LIBRARY_PATH=/usr/local/mysql-5.5/lib/mysql:$LD_LIBRARY_PATH
  export JAVA_HOME PATH
  #export LD_LIBRARY_PATH
  export GIT_SSL_NO_VERIFY=1
  # linuxbrew (https://github.com/Homebrew/linuxbrew)
  PATH="$HOME/.linuxbrew/bin:$PATH"
  LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"

  # alias
  alias rm='trash-put' # sudo apt-get install trash-cli
  alias ack='ack-grep' # sudo apt-get install ack-grep
fi
