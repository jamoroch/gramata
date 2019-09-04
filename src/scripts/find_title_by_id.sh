#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"

FILE=$1

while IFS= read -r line; do
   cat ../resources/data.txt | cut -d: -f 1 | nl  | egrep  "$line.*?"
  done < $FILE