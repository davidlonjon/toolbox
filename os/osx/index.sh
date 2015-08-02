#!/usr/bin/env bash

# paths
osx="$os/osx"

e_header "Checking Xcode is installed ..."

if [ ! -d "/Applications/Xcode.app/Contents/Developer" ]; then
  cecho "Xcode does not seem to be installed. Please install it first via the App Store. Quitting" $red
  exit
else
  e_success "Xcode installed"
fi

if [ ! -d "/Library/Developer/CommandLineTools/" ]; then
  cecho "Installing Xcode Command Line Tools first. Once completed, please start again. Quitting " $red
  xcode-select --install
  exit
else
  e_success "Xcode Command Line Tools installed"
fi

# read -r response
# if [[ $response =~ ^([nN][oO]|[nN])$ ]]; then
#   cecho "Please install Xcode and Xcode command line developer tool first. Quitting" $red
#   exit 0
# fi

e_header "Installing Homebrew ..."
if ! command -v brew >/dev/null; then
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
    export PATH="/usr/local/bin:$PATH"
    e_success "Homebrew installed"
else
  e_success "Homebrew already installed. Skipping ..."
fi

e_header "Adding brew taps"
brew_tap "caskroom/fonts"
e_success "caskroom/fonts tapped"
brew_tap "phinze/homebrew-cask"
e_success "phinze/homebrew-cask tapped"
brew_tap "caskroom/versions"
e_success "caskroom/versions tapped"
brew_tap "homebrew/dupes"
e_success "homebrew/dupes tapped"

set +e
e_header "Updating homebrew ..."
brew update

e_header "Installing or updating brew-cask ..."
brew_install_or_upgrade "brew-cask"

# Run each program
source "$osx/binaries.sh"
set -e
# sh "$osx/defaults.sh"
# sh "$osx/binaries.sh"
# sh "$osx/apps.sh"

# Remove outdated versions from the cellar
e_header "Cleaning up brew and brew-cask"
brew cleanup && brew cask cleanup

# # Symlink the profile
# if [[ ! -e "$HOME/.bash_profile" ]]; then
#   echo "symlinking: $osx/profile.sh => $HOME/.bash_profile"
#   symlink "$osx/profile.sh" "$HOME/.bash_profile"
#   source $HOME/.bash_profile
# else
#   echo "$HOME/.bash_profile already exists. remove and run again."
# fi
