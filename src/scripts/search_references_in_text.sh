#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"


REFS_DIR='../../resources/refs'

BIBLIOGRAPHY='../../data.txt'

for rf in $(ls $REFS_DIR)
  do
    PREFIX=$(echo $rf | cut -d. -f1)
    echo $PREFIX
    while IFS= read -r line; do
      if [[ ! $(grep -s $line $BIBLIOGRAPHY)  ]]; then
        echo $line
      fi
    done < $REFS_DIR/$rf
  done