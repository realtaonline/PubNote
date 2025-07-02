#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteInCheck.sh
#
# A shell script for validating a PubNote submission XML input file.
#
# Usage:
#   PubNoteInCheck.sh file.xml
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
  echo "Usage: PubNoteCheckIn.sh submissionFile.xml"
  exit 1
fi

FILEDIR="$(cd "$(dirname "$1")" && pwd)"
INPUT="$(basename "$1")"

# Paths
JING_JAR="$REPO/utilities/jing/bin/jing.jar"
RNG="$REPO/rng/PubMedIn.rng"
LOG="${INPUT}.in.log.txt"

echo Validating "$FILEDIR/$INPUT" using "$RNG" to "$FILEDIR/$LOG"...

# Delete outputs
if [[ -f "$FILEDIR/$LOG" ]]; then rm "$FILEDIR/$LOG" ; fi

# Validate XML using Jing
java -jar "$JING_JAR" "$RNG" "$FILEDIR/$INPUT" > "$FILEDIR/$LOG"
retval=$?

if [[ "$retval" -eq "0" ]]; then
  echo No validation errors
else
  echo Validation errors:
fi

if [[ -e "$FILEDIR/$LOG" ]]; then
  cat "$FILEDIR/$LOG"
  if [ ! -s "$FILEDIR/$LOG" ]; then
    rm "$FILEDIR/$LOG"
  fi
fi

exit $retval