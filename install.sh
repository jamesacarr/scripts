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
  echo "   all              Installs macros, symlinks, packages and extras"
  echo "   extras           Installs from files located in ~/.extra"
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
  sub_extra
}

sub_extra() {
  EXTRA_DIR="$HOME/.extra"
  if [ -d "$EXTRA_DIR" -a -f "$EXTRA_DIR/install.sh" ]; then
    . "$EXTRA_DIR/install.sh"
  fi
}

sub_macros () {
  for DEFAULTS_FILE in "${DOTFILES_DIR}"/macros/defaults*.sh; do
    echo "Applying ${DEFAULTS_FILE}" && . "${DEFAULTS_FILE}"
  done
  echo "Done. Some changes may require a logout/restart to take effect."
}

sub_packages () {
  for DEFAULTS_FILE in "${DOTFILES_DIR}"/packages/*.sh; do
    echo "Installing ${DEFAULTS_FILE}" && . "${DEFAULTS_FILE}"
  done
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
  echo "help all extras macros packages symlinks"
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
