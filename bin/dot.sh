#! /usr/bin/env bash
#
# dot
#
# `dot` handles installation, updates, things like that. Run it periodically
# to make sure you're on the latest and greatest.
# Taken from https://github.com/holman/dotfiles/blob/master/bin/dot

# Set OS X defaults
$ZSH/osx/set-defaults.sh

# Upgrade homebrew
brew update

# Install homebrew packages
$ZSH/homebrew/install.sh 2>&1