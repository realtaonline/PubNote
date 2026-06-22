#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteInIndent.sh
#
# Produces an indented version of a PubNote submission XML input file,
# without its document type declaration.
#
# Usage:
#   PubNoteInIndent.sh file.xml
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
  echo Usage: PubNoteInIndent.sh file.xml
  exit 1
fi

FILEDIR="$(cd "$(dirname "$1")" && pwd)"
INPUT="$(basename "$1")"
INPUTBASE="${INPUT%.*}"

# Paths
SAXON_JAR="$REPO/utilities/saxonhe/saxonhe.jar"
XSL="$REPO/xsl/PubNoteIndent.xsl"
LOG="${INPUT}.indent.log.txt"

echo Indenting "$FILEDIR/$INPUT" to "$FILEDIR/$INPUTBASE"...

java -jar "$SAXON_JAR" -s:"$FILEDIR/$INPUT" -xsl:"$XSL" -o:"$FILEDIR/$INPUTBASE/$INPUTBASE.indent.xml"  2> "$FILEDIR/$LOG"
retval=$?
if [[ "$retval" != "0" ]]; then echo Saxon execution error; exit 1 ; fi

if [[ -e "$FILEDIR/$LOG" ]]; then
  cat "$FILEDIR/$LOG"
  if [ ! -s "$FILEDIR/$LOG" ]; then
    rm "$FILEDIR/$LOG"
  fi
fi

exit $retval