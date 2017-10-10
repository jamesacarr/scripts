#!/bin/bash

eval "$(nodenv init -)"
nodenv install 8.6.0
nodenv global 8.6.0
nodenv rehash

npm i -g npm
