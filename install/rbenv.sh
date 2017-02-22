#!/bin/bash

echo "Installing Ruby"
eval "$(rbenv init -)"
rbenv install --skip-existing 2.4.0
rbenv global 2.4.0
rbenv rehash

gem install bundler
