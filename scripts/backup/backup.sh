#!/bin/bash
# ----------------------------------------------------------------------
# Handy rsynch incremental rotating backup script
#
# This script is inspired by:
# http://www.noah.org/engineering/src/shell/rsync_backup
# ----------------------------------------------------------------------

# Turn on basic error catching.
set -e # Exit immediately if a simple command exits with a non-zero status
set -u # Variables that are not set are errors
set -x # Print commands when executed

usage() {
    echo "usage: rsync_backup [-v] SOURCE_PATH BACKUP_PATH [EXCLUDE_FROM]"
    echo "    SOURCE_PATH and BACKUP_PATH may be ssh-style remote paths; although,"
    echo "    BACKUP_PATH is usually a local directory where you want the"
    echo "    backup set stored."
    echo "    EXCLUDE FROM (optional) is the path of the exclude file list."
    echo "    -v : set verbose mode"
}

# Get todays date in ISO-8601 format:
DAY0=`date -I`

# Get yesterdays date in ISO-8601 format:
DAY1=`date -I -d "1 day ago"`

EXC_FROM="/home/kyouens/.scripts/backup_exclude.txt"  #Set this if you want to use an exclusion file.

while getopts ":vh" options; do
    case $options in
        v ) VERBOSE=1;;
        h ) usage
            exit 1;;
        \? ) usage
            exit 1;;
        * ) usage
            exit 1;;
    esac
done
shift $(($OPTIND - 1))

SOURCE_PATH=$1
BACKUP_PATH=$2

if [ -z $SOURCE_PATH ] ; then
    echo "Missing argument. Give source path and backup path."
    usage
    exit 1
fi
if [ -z $BACKUP_PATH ] ; then
    echo "Missing argument. Give source path and backup path."
    usage
    exit 1
fi

#
EXCLUDES=./project_backup_exclude.list



# rsync
#   -h
#   --progress
#   --stats
#   -a
#   --update
#   --delete-after
#   --delete-excluded
#   --exclude=db_dumps
#   /home/david/projects/soompi
#   /home/david/.dropbox_enswers/Dropbox/backups/
