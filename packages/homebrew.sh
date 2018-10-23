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
  git
  gnupg
  go
  gobject-introspection
  httpie
  macvim
  nodenv
  nodenv/nodenv/nodenv-npm-migrate
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

echo "Homebrew packages installed"
