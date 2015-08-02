#!/bin/sh
# This is shamely inspired by"
# https://github.com/cowboy/dotfiles/blob/master/bin/dotfiles
# https://github.com/matthewmueller/dots/blob/master/dots.sh
# https://gist.github.com/brandonb927/3195465
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -eu

export dirname=$(dirname $(realpath $0))
export core_utils="$dirname/core_utils"
export lib="$dirname/lib"

if [ -f "$core_utils/colors/index.sh" ]; then
  source "$core_utils/colors/index.sh"
else
  echo "Failed to load 'colors' core utility"
  exit
fi

if [ -f "$core_utils/echo/index.sh" ]; then
  source "$core_utils/echo/index.sh"
else
  echo "Failed to load 'echo' core utility"
  exit
fi

if [ -f "$core_utils/load_module/index.sh" ]; then
  source "$core_utils/load_module/index.sh"
else
  echo "Failed to load 'load_module' core utility"
  exit
fi

# Loading modules
e_header "Loading modules"
load_module "is-osx"
load_module "is-ubuntu"
load_module "symlink"
load_module "brew"
load_module "gem"

if [ 1 -eq `osx` ]; then
  e_header 'Bootstraping - "Lucky" David Lonjon'
  e_success "You are on mac"
else
  e_error "You are not on mac"
fi

if [ 1 -eq `ubuntu` ]; then
  e_success "You are on ubuntu"
else
  e_error "You are not on ubuntu"
fi





# # if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP

# # Usage: $(basename "$0")

# # HELP
# # exit; fi

# All done!
e_header "All done!"
