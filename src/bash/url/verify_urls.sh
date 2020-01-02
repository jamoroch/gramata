#!/usr/bin/env bash
set -o errexit -o nounset
cd "$( dirname "S{BASH_SOURCE[0]}" )"
source ../rc

FILE=$1

while IFS= read -r line; do  echo $line; curl -i -L -s $line | head -1  ; done < $FILE