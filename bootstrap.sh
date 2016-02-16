#!/bin/bash
# This is shamely inspired by
# https://github.com/cowboy/dotfiles/blob/master/bin/dotfiles

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

set -e

cd "$( dirname $0 )"
script_directory="$( pwd )"
cd "$script_directory"

e_header 'Bootstraping - "Lucky" David Lonjon'

if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP

Usage: $(basename "$0")

HELP
exit; fi

OSTYPE=$( uname | tr '[:upper:]' '[:lower:]')

command -v zsh >/dev/null 2>&1 || {
  e_header "Installing zsh"
  if [[ $OSTYPE == 'linux' ]]; then
    sudo apt-get update
    sudo apt-get install zsh
  elif  [[ $OSTYPE == 'darwin' ]]; then
    brew install zsh
  fi
  chsh -s $(which zsh)
}

# Install .oh-my-zsh if not already there
if [[ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]]; then
    e_header "Installing .oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Create symlinks for dotfiles
source ./scripts/bootstrap/common/symlink_dotfiles.sh

# All done!
e_header "All done!"

