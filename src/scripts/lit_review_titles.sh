#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"

LIT_FILE='../../data.txt'

OUTFILE='../../resources/lit_ids.txt'
:>$OUTFILE

NUM_LIT_ENTRIES=$(cat $LIT_FILE | wc -l)

SAMPLE_SIZE=$(($NUM_LIT_ENTRIES / 5))

ACC=''
for i in $(seq $SAMPLE_SIZE); do
  PICK=$(( RANDOM % ($NUM_LIT_ENTRIES + 1) ))
  ACC+=' '$PICK
  NUM_DIFFERENT_ENTRIES=$(echo $ACC | tr ' ' '\n' | sort | uniq | wc -l)
  while [ "$NUM_DIFFERENT_ENTRIES" -eq "$i" ]
  do
    PICK=$(( RANDOM % ($NUM_LIT_ENTRIES + 1) ))
    ACC+=' '$PICK
    NUM_DIFFERENT_ENTRIES=$(echo $ACC  | tr ' ' '\n' | sort | uniq | wc -l)
  done
  nl $LIT_FILE | cut -d: -f1 | sed -n ${PICK}p | tee -a $OUTFILE
done

sort -o $OUTFILE $OUTFILE
