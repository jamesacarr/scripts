#!/bin/bash

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles before continuing
echo "Checking for latest dotfiles version"
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

echo "Creating symlinks"
ln -sfv $DOTFILES_DIR/git/.gitconfig ~
ln -sfv $DOTFILES_DIR/git/.gitignore_global ~

mkdir -p ~/.atom
ln -sfv $DOTFILES_DIR/atom/* ~/.atom

# Installers
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/rbenv.sh"
. "$DOTFILES_DIR/install/zsh.sh"

EXTRA_DIR="$HOME/.extra"
if [ -d "$EXTRA_DIR" -a -f "$EXTRA_DIR/install.sh" ]; then
  . "$EXTRA_DIR/install.sh"
fi

echo "Setup complete. Please restart your terminal to get all the ZSH goodness."
