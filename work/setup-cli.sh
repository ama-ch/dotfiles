#!/bin/bash -x

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install mas
brew install ansible
curl -L git.io/nodebrew | perl - setup
nodebrew install-binary stable
nodebrew use stable
brew install go
go get github.com/motemen/ghq
brew install peco
brew install rbenv
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
rbenv install 2.4.1
rbenv global 2.4.1
gem install homesick
homesick clone ama-ch/dotfiles
homesick symlink dotfiles
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
