#!/bin/bash

echo "Cloning Prezto"
git clone --recursive git@github.com:jamesacarr/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "Changing shell to zsh"
sudo dscl . -create "/Users/$USER" UserShell /usr/local/bin/zsh
