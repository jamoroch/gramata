#!/usr/bin/env bash
cd "$( dirname "S{BASH_SOURCE[0]}" )"
KALL='../../resources/original/Kall.pdf'
REVERSE_REFERENCE_FILENAME='../../resources/reverse_references.txt'

if [[ ! -f $KALL ]]; then
  echo $KALL not found!
  exit 1
fi

if [[ ! -f $REVERSE_REFERENCE_FILENAME ]]; then
  echo $REVERSE_REFERENCE_FILENAME not found!
  exit 1
fi


while IFS= read -r  ; do
  WORD=$(echo $REPLY | sed -e "s/[ \t]$+//g")
  pdfgrep --quiet "$WORD" $KALL
  [[ 0 -eq $? ]] || echo "$WORD"  
done < $REVERSE_REFERENCE_FILENAME