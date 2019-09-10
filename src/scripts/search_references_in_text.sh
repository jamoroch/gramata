#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"


REFS_DIR='../../resources/refs'

BIBLIOGRAPHY='../../data.txt'

for rf in $(ls $REFS_DIR)
  do
    PREFIX=$(echo $rf | cut -d. -f1)
    echo $PREFIX
    LINE=''
    while IFS= read -r regex; do
      if [[ ! $(egrep -s "$regex" $BIBLIOGRAPHY)  ]]; then
        LINE+=$(echo $regex | sed -e 's/\*//g' -e 's/\.//g' -e 's/\?//g' -e 's/)//g')
        LINE+=' '
      fi
    done < $REFS_DIR/$rf
    echo $LINE
  done