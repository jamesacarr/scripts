#!/bin/bash

echo "Downloading Homebrew..."
if [[ -z $(which brew) ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
fi
echo "Download complete"

echo "Updating Homebrew..."
brew upgrade &> /dev/null
echo "Homebrew updated"

packages=(
  autojump
  awscli
  direnv
  git
  google-cloud-sdk
  httpie
  nodenv
  nodenv/nodenv/nodenv-aliases
  nodenv/nodenv/nodenv-npm-migrate
  pinentry
  pinentry-mac
  watchman
  yarn
  zsh
)

echo "Installing ${packages[@]}..."
brew install "${packages[@]}" &> /dev/null
echo "Homebrew packages installed"

apps=(
  1password
  alfred
  bettertouchtool
  docker
  firefox
  google-chrome
  iterm2
  kindle
  microsoft-office
  rectangle
  slack
  viscosity
  visual-studio-code
  zoom
)

echo "Installing ${apps[@]}..."
brew install --cask "${apps[@]}" &> /dev/null
echo "Homebrew apps installed"

echo "Running brew cleanup..."
brew cleanup &> /dev/null
echo "Cleanup complete"