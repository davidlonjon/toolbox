#!/bin/sh
# This is shamely inspired by"
# https://github.com/cowboy/dotfiles/blob/master/bin/dotfiles
# https://github.com/matthewmueller/dots/blob/master/dots.sh
# https://gist.github.com/brandonb927/3195465
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e
version="0.0.1"

function main() {
  # From http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
  export dirname=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

  export core_utils="$dirname/core_utils"
  export lib="$dirname/lib"
  export os="$dirname/os"

  # parse options
  while [[ "$1" =~ ^- ]]; do
    case $1 in
      -v | --version )
        echo $version
        exit
        ;;
      -h | --help )
        usage
        exit
        ;;
    esac
    shift
  done

  # run command
  case $1 in
    boot )
      boot $2
      exit
      ;;
    *)
      usage
      exit
      ;;
  esac
}

# usage info
function usage() {
  cat <<EOF
  Usage: toolbox [options] [command] [args ...]
  Options:
    -v, --version           Get the version
    -h, --help              This message
  Commands:
    boot                Bootstrap the operating system
EOF
}

function load_core() {
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
}

function load_modules() {
  # Loading modules
  e_header "Loading modules"
  load_module "is-osx"
  load_module "is-ubuntu"
  load_module "symlink"
  load_module "gem"
}

# Bootstrap the OS
boot() {
  load_core
  load_modules
  if [ 1 -eq `osx` ]; then
    load_module "brew"
    e_header "Bootstraping OSX"
    source "$os/osx/index.sh"
    e_header "All done!"
  elif [ 1 -eq `ubuntu` ]; then
    e_header "Bootstraping Ubuntu"
    # Create symblinks for dotfiles
    source ./scripts/bootstrap/common/symlink_dotfiles.sh
    e_header "All done!"
  else
    e_error "This OS is not supported (yet)"
    exit 0
  fi
}

# Call main
main "$@"

# All done!
