#!/usr/bin/env bash

#
# Application installer (via brew-cask)
#

# Apps
# apps=(
#   dropbox
#   google-chrome
#   qlcolorcode
#   slack
#   appcleaner
#   firefox
#   hazel
#   qlmarkdown
#   seil
#   vagrant
#   arq
#   flash
#   iterm2
#   qlprettypatch
#   sublime-text3
#   virtualbox
#   atom
#   flux
#   qlstephen
#   vlc
#   cloudup
#   quicklook-json
#   skype
#   transmission
#   apikitchen
# )

dev_apps=(
  iterm2
)

# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
)

# Specify the location of the apps
appdir="/Applications"


# Iinstall general apps
e_header "Installing development applications via homebrew cask..."
brew cask install --appdir=$appdir ${dev_apps[@]}

# install fonts
# e_header "Installing fonts via homebrew cask..."
# brew cask install ${fonts[@]}