#!/bin/bash -x

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install mas

# Casks
brew cask install google-chrome
brew cask install dropbox
brew cask install google-japanese-ime
brew cask install cmd-eikana
Brew cask install atom
brew cask install the-unarchiver
brew cask install skitch
brew cask install flux
brew cask install cisco-proximity

# Mac App Store
mas install 443987910 # 1Password
mas install 937984704 # Amphetamine
mas install 585829637 # Todoist
