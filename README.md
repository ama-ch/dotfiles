## Installation

### Install [Homebrew](http://brew.sh/)

```sh
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install [Homebrew Cask](http://caskroom.io)

```sh
$ brew install caskroom/cask/brew-cask
```

### Install [rbenv](https://github.com/sstephenson/rbenv/)

```sh
$ brew install rbenv
$ brew install ruby-build
$ rbenv install 2.2.1
$ rbenv global 2.2.1
```

### Install [hub](https://hub.github.com/)

```sh
$ brew install hub
```

or

```sh
$ ghq get github/hub
$ ghq look hub
$ rake install prefix=/usr/local
```

### Install [nodebrew](https://github.com/hokaccha/nodebrew)

```sh
$ curl -L git.io/nodebrew | perl - setup
```

### Install [git-browse-remote](https://github.com/motemen/git-browse-remote)

```sh
$ gem install git-browse-remote
```

### Install [homesick](https://github.com/technicalpickles/homesick) and clone dotfiles

```sh
$ gem install homesick
$ homesick clone ama-ch/dotfiles
$ homesick symlink dotfiles
```

### Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```sh
$ curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

That's all! Restart terminal.
