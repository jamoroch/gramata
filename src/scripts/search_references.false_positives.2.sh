#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"

REFERENCES='../../resources/references.raw.txt'
BLACKLIST='../../resources/references.blacklist.txt'
BIBLIOGRAPHY='../../resources/lit_id.txt'
while IFS= read -r  ; do
  [[ $(egrep -s "K[0-9]+"  $REFERENCES) ]] && echo $REPLY
  LASTNAME=$(echo $REPLY | cut -d' ' -f1)
  YEAR=$(echo $REPLY | cut -d' ' -f2)
  if [[ $(cat "$BIBLIOGRAPHY" | egrep -s $LASTNAME | egrep -s $YEAR) ]]; then
    ITEM=$LASTNAME$YEAR
    if [[ ! $(egrep -s $LASTNAME $BLACKLIST | egrep -s $YEAR) ]]; then
      echo $REPLY 
      fi
  fi
done < $REFERENCES