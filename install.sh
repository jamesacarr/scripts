#!/bin/bash

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles before continuing
echo "Checking for latest dotfiles version"
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Symlinks
echo "Copying symlinks"
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

mkdir -p ~/.atom
ln -sfv $DOTFILES_DIR/atom/* ~/.atom

# Installers
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/rbenv.sh"

# Pull down prezto config
echo "Pull down Prezto & config"
git clone --recursive https://github.com/carrgo/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# cd "${ZDOTDIR:-$HOME}/.zprezto"
# git-crypt unlock

# Change shell to zsh
echo "Changing shell"
sudo dscl . -create "/Users/$USER" UserShell /usr/local/bin/zsh

echo "Setup complete. Please restart your terminal to get all the ZSH goodness."
