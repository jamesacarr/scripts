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
  echo "   post_install     Runs post-install setup for installed packages"
  echo "   symlinks         Creates symlinks"
}

sub_all() {
  # Update dotfiles before continuing
  echo "--- Checking for latest dotfiles version"
  [ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin main

  sub_symlinks
  sub_packages
  sub_macros
}

sub_macros () {
  for DEFAULTS_FILE in "${DOTFILES_DIR}"/macros/defaults*.sh; do
    if [ -f "$DEFAULTS_FILE" ]; then
      echo "--- Applying ${DEFAULTS_FILE}" && . "${DEFAULTS_FILE}"
    fi
  done
  echo "--- Done. Some changes may require a logout/restart to take effect."
}

sub_packages () {
  echo "--- Installing ${DOTFILES_DIR}/packages/homebrew.sh" && . "${DOTFILES_DIR}/packages/homebrew.sh"
  echo "--- Installing ${DOTFILES_DIR}/packages/mise.sh" && . "${DOTFILES_DIR}/packages/mise.sh"
  sub_post_install
  echo "--- Done"
}

sub_post_install () {
  echo "--- Running ${DOTFILES_DIR}/packages/post-install.sh" && . "${DOTFILES_DIR}/packages/post-install.sh"
}

sub_symlinks () {
  echo "--- Creating git symlinks"
  for GIT_FILE in "${DOTFILES_DIR}"/git/*; do
    if [ -f "$GIT_FILE" ]; then
      ln -sfv "$GIT_FILE" ~/.$(basename "$GIT_FILE")
    fi
  done

  echo "--- Creating mise symlinks"
  mkdir -p ~/.config/mise
  for MISE_FILE in "${DOTFILES_DIR}"/mise/*; do
    if [ -f "$MISE_FILE" ]; then
      ln -sfv "$MISE_FILE" ~/.config/mise/$(basename "$MISE_FILE")
    fi
  done

  echo "--- Creating wezterm symlinks"
  mkdir -p ~/.config/wezterm
  for WEZTERM_FILE in "${DOTFILES_DIR}"/wezterm/*; do
    if [ -f "$WEZTERM_FILE" ]; then
      ln -sfv "$WEZTERM_FILE" ~/.config/wezterm/$(basename "$WEZTERM_FILE")
    fi
  done

  echo "--- Creating zsh symlinks"
  for ZSH_FILE in "${DOTFILES_DIR}"/zsh/*; do
    if [ -f "$ZSH_FILE" ]; then
      ln -sfv "$ZSH_FILE" ~/.$(basename "$ZSH_FILE")
    fi
  done

  mkdir -p ~/.config/zsh
  for ZSH_FILE in "${DOTFILES_DIR}"/zsh/config/*; do
    if [ -f "$ZSH_FILE" ]; then
      ln -sfv "$ZSH_FILE" ~/.config/zsh/$(basename "$ZSH_FILE")
    fi
  done

  echo "--- Creating starship symlinks"
  ln -sfv "${DOTFILES_DIR}/starship/starship.toml" ~/.config/starship.toml

  echo "--- Creating agent symlinks"
  mkdir -p ~/.pi/agent ~/.codex ~/.claude
  for AGENT_FILE in "${DOTFILES_DIR}"/agents/*; do
    if [ -f "$AGENT_FILE" ]; then
      ln -sfv "$AGENT_FILE" ~/.pi/agent/$(basename "$AGENT_FILE")
      ln -sfv "$AGENT_FILE" ~/.codex/$(basename "$AGENT_FILE")
      ln -sfv "$AGENT_FILE" ~/.claude/$(basename "$AGENT_FILE")
    fi
  done

  echo "--- Done"
}

# Make sure to keep this in sync with the available public commands
sub_completion () {
  echo "help all macros packages post_install symlinks"
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
