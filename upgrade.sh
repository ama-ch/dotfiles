#!/bin/sh -x

cd ~/.homesick/repos/ama-ch/dotfiles && \
git stash && \
homesick pull ama-ch/dotfiles && \
git stash pop && \
cd -
