#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"

CHAPTERS_DIR='../../resources/original'
DATA_FILENAME='../../resources/data.txt'

cat $DATA_FILENAME | cut -d: -f1 | sed -e "s/[0-9]//g" -e "s/[()]//g" | \
#awk -F/ '{for(i=1;i<=NF;i++){split($i, a, ","); print a[1]}}' | \
awk -F/ '{ split($0, a, ","); print a[1] }' | \
sed -e "s/^ *//g" | sort | uniq