#!/bin/bash

echo "Installing node via asdf..."
{
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs 16.20.2
  asdf install nodejs 18.20.5
  asdf install nodejs 20.18.1
  asdf install nodejs 22.11.0
  asdf install nodejs latest
  asdf global nodejs latest
} &> /dev/null
echo "Node installed"

echo "Installing python via asdf..."
{
  asdf plugin add python https://github.com/danhper/asdf-python.git
  asdf install python latest
  asdf global python latest
} &> /dev/null
echo "Python installed"

echo "Installing pnpm via asdf..."
{
  asdf plugin add pnpm https://github.com/jonathanmorley/asdf-pnpm.git
  asdf install pnpm latest
  asdf global pnpm latest
} &> /dev/null
echo "PNPM installed"
