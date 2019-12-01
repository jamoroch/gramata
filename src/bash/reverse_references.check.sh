#!/usr/bin/env bash
cd "$( dirname "S{BASH_SOURCE[0]}" )"
KALL='../../resources/original/Kall.pdf'
REVERSE_REFERENCE_FILENAME='../../resources/reverse_references.txt'

while IFS= read -r  ; do
  WORD=$(echo $REPLY | sed -e "s/[ \t]$+//g")
  pdfgrep --quiet "$WORD" $KALL
  [[ 0 -eq $? ]] || echo "$WORD"  
done < $REVERSE_REFERENCE_FILENAME