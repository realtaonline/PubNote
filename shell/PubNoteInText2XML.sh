#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteText2XML.sh
#
# A shell script for processing a PubNote in/submission text input file into
# an equivalent XML file.
#
# Supports an optional language suffix (e.g., -en, -fr, -de), passed as the
# environment variable $SUFFIX
#
# Supports an optional indication to use markdown instead of elements in the
# mixed content, passed as
#
# Usage:
#   PubNoteInText2XML.sh file.xml
#
# Output files are placed in a subdirectory named after the input file.
# Temporary/intermediate files are cleaned unless "debug.txt" is found
# in the input directory.
#
# ---------------------------------------------------------------------------

# Get the absolute path to the script's parent's directory (inside the repo)
REPO="$(cd "$(dirname "$0")" && cd .. && pwd)"

# Optional suffix like -en, -fr, -de, -us

# Check for optional -suffix argument
if [[ "$1" == -* ]]; then
  SUFFIX="$1"
  shift
fi

# Require input file
if [[ -z "$1" || ! -f "$1" ]]; then
  if [[ ! -f "$1" ]]; then
    echo File "$1" not found.
    echo
  fi
  echo "Usage: PubNoteInText2XML${SUFFIX}.sh file.xml"
  exit 1
fi

FILEDIR="$(cd "$(dirname "$1")" && pwd)"
INPUT="$(basename "$1")"
INPUTBASE="${INPUT%.*}"

$REPO ../Crane-txt2xml/shell/Crane-txt2xml.sh $REPO/PubMedIn/ixml/PubMedIn.ixml $REPO/PubMedIn/ixml/PubMedIn-ixml2xml.xsl "$FILEDIR/$INPUTBASE/$INPUT.xml"

exit 1