#!/bin/bash

eval "$(nodenv init -)"

echo "Installing node..."
{
  nodenv install 14.18.1 --skip-existing
  nodenv install 16.13.0 --skip-existing
  nodenv global 16
  nodenv rehash
} &> /dev/null
echo "Node installed"
