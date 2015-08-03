#!/usr/bin/env bash

#
# Application installer (via brew-cask)
#

# General Apps
apps=(
  appcleaner
  bartender
  bettertouchtool
  # arq
  cloudup
  dropbox
  flash
  firefox
  flux
  google-chrome
  google-drive
  google-hangouts
  libreoffice
  # hazel
  seil
  skype
  spectacle
  teamviewer
  timemachineeditor
  toggldesktop
  transmission
  the-unarchiver
  vlc
  xtrafinder
)

design_apps=(
  adobe-creative-cloud
  slicy
)

# Apps installed  via the App store
# Harvest
# Dash
# Aperture
# Todoist
# Slack
# Twitter
# Leaf
# Pocket
# Houdini
# Simplenote
# Snappy
# Skitch
# Kindle

dev_apps=(
  apikitchen
  atom
  cakebrew
  # charles
  dash
  filezilla
  firefoxdeveloperedition
  github
  google-chrome-canary
  iterm2
  poedit
  qlcolorcode
  qlmarkdown
  qlprettypatch # (https://github.com/atnan/QLPrettyPatch - QLPrettyPatch is a QuickLook generator for patch files.)
  qlstephen # (http://whomwah.github.io/qlstephen/ - A QuickLook plugin that lets you view plain text files without a file extension)
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

# Install general apps
e_header "Installing general applications via homebrew cask..."
brew cask install --appdir=$appdir ${apps[@]}

# Install design apps
e_header "Installing design applications via homebrew cask..."
brew cask install --appdir=$appdir ${design_apps[@]}

# Install development apps
e_header "Installing development applications via homebrew cask..."
brew cask install --appdir=$appdir ${dev_apps[@]}

# install fonts
# e_header "Installing fonts via homebrew cask..."
# brew cask install ${fonts[@]}