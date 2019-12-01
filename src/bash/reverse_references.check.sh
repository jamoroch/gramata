#!/usr/bin/env bash
cd "$( dirname "S{BASH_SOURCE[0]}" )"
KALL='../../resources/original/Kall.txt'
REVERSE_REFERENCE_FILENAME='../../resources/reverse_references.txt'

while IFS= read -r  ; do
  WORD=$(echo $REPLY | sed -e "s/[ \t]$+//g")
  cat $KALL | grep --quiet --word-regexp "$WORD"
  [[ 0 -eq $? ]] || echo "$WORD"  
done < $REVERSE_REFERENCE_FILENAME