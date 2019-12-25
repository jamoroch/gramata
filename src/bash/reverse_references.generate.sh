#!/usr/bin/env bash
set -e -u
cd "$( dirname "S{BASH_SOURCE[0]}" )"

DATA_FILENAME='../../resources/data.txt'
YEAR_REGEX='[0-9]{4}'
YEAR_WITH_EDITION_REGEX="(?<=[0-9])$YEAR_REGEX"

GREP_CMD='/usr/local/Cellar/grep/3.3/bin/ggrep'

if [[ ! -f $GREP_CMD ]]; then
  echo "$GREP_CMD not found!"
  exit 1;
fi

while IFS= read -r  ; do
   LIT_ID=$(echo $REPLY| cut -d: -f1)

  NUM_OF_AUTHORS=$(echo $LIT_ID | awk -F/ '{print NF}')
  FIRST_AUTHOR=$(echo $LIT_ID |  sed 's/([0-9]*.*)//g' | cut -d, -f1)
  case "$NUM_OF_AUTHORS" in
    1) AUTHOR=$FIRST_AUTHOR
      ;;
    2) SECOND_AUTHOR=$(echo $LIT_ID | awk -F/ '{ split($2, a, ","); print a[1] }'); AUTHOR="$FIRST_AUTHOR /$SECOND_AUTHOR"
      ;;
    *) AUTHOR="$FIRST_AUTHOR et al."
      ;;
  esac

  RAW_YEAR=$(echo $LIT_ID | $GREP_CMD -o '[0-9]*')
  NUM_OF_DIGITS=${#RAW_YEAR}
  [[ 4 -eq $NUM_OF_DIGITS ]] && RE=$YEAR_REGEX || RE=$YEAR_WITH_EDITION_REGEX
  YEAR=$(echo $RAW_YEAR | $GREP_CMD -Po $RE || echo 'o.J.')
  AB_PUBLICATION=$(echo $LIT_ID | $GREP_CMD -o '(.*)' | $GREP_CMD -o '[a-z]' || echo '' )

  echo "$AUTHOR ($YEAR$AB_PUBLICATION)"

done < $DATA_FILENAME
