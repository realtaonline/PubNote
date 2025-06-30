#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteOutExtract.sh
#
# A shell script for processing a PubNote distribution XML output file into
# the set of XML Article files found embedded in an ArticleSet document 
# element. This also will copy an XML output file that has an Article document
# element.
#
# Usage:
#   PubNoteOutExtract.sh file.xml [indent=yes]
#
# The output file is placed in a subdirectory named after the input file.
#
# Errors are recorded in a log file in the input file directory.
#
# ---------------------------------------------------------------------------

# Get the absolute path to the script's parent's directory (inside the repo)
REPO="$(cd "$(dirname "$0")" && cd .. && pwd)"

# Require input file
if [[ -z "$1" ]]; then
  echo Usage: PubNoteOutExtract.sh distributionFile.xml [indent=yes]
  exit 1
fi

FILEDIR="$(cd "$(dirname "$1")" && pwd)"
INPUT="$(basename "$1")"
INPUTBASE="${INPUT%.*}"

# Paths
SAXON_JAR="$REPO/utilities/saxon12he/saxon12he.jar"
XSL="$REPO/xsl/PubNoteOutExtract.xsl"
LOG="${INPUT}.extract.log.txt"

echo Extracting "$FILEDIR/$INPUT" to "$FILEDIR/$INPUTBASE"...

if [[ ! -d "$FILEDIR/$INPUTBASE" ]] ; then mkdir "$FILEDIR/$INPUTBASE" ; fi

java -jar "$SAXON_JAR" -s:"$FILEDIR/$INPUT" -xsl:"$XSL" "${@:2}" 2> "$FILEDIR/$LOG"
retval=$?
if [[ "$retval" != "0" ]]; then
  echo Saxon execution error
  echo Saxon execution error >>"$FILEDIR/$LOG"
  exit 1
fi

if [[ -e "$FILEDIR/$LOG" ]]; then
  cat "$FILEDIR/$LOG"
  if [ ! -s "$FILEDIR/$LOG" ]; then
    rm "$FILEDIR/$LOG"
  fi
fi

exit $retval