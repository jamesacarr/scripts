#!/bin/bash

echo "Downloading Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Download complete"

packages=(
  1password-cli
  awscli
  direnv
  git
  httpie
  jq
  mise
  pinentry
  pinentry-mac
  pre-commit
  starship
  watchman
  zoxide
  zsh
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-syntax-highlighting
)

echo "Installing ${packages[@]}..."
brew install "${packages[@]}" &> /dev/null
echo "Homebrew packages installed"

apps=(
  1password
  bettertouchtool
  bit-slicer
  cursor
  docker
  firefox
  google-chrome
  iterm2
  kindle
  meetingbar
  pritunl
  rectangle
  slack
  visual-studio-code
  vlc
  zappy
  zoom
)

echo "Installing ${apps[@]}..."
brew install --cask "${apps[@]}" &> /dev/null
echo "Homebrew apps installed"

echo "Running brew cleanup..."
brew cleanup &> /dev/null
echo "Cleanup complete"