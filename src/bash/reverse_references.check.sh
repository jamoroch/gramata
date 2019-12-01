#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"
KALL='../../resources/original'
REVERSE_REFERENCE_FILENAME='../../resources/reverse_references.txt'

while IFS= read -r  ; do
  cat $KALL | grep --quiet $REPLY
  [[ 0 -eq $? ]] || echo $REPLY  
done < $REVERSE_REFERENCE_FILENAME