# Logging stuff.
function e_header()   { echo "\n\033[1m$@\033[0m"; }
function e_success()  { echo " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo " \033[1;33m➜\033[0m  $@"; }

# Color-echo. Improved. [Thanks @joaocunha]
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}


# From https://github.com/thoughtbot/laptop/blob/master/mac
fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}

