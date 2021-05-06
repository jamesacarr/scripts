#!/bin/bash

eval "$(rbenv init -)"

echo "Installing ruby..."
{
  rbenv install --skip-existing 2.7.3
  rbenv global 2.7.3
  rbenv rehash
} &> /dev/null
echo "Ruby installed"

echo "Installing bundler..."
gem install bundler &> /dev/null
echo "Bundler installed"
