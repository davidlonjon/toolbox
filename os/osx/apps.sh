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
#   seil
#   arq
#   flash
#   flux
#   vlc
#   cloudup
#   skype
#   transmission
# )

dev_apps=(
  apikitchen
  atom
  dash
  filezilla
  google-chrome-canary
  iterm2
  qlcolorcode
  qlmarkdown
  qlprettypatch
  qlstephen
  quicklook-json
  sublime-text3
  sequel-pro
  tunnelblick
  vagrant
  virtualbox
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