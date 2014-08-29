#!/bin/sh

set -ex

cd ~/.homesick/repos/dotfiles
git stash
homesick pull ama-ch/dotfiles
git stash pop
cd -
