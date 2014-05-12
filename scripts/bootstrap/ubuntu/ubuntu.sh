# OSX-only stuff. Abort if not OSX.
[[ $OSTYPE =~ ^linux ]] || return 1

echo "yes on linux"
