#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteOutIndent.sh
#
# A shell script for processing a PubNote distribution XML output file into
# an indented version of itself.
#
# Usage:
#   PubNoteOutIndent.sh file.xml
#
# The output file is placed in a subdirectory named after the input file.
#
# Errors are recorded in a log file in the input file directory.
#
# ---------------------------------------------------------------------------

# Get the absolute path to the script's parent's directory (inside the repo)
REPO="$(cd "$(dirname "$0")" && cd .. && pwd)"

# Require input file
if [[ -z "$1" || ! -f "$1" ]]; then
  if [[ ! -f "$1" ]]; then
    echo File "$1" not found.
    echo
  fi
  echo Usage: PubNoteOutIndent.sh distributionFile.xml
  exit 1
fi

FILEDIR="$(cd "$(dirname "$1")" && pwd)"
INPUT="$(basename "$1")"
INPUTBASE="${INPUT%.*}"

# Paths
SAXON_JAR="$REPO/utilities/saxon12he/saxon12he.jar"
XSL="$REPO/xsl/PubNoteOutExtract.xsl"
LOG="${INPUT}.indent.log.txt"

echo Extracting "$FILEDIR/$INPUT" to "$FILEDIR/$INPUTBASE"...

java -jar "$SAXON_JAR" -s:"$FILEDIR/$INPUT" -xsl:"$XSL" "indent=yes" "${@:2}" 2> "$FILEDIR/$LOG"
retval=$?
if [[ "$retval" != "0" ]]; then echo Saxon execution error; exit 1 ; fi

if [[ -e "$FILEDIR/$LOG" ]]; then
  cat "$FILEDIR/$LOG"
  if [ ! -s "$FILEDIR/$LOG" ]; then
    rm "$FILEDIR/$LOG"
  fi
fi

exit $retval