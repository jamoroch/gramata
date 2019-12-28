#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"
PDF_FILENAME='../../../resources/original/Kall.pdf'

SED_CMD='/usr/local/Cellar/gnu-sed/4.5/bin/gsed'

if [[ ! -d "$FILE_DIR" ]]; then
  echo "$FILE_DIR not a directory"
  exit 1;
fi

if [[ ! -f "$PDF_FILENAME" ]]; then
  echo "$PDF_FILENAME not found!"
  exit 1;
fi

if [[ ! -f $SED_CMD ]]; then
  echo "$SED_CMD not found!"
  exit 1;
fi

pdfgrep -Po '([A-Z]\w+\/\s?)?[A-Z]\w+\s?(et al.)? \(?\d{4}[a-z]*(, \d{4}[a-z]*)*' $PDF_FILENAME | $SED_CMD -e 's/et al\.//g' -e 's/(//g' -e 's#/# #g' -e 's/^[ ]*//' -e 's/[ ]*$//' -e 's/\s\{2,\}/ /' | sort | uniq
exit 0;
  