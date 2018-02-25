#!/bin/bash

eval "$(nodenv init -)"

echo "Installing nodenv plugins..."
{
  mkdir -p "$(nodenv root)/plugins"
  git clone git://github.com/nodenv/nodenv-npm-migrate.git "$(nodenv root)/plugins/nodenv-npm-migrate"
  git clone https://github.com/nodenv/nodenv-update.git "$(nodenv root)/plugins/nodenv-update"
  git clone https://github.com/nodenv/node-build.git "$(nodenv root)/plugins/node-build"
} &> /dev/null
echo "Plugins installed"

echo "Installing node..."
{
  nodenv install 8.9.4
  nodenv global 8.9.4
  nodenv rehash
} &> /dev/null
echo "Node installed"

echo "Updating NPM..."
npm i -g npm &> /dev/null
echo "NPM Updated"
