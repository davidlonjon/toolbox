#!/bin/bash
# This is shamely inspired by
# https://github.com/cowboy/dotfiles/blob/master/bin/dotfiles

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

e_header 'Bootstraping - "Lucky" David Lonjon'

if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP

Usage: $(basename "$0")

HELP
exit; fi


# Install .oh-my-zsh if not already there
if [[ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]]; then
    e_header "Installing .oh-my-zsh"
    curl -L http://install.ohmyz.sh | sh
    chsh -s /bin/zsh
fi

# Create symblinks for dotfiles
source ./scripts/bootstrap/common/symlink_dotfiles.sh

# Work in progress so not done at the moment
# source ./scripts/bootstrap/osx/osx.sh
# source ./scripts/bootstrap/ubuntu/]ubuntu.sh

# All done!
e_header "All done!"

