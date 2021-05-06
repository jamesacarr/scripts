#!/bin/bash

echo "Downloading Homebrew..."
if [[ -z $(which brew) ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
fi
echo "Download complete"

echo "Updating Homebrew..."
{
  brew upgrade
} &> /dev/null
echo "Homebrew updated"

packages=(
  autojump
  awscli
  direnv
  git
  go
  httpie
  nodenv
  nodenv/nodenv/nodenv-aliases
  nodenv/nodenv/nodenv-npm-migrate
  pinentry
  pinentry-mac
  rbenv
  watchman
  yarn
  zsh
)

echo "Installing ${packages[@]}..."
brew install "${packages[@]}" &> /dev/null

echo "Installing yarn..."
brew install yarn --without-node &> /dev/null

echo "Homebrew packages installed"
