#!/bin/bash

echo "Installing node via mise..."
{
  mise install node@18
  mise install node@20
  mise install node@22
  mise install node@24
} &> /dev/null
mise use -g node@24
mise settings set node.default_packages_file "$HOME/.config/mise/.default-npm-packages"
echo "Node installed"

echo "Installing python via mise..."
{
  mise install python
} &> /dev/null
mise use -g python
echo "Python installed"

echo "Installing pnpm via mise..."
{
  mise install pnpm
} &> /dev/null
mise use -g pnpm
echo "PNPM installed"
