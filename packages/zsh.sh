#!/bin/bash

echo "Cloning Prezto..."
git clone --recursive git@github.com:jamesacarr/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" &> /dev/null
echo "Prezto cloned"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sfv "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "Changing shell to zsh"
sudo dscl . -create "/Users/$USER" UserShell /usr/local/bin/zsh
