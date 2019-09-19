#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"

REFS_DIR='../../resources/refs'
BLACKLIST='../../resources/search_references_blacklist.txt'
BIBLIOGRAPHY='../../data.txt'

for rf in $(ls $REFS_DIR)
  do
    PREFIX=$(echo $rf | cut -d. -f1)
    echo $PREFIX
    LINE=''
    while IFS= read -r regex; do
      if [[ ! $(egrep -s "$regex" $BIBLIOGRAPHY) ]]; then
        ITEM=$( echo $regex | sed -e 's/^\^//g' -e 's/\*//g' -e 's/\.//g' -e 's/\?//g' -e 's/)//g' -e 's/\\(//g' )
        if [[ ! $(egrep -s $ITEM $BLACKLIST) ]]; then
          LINE+=$ITEM
          LINE+=' '
        fi
      fi
    done < $REFS_DIR/$rf
    echo $LINE
  done