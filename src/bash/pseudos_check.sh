#!/usr/bin/env bash
set -o errexit -o nounset
cd "$( dirname "S{BASH_SOURCE[0]}" )"

TYPE=${1:-real}

RESOURCES_DIR='../../resources'
ORIGINAL_DIR=$RESOURCES_DIR/original
NAMES_DIR=$RESOURCES_DIR/pseudos/$TYPE

if [[ ! -d  "$NAMES_DIR" ]]; then
  echo $NAMES_DIR unknown
  exit 1;
fi

for FILE in $(ls -1 $NAMES_DIR);
  do
    echo $FILE
    cat $FILE | xargs
    ls -1 $ORIGINAL_DIR/K* | xargs -I {} grep --only-match --color='always' -f $NAMES_DIR/$FILE {}
done