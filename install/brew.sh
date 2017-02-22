#!/bin/bash

echo "Installing Homebrew & brews"
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
  git-crypt
  gnupg2
  httpie
  hub
  macvim
  node
  pinentry-mac
  postgresql
  python
  python3
  rbenv
  redis
  yarn
  zsh
  zsh-syntax-highlighting
)

brew install "${packages[@]}"
