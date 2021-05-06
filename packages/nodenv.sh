#!/bin/bash

eval "$(nodenv init -)"

echo "Installing node..."
{
  nodenv install 12.18.3 --skip-existing
  nodenv global 12.18.3
  nodenv rehash
} &> /dev/null
echo "Node installed"

echo "Updating NPM..."
npm i -g npm &> /dev/null
echo "NPM Updated"
