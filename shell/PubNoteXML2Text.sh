#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteText2XML.sh
#
# A shell script for processing a PubNote in/submission text input file into
# an equivalent XML file.
#
# Supports an optional language suffix (e.g., -en, -fr, -de), passed as the
# environment variable $SUFFIX for translating the element and attribute names
# into labels, otherwise, the raw XML names are used as labels.
#
# Supports an optional indication to use markdown instead of elements in the
# mixed content, passed as $MARKDOWN
#
# Usage:
#   PubNoteXML2Text.sh file.xml
#
# Output files are placed in a subdirectory named after the input file.
# Temporary/intermediate files are cleaned unless "debug.txt" is found
# in the input directory.
#
# ---------------------------------------------------------------------------

# Get the absolute path to the script's parent's directory (inside the repo)
REPO="$(cd "$(dirname "$0")" && cd .. && pwd)"

# Get the absolute path to the script's parent's directory (inside the repo)
if ! REPO="$(cd "$(dirname "$0")" && cd .. && pwd)"; then
  echo "Cannot determine REPO path" >&2
  exit 1
fi

# Check for optional -suffix argument like -en, -fr, -de, -us
if [[ "$1" == -* ]]; then
  SUFFIX="$1"
  shift
fi

if [[ ! "$MARKDOWN" == "" ]]; then
  MARKDOWNSUFFIX="-markdown"
fi

if [ "" == "$1" ]; then
  echo Usage: "$0" inputXMLname >&2
  echo See script header for full details >&2
  exit 1
fi

FILEDIR="$(cd "$(dirname "$1")" && pwd)"
INPUT="$(basename "$1")"
INPUTBASE="${INPUT%.*}"
OUTPUT="$FILEDIR/${INPUTBASE}/${INPUT}${MARKDOWNSUFFIX}${SUFFIX}.txt"

#echo Processing: "$1" into "$OUTPUT" ...

if [ ! -f "$1" ]; then echo Input XML "$1" not found ; exit 1 ; fi

# Remove any old result file
if [ -f "$OUTPUT" ]; then rm "$OUTPUT" ; fi

java -Xss64m -Xms200m -Xmx1000m -cp "$REPO/utilities/saxonhe/saxonhe.jar" net.sf.saxon.Transform -s:"$1" -xsl:"$REPO/xsl/PubNote-xml2txt${SUFFIX}.xsl" -o:"$OUTPUT" labels=no $MARKDOWN
ret=$?
if [ "$ret" -ne "0" ]; then exit $ret ; fi
