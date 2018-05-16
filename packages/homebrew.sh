#!/bin/bash

echo "Downloading Homebrew..."
if [[ -z $(which brew) ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
fi
echo "Download complete"

echo "Tapping brew casks..."
{
  brew tap caskroom/cask
  brew tap homebrew/core
  brew tap homebrew/services
  brew tap homebrew/versions
} &> /dev/null
echo "Casks tapped"

echo "Updating Homebrew..."
{
  brew update
  brew upgrade
} &> /dev/null
echo "Homebrew updated"

packages=(
  autojump
  awscli
  git
  gnupg
  httpie
  hub
  macvim
  pinentry-mac
  postgresql
  python
  python@2
  rbenv
  redis
  watchman
  zsh
)

echo "Installing ${packages[@]}..."
brew install "${packages[@]}" &> /dev/null

echo "Installing yarn..."
brew install yarn --without-node &> /dev/null

echo "Installing nodenv"
brew install nodeenv &> /dev/null

echo "Homebrew packages installed"
