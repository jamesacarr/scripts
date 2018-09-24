#!/bin/bash

eval "$(nodenv init -)"

echo "Installing node..."
{
  nodenv install 8.12.0 --skip-existing
  nodenv global 8.12.0
  nodenv rehash
} &> /dev/null
echo "Node installed"

echo "Updating NPM..."
npm i -g npm &> /dev/null
echo "NPM Updated"
