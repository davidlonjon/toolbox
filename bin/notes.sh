#! /usr/bin/env bash
#
# notes
#
# Taken from https://github.com/pengwynn/dotfiles/blob/d698dac49246f38111a4c6f66cf04f639645e928/bin/notes
#

if [[ -z $PATTERN ]]; then
  PATTERN='TODO|HACK|FIXME|OPTIMIZE'
fi

gawk 'match($0, /^.*('$PATTERN'):?\s?(.*)$/, ary) {print FILENAME":"FNR":"ary[1]":"ary[2]}' $@