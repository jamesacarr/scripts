#!/bin/bash

if [[ -z $(which brew) ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap caskroom/cask
brew tap homebrew/core
brew tap homebrew/services
brew tap homebrew/versions

brew update
brew upgrade

packages=(
  autojump
  awscli
  git
  gnupg
  go
  httpie
  hub
  macvim
  nodeenv
  nodenv/nodenv/nodenv-npm-migrate
  pinentry-mac
  postgresql
  python
  python3
  rbenv
  redis
  watchman
  zsh
)

brew install "${packages[@]}"
brew install yarn --without-node
