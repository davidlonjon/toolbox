# Taken from https://github.com/cowboy/dotfiles/blob/master/init/10_osx.sh

# OSX-only stuff. Abort if not OSX.
[[ $OSTYPE =~ ^darwin ]] || return 1

e_header 'Mac specifc setup'

# dotfiles directory
dotfiles_dir = "~/toolbox/dotfiles"

# old dotfiles backup directory
dotfiles_backup_dir= "~/toolbox/dotfiles/_backup"

# .hushlogin
if [[ ! -f ~/.hushlogin ]]; then
    echo "Moving hushlogin dotfile from ~ to $dotfiles_backup_dir"
    mv ~/.hushlogin $dotfiles_backup_dir
fi
echo "Creating symlink to .hushlogin in home directory."
ln -s $dotfiles_dir/hushlogin/.hushlogin ~/.hushlogin

# Some tools look for XCode, even though they don't need it.
# https://github.com/joyent/node/issues/3681
# https://github.com/mxcl/homebrew/issues/10245
# if [[ ! -d "$('xcode-select' -print-path 2>/dev/null)" ]]; then
#   sudo xcode-select -switch /usr/bin
# fi

# Install Homebrew.
if [[ ! "$(type -P brew)" ]]; then
  e_arrow "Installing Homebrew"
  # true | /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
fi

# if [[ "$(type -P brew)" ]]; then
#   e_arrow "Updating Homebrew"
#   brew update
# fi

#   # Install Homebrew recipes.
#   recipes=(git tree gawk grc sl lesspipe id3tool nmap git-extras htop-osx man2html)

#   list="$(to_install "${recipes[*]}" "$(brew list)")"
#   if [[ "$list" ]]; then
#     e_arrow "Installing Homebrew recipes: $list"
#     brew install $list
#   fi

#   if [[ ! "$(type -P gcc-4.2)" ]]; then
#     e_header "Installing Homebrew dupe recipe: apple-gcc42"
#     brew install https://raw.github.com/Homebrew/homebrew-dupes/master/apple-gcc42.rb
#   fi
# fi