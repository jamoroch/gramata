#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"

REFERENCES='../../resources/references.raw.txt'
BLACKLIST='../../resources/references.blacklist.txt'
BIBLIOGRAPHY='../../resources/lit_id.txt'

if [[ ! -f "$REFERENCES" ]]; then
  echo "$REFERENCES not a file"
  exit 1;
fi

if [[ ! -f "$BLACKLIST" ]]; then
  echo "$BLACKLIST not a file"
  exit 1;
fi

if [[ ! -f "$BIBLIOGRAPHY" ]]; then
  echo "$BIBLIOGRAPHY not a file"
  exit 1;
fi

while IFS= read -r  ; do
  LASTNAME=$(echo $REPLY | awk '{print $1}')
  YEAR=$(echo $REPLY | awk '{print $2}')
  ITEM=$LASTNAME$YEAR
  if [[ ( $(cat "$BIBLIOGRAPHY" | egrep -s $LASTNAME | egrep -s "$YEAR\b") ) || (  $(cat $BLACKLIST | egrep -s $ITEM) ) ]]; then
    echo $REPLY
  fi
done < $REFERENCES