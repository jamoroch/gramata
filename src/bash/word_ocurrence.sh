#!/usr/bin/env bash
set -o errexit -o nounset
KALL='../../resources/original/Kall.pdf'
WORD_OCURRENCE_FILENAME='../../resources/word_ocurrence.in.sorted.txt'
WO_KEYS_FILENAME='../../resources/word_ocurrence.out.keys.txt'
WO_CONTEXT_FILENAME='../../resources/word_ocurrence.out.context.txt'
GERMAN_WORD_RE='[a-zA-zäöüßÄÜÖ]*'
if [[ ! -f $KALL ]]; then
  echo $KALL not found!
  exit 1
fi

if [[ ! -f $WORD_OCURRENCE_FILENAME ]]; then
  echo $WORD_OCURRENCE_FILENAME not found!
  exit 1
fi

[[ -e $WO_KEYS_FILENAME ]] && :> $WO_KEYS_FILENAME
[[ -e $WO_CONTEXT_FILENAME ]] && :> $WO_CONTEXT_FILENAME

while IFS= read -r  ; do
  WORD=$REPLY
  echo "##### $WORD #####"  | tee -a $WO_KEYS_FILENAME
  pdfgrep -Pino "$GERMAN_WORD_RE$WORD$GERMAN_WORD_RE" $KALL | tee -a $WO_KEYS_FILENAME
    echo "##### $WORD #####"  | tee -a $WO_CONTEXT_FILENAME
  pdfgrep -Pin "$GERMAN_WORD_RE$WORD$GERMAN_WORD_RE" $KALL  |  tee -a $WO_CONTEXT_FILENAME
done < $WORD_OCURRENCE_FILENAME