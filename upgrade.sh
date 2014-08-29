#!/bin/sh

set -ex

cd ~/.homesick/repos/dotfiles
git stash
homesick pull dotfiles
git stash pop
cd -
