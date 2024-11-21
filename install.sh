#!/bin/bash

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BIN_NAME=$(basename "$0")
COMMAND_NAME=$1
SUB_COMMAND_NAME=$2

sub_help () {
  echo "Usage: $BIN_NAME <command>"
  echo
  echo "Commands:"
  echo "   help             This help message"
  echo "   all              Installs macros, symlinks, packages"
  echo "   macros           Apply macOS system defaults"
  echo "   packages         Installs package managers and packages"
  echo "   symlinks         Creates symlinks"
}

sub_all() {
  # Update dotfiles before continuing
  echo "Checking for latest dotfiles version"
  [ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

  sub_symlinks
  sub_packages
  sub_macros
}

sub_macros () {
  for DEFAULTS_FILE in "${DOTFILES_DIR}"/macros/defaults*.sh; do
    echo "Applying ${DEFAULTS_FILE}" && . "${DEFAULTS_FILE}"
  done
  echo "Done. Some changes may require a logout/restart to take effect."
}

sub_packages () {
  echo "Installing ${DOTFILES_DIR}/packages/homebrew.sh" && . "${DOTFILES_DIR}/packages/homebrew.sh"
  echo "Installing ${DOTFILES_DIR}/packages/asdf.sh" && . "${DOTFILES_DIR}/packages/asdf.sh"
  echo "Installing ${DOTFILES_DIR}/packages/zsh.sh" && . "${DOTFILES_DIR}/packages/zsh.sh"
  echo "Done. Some changes may require you to restart your terminal."
}

sub_symlinks () {
  echo "Creating git symlinks"
  ln -sfv $DOTFILES_DIR/git/git-commit-template ~/.git-commit-template
  ln -sfv $DOTFILES_DIR/git/gitconfig ~/.gitconfig
  ln -sfv $DOTFILES_DIR/git/gitconfig-zapier ~/.gitconfig-zapier
  ln -sfv $DOTFILES_DIR/git/gitignore-global ~/.gitignore-global

  echo "Done."
}

# Make sure to keep this in sync with the available public commands
sub_completion () {
  echo "help all macros packages symlinks"
}

case $COMMAND_NAME in
  "" | "-h" | "--help")
    sub_help
    ;;
  *)
    shift
    sub_${COMMAND_NAME} $@
    if [ $? = 127 ]; then
      echo "'$COMMAND_NAME' is not a known command or has errors." >&2
      sub_help
      exit 1
    fi
    ;;
esac
