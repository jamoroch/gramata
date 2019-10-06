#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"

REFERENCES='../../../resources/references.raw.txt'
BLACKLIST='../../../resources/references.blacklist.txt'
BIBLIOGRAPHY='../../../resources/lit_id.txt'

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
  NUMBER_OF_FIELDS=$(echo $REPLY | awk '{print NF}')
  if [[ 2 -eq  "${NUMBER_OF_FIELDS}" ]]; then
    LASTNAME=$(echo $REPLY | awk '{print $1}')
    YEAR=$(echo $REPLY | awk '{print $2}')
    ITEM=$LASTNAME$YEAR
    if [[ ( $(cat "$BIBLIOGRAPHY" | egrep -s $LASTNAME | egrep -s "$YEAR\b") ) || (  $(cat $BLACKLIST | egrep -s $ITEM) ) ]]; then
      echo $REPLY
    fi
  elif [[ 3 -eq "${NUMBER_OF_FIELDS}" ]]; then
    LASTNAME_1=$(echo $REPLY | awk '{print $1}')
    LASTNAME_2=$(echo $REPLY | awk '{print $2}')
    YEAR=$(echo $REPLY | awk '{print $3}')
    if [[ ( $(cat "$BIBLIOGRAPHY" | egrep -s $LASTNAME_1 | egrep -s $LASTNAME_2 | egrep -s "$YEAR\b") ) ]]; then
      echo $REPLY
    fi
  fi
done < $REFERENCES