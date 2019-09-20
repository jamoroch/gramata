#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"

INPUT='../../resources/search_references.split.sorted.txt'
BIBLIOGRAPHY='../../data.txt'

if [[ ! -f "$INPUT" ]]; then
  echo "$INPUT not a file"
  exit 1;
fi

while IFS= read -r ; do
  LASTNAME=$(echo $REPLY | cut -d' ' -f1)
  YEAR=$(echo $REPLY | cut -d' ' -f2)
  if [[ $(cat "$BIBLIOGRAPHY" | egrep -s $LASTNAME | egrep -s $YEAR ) ]]; then
  echo $REPLY | tee -a false_positive.txt
  fi
done < $INPUT