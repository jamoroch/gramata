#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"
FILE_DIR='../../../resources/original'
OUTPUT_DIR='../../../resources/refs'
if [[ ! -d "$FILE_DIR" ]]; then
  echo $FILE_DIR not a directory
  exit 1;
fi

cd $FILE_DIR

for i in $(seq 2 11); do
  FILE=K$i.txt
  if [[ ! -f "$FILE" ]]; then
    echo "$FILE" not a FILE
    exit 1; 
  fi
  echo ${FILE%.txt}
  cat $FILE | egrep -o '([A-Z]\w+\/\s?)?[A-Z]\w+ \(?[0-9]{4}[a-z]*' | sed -e 's/(//g' -e 's#/# #g' | sort | uniq
  done

  cd -
  exit 0;