#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"
source ../rc

FILE=$1

cat $FILE | pcregrep -o $URL_REGEX | sed 's/\.$//g'