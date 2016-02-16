#!/bin/bash
## Title           : scriptname.sh
## Description     : Script description
## Author          : David Lonjon
## Date            : yyyy-mm-dd
## Version         : 0.0
## Notes           : Additional info regarding the script such as dependencies.
## -------------------------------------------------------------------

## -------------------------------------------------------------------
## Usage           : myscript.sh [options] ARG1
## Usage:        script.sh [-a|--alpha] [-b=val|--beta=val]
##
## Options:
##   -h, --help    Display this message.
##   -n            Dry-run; only show what would be done.
## -------------------------------------------------------------------

## -------------------------------------------------------------------
## CONSTANT
## Note some are using declare -r to make them read only
## -------------------------------------------------------------------

declare -r script_version="0.1"

## Path of this file including filename
declare -r script_full_path=$(readlink -f $0)

## Directory where this file is
declare -r script_dir_name=`dirname ${script_full_path}`

## Script filename. i.e. myscript.sh
declare -r script_fullname=${0##*/}
## or
#declare -r script_fullname=`basename ${script_full_path}`
#declare -r script_fullname=`basename $0`

## Script basename. ie,e myscript
declare -r  script_basename=${script_fullname/\.sh/}

## Logging File name based on script name
declare logger="${script_basename}.log"

## -------------------------------------------------------------------
## SETTINGS
## Turn on basic error catching.
## -------------------------------------------------------------------
set -e ## Exit immediately if a simple command exits with a non-zero status
set -u ## Variables that are not set are errors
set -o noclobber
set -o pipefail
shopt -s nullglob ## Avoid that your /foo/* glob is interpreted literally if there are no files matching that expression.
#set -x ## Print commands when executed

## -------------------------------------------------------------------
## DEFAULTS FUNCTIONS
## -------------------------------------------------------------------
function show_usage() {

   echo "
    usage: $script_fullname [OPTION]... [REMAINING ARGUMENTS]...

    options
      -h, --help                      Print this help message
      -q, --quiet                     Suppress non-error messages on screen
      -v, --version                   Print this script version number
      -l[logname], --log[=logname]    Print errors and output to a log file.
                                      Default for logname: ${script_basename}.log
      -a, --alpha                     Extra option # 1. Do not require any argument
      -b[value], --beta[=value]       Extra option # 2 with optional argument
                                      Default: mybeta
      -g, --gamma                     Extra option # 3 with required paramater"
  exit 1
} 2>/dev/null


function msg() {
  if [[ $quiet == "true" ]]; then
    if [[ $log == "true" ]]; then
      echo $1 1>> $logger
    fi
  else
    if [[ $log == "true" ]]; then
      echo $1 |tee -a $logger
    else
      echo $1
    fi
  fi
}

## -------------------------------------------------------------------
## DEFAUTS
## -------------------------------------------------------------------
declare quiet="false"
declare log="false"
declare alpha="false"
declare beta="false"
declare beta_value="myvalue"
declare gamma="false"
declare gamma_value=""

declare -r short_options='hqvl::ab::g:'
declare -r long_options='help,quiet,version,log::,alpha,beta::,gamma:'

# Allow errors to we can trap it ourselve and show the usage message
set +e
# Get and parse options using /usr/bin/getopt
args=$(getopt -o $short_options -l $long_options -n "$script_fullname" -- "$@")

if [ $? != 0 ] ; then
  show_usage
fi
set -e

# # Note the quotes around `$args': they are essential for handling spaces in
# # option values!
eval set -- "$args"

while true ; do
    case "$1" in
            -h|--help) show_usage ;;
            -q|--quiet) quiet="true"; shift ;;
            -v|--version)
              # Re-enable Logging to show the message and show version
              quiet="false"; msg "Version: $script_version"; exit 0 ;;
            -l|--log)
              log="true"
              case "$2" in
                "") shift 2 ;; ## No argument use default log file
                *) logger=$2; shift 2 ;;
              esac ;;
            -a|--alpha) alpha="true"; shift ;;
            -b|--beta)
                beta="true";
                 case "$2" in
                "") shift 2 ;; ## No argument use dfault log file
                *) beta_value=$2; shift 2 ;;
              esac ;;
            -g|--gamma) gamma="true"; gamma_value=$2; shift 2 ;;
            --) shift ; break ;;
            *) echo "Unknown parameter or option error!"; show_usage ;;
    esac
done

## Put your main code here.
function main() {
  msg "Initializing `date`"
  if [[ $beta == "true" ]]; then
    msg "beta_value is $beta_value"
  fi
  if [[ $gamma == "true" ]]; then
    msg "gamma_value is $gamma_value"
  fi

  echo "The remaining arguments are:"
  for arg do echo '--> '"\`$arg'" ; done
}

main "$@"