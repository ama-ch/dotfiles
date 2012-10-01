## Installation

### Install [Homebrew](http://mxcl.github.com/homebrew/)

```sh
$ ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)
```

### Install [rvm](https://rvm.io/)

```sh
$ curl -L https://get.rvm.io | bash -s stable
$ rvm install 1.8.7
```

### Install [hub](https://github.com/defunkt/hub)

```sh
$ brew install hub
```

or

```sh
$ curl http://defunkt.io/hub/standalone -sLo ~/bin/hub && chmod +x ~/bin/hub
```

### Install [nodebrew](https://github.com/hokaccha/nodebrew)

```sh
$ curl https://raw.github.com/hokaccha/nodebrew/master/nodebrew | perl - setup
```

### Install [z.sh](https://github.com/rupa/z)

```sh
$ git clone git://github.com/rupa/z.git ~/z
```

### Install [git-browse-remote](https://github.com/motemen/git-browse-remote)

```sh
$ gem install git-browse-remote
```

### Install [homesick](https://github.com/technicalpickles/homesick) and clone dotfiles

```sh
$ gem install homesick
$ homesick clone ama-ch/dotfiles
$ homesick symlink ama-ch/dotfiles
```

### Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```sh
$ git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```

That's all! Restart terminal.
