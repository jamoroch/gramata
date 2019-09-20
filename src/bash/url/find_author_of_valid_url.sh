#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"
source ../rc

FILE=${1:-../../resources/data.txt}

cat $FILE | grep -E https? | pcregrep $URL_REGEX | awk '{print $1}' | sed 's/,$//'