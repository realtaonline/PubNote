#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteRender-en.bat
#
# A shell script for processing a PubNote XML input file into
# PDF, HTML, and DOCX outputs using Saxon, FOP, and Wordinator.
#
# Supports an optional language suffix (e.g., -fr, -de) passed as the
# first argument, and handles transformation, rendering, and cleanup.
#
# Usage:
#   PubNoteRender-en.sh [-suffix] file.xml
#
# Output files are placed in a subdirectory named after the input file.
# Temporary/intermediate files are cleaned unless "debug.txt" is found
# in the input directory.
#
# ---------------------------------------------------------------------------

# Get the absolute path to the script's parent's directory (inside the repo)
REPO="$(cd "$(dirname "$0")" && cd .. && pwd)"

# Optional suffix like -fr, -de, -us
SUFFIX="-en"

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
  echo "Usage: PubNoteRender${SUFFIX}.sh file.xml"
  exit 1
fi

FILEDIR="$(cd "$(dirname "$1")" && pwd)"
INPUT="$(basename "$1")"
INPUTBASE="${INPUT%.*}"

# Paths
SAXON_JAR="$REPO/utilities/saxon12he/saxon12he.jar"
WORDINATOR_JAR="$REPO/utilities/wordinator/wordinator-1.1.1-fat.jar"
XSLDIR="$REPO/xsl"
XSLRENDER="$XSLDIR/PubNoteRender${SUFFIX}.xsl"
FOP="$REPO/utilities/fop/fop.sh"
DEBUG="$FILEDIR/debug.txt"
FO="$FILEDIR/${INPUTBASE}/${INPUT}${SUFFIX}.fo"
FOPFO="$FILEDIR/${INPUTBASE}/${INPUT}${SUFFIX}.fop.fo"
PDF="$FILEDIR/${INPUTBASE}/${INPUT}${SUFFIX}.pdf"
HTML="$FILEDIR/${INPUTBASE}/${INPUT}${SUFFIX}.html"
DOCX_NAME="${INPUT}${SUFFIX}.docx"
SWPX_NAME="${INPUT}${SUFFIX}.swpx"
DOCX="$FILEDIR/${INPUTBASE}/${DOCX_NAME}"
SWPXDIR="$FILEDIR/${INPUTBASE}/${INPUT}${SUFFIX}/"
DOCX_TEMP="$SWPXDIR/${DOCX_NAME}"
SWPX="$SWPXDIR/${SWPX_NAME}"
DOTX="$REPO/dev/PubNoteRender.dotx"
LOG="$FILEDIR/${INPUT}${SUFFIX}.pdf.log.txt"

echo Rendering "$FILEDIR/$INPUT" using "$XSL" to "$PDF" with "$LOG"...
echo Rendering "$FILEDIR/$INPUT" using "$XSL" to "$PDF" with "$LOG"... 1> "$LOG"

if [[ ! -d "$FILEDIR/$INPUTBASE" ]] ; then mkdir "$FILEDIR/$INPUTBASE" ; fi

# Delete outputs and temporary files
if [[ -f "$FOPFO" ]]; then rm "$FOPFO" ;  fi
if [[ -f "$FO" ]];    then rm "$FO" ;  fi
if [[ -f "$PDF" ]];   then rm "$PDF" ; fi
if [[ -f "$LOG" ]];   then rm "$LOG" ; fi

echo Transform XML to FO...
echo Transform XML to FO... 1>> "$LOG"
java -jar "$SAXON_JAR" -s:"$FILEDIR/$INPUT" -xsl:"$XSLRENDER" -o:"$FO" 2>> "$LOG"
retval=$?
if [[ "$retval" != "0" ]]; then
  echo Saxon execution error creating XSL-FO
fi

if [[ "$retval" == "0" ]]; then
  echo Transform FO to FOP FO...
  echo Transform FO to FOP FO... 1>> "$LOG"
  java -jar "$SAXON_JAR" -s:"$FO" -xsl:"$XSLDIR/scrubPubNote.xsl" -o:"$FOPFO" 2>> "$LOG"
  retval=$?
  if [[ "$retval" != "0" ]]; then
    echo Saxon execution error scrubbing XSL-FO
  fi
fi

if [[ "$retval" == "0" ]]; then
  echo Render FOP FO to PDF...
  echo Render FOP FO to PDF... 1>> "$LOG"
  (
    cd "$REPO" || exit 1
    sh "$FOP" -fo "$FOPFO" -pdf "$PDF" 2>> "$LOG"
    retval=$?
    if [[ "$retval" != "0" ]]; then echo FOP execution error; exit 1 ; fi
  )
fi

if [[ "$retval" == "0" ]]; then
  echo Transform FO to HTML...
  echo Transform FO to HTML... 1>> "$LOG"
  java -jar "$SAXON_JAR" -s:"$FO" -xsl:"$XSLDIR/pnfo2html.xsl" -o:"$HTML" 2>> "$LOG"
  retval=$?
  if [[ "$retval" != "0" ]]; then
    echo Saxon execution error creating HTML
  fi
fi

if [[ "$retval" == "0" ]]; then
  echo Transform HTML to SWPX...
  echo Transform HTML to SWPX... 1>> "$LOG"
  java -jar "$SAXON_JAR" -s:"$HTML" -xsl:"$XSLDIR/html2swpx.xsl" -o:"$SWPX" 2>> "$LOG"
  retval=$?
  if [[ "$retval" != "0" ]]; then
    echo Saxon execution error creating SWPX
  fi
  echo Transform SWPX to DOCX...
  echo Transform SWPX to DOCX... 1>> "$LOG"
  cp "$DOTX" "$SWPXDIR"
  java -jar "$WORDINATOR_JAR" -i "$SWPXDIR" -o "$SWPXDIR" -t "$DOTX" 2>&1 1>> "$LOG"
  if [[ -f  "$DOCX_TEMP" ]]; then cp "$DOCX_TEMP" "$DOCX" ; fi
fi

if [ -f "$PDF" ] && [ -f "$HTML" ] && [ -f "$DOCX" ] ; then
  echo Successfully created "$PDF", "$HTML", and "$DOCX"
  touch "$PDF" "$HTML" "$DOCX"
  if [[ -f "$DEBUG" ]]; then
    echo Intermediate files preserved due to debug.txt
  else
    if [[ -f "$FOPFO" ]]; then rm "$FOPFO" ; fi
    if [[ -f "$FO"    ]]; then rm "$FO"    ; fi
    if [[ -f "$LOG"   ]]; then rm "$LOG"   ; fi
    if [[ -d "$SWPXDIR" ]]; then rm -r "$SWPXDIR" ; fi
  fi
  exit 0
fi

echo PDF not created, please check $LOG
exit 1