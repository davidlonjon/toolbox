#!/bin/bash
## Title           : scriptname.sh
## Description     : Script description
## Author          : David Lonjon
## Date            : yyyy-mm-dd
## Version         : 0.0
## Notes           : Additional info regarding the script such as dependencies.
##==============================================================================


## Usage           : myscript.sh [options] ARG1
## Usage:        script.sh [-a|--alpha] [-b=val|--beta=val]
##
## Options:
##   -h, --help    Display this message.
##   -n            Dry-run; only show what would be done.
##==============================================================================

## CONSTANT
## Note some are using declare -r to make them read only
##==============================================================================
## Path of this file including filename
declare -r script_full_path=$(readlink -f $0)
## Directory where this file is
declare -r script_dir_name=`dirname ${script_full_path}`
## File name of this script.
declare -r script_fullname=`basename ${script_full_path}`
## Logging File name based on script name
declare logger="${script_fullname}.log"

## SETTINGS
## Turn on basic error catching.
##==============================================================================
set -e ## Exit immediately if a simple command exits with a non-zero status
set -u ## Variables that are not set are errors
set -o noclobber
set -o pipefail
shopt -s nullglob ## Avoid that your /foo/* glob is interpreted literally if there are no files matching that expression.
#set -x ## Print commands when executed

## DEFAUTS
##===============================================================================
declare quiet="false"

## DEFAULTS FUNCTIONS
##===============================================================================
function usage() {

   echo "
    usage: $script_fullname [options]

    -h           optional  Print this help message
    -q           optional  Suppress log messages on screen, just log them.
                 default False
    -l <log>     optional  print errors and output to this file.
                 default ${script_fullname}.log
    -o <outdir>  optional  store output here.
                 default is <put ur default here>"
  exit 2
  # echo "Usage script.sh [-a|--alpha] [-b=val|--beta=val]"
  # exit 2
} 2>/dev/null


function logit {
  if [[ $quiet == "true" ]]
  then
    echo $1 1>> $logger
  else
    echo $1 |tee -a $logger
  fi
}

# Parse Parameters #
for ARG in $*; do
  case $ARG in
    -h|--help) usage ;;
    -q|--quiet) quiet='true' ;; # Suppress messages, just log them.
    -l|--log) logger="$OPTARG" ;;
    -a|--alpha)
      A=true
      ;;
    -b=*|--beta=*)
      B=${ARG#*=}
      ;;
    *)
      logit "Unknown Argument $ARG"
      usage
      ;;
    \?)
     logit "Invalid option: -$OPTARG \n"
     usage
     ;;
  esac
done


## Put your main code here.
function main() {
  logit "Initializing `date`"
  echo "TEST"
}
# Do Some Stuff #
# echo "Usage script.sh [-a|--alpha] [-b=val|--beta=val]"
# echo "A: $A"
# echo "B: $B"



# main() {
#   while [ $# -gt 0 ]; do
#     case $1 in
#     (-n) DRY_RUN=1;;
#     (-h|--help) usage 2>&1;;
#     (--) shift; break;;
#     (-*) usage "$1: unknown option";;
#     (*) break;;
#     esac
#   done
#   : do stuff.
# }

main "$@"