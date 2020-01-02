#! /usr/bin/env bash
set -o errexit -o nounset
OUTPUT_DIR=../../../resources/
OUTPUT_FILENAME=${1:-lit_id.txt}
OUTPUT_FILE=$OUTPUT_DIR$OUTPUT_FILENAME
cat ../../../data.txt | cut -d: -f1 > $OUTPUT_FILE