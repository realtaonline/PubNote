#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteRender-short.sh

# Renders a PubNote XML file to PDF, HTML, DOCX, and text using the
# short-label set (calls PubNoteRender-en.sh with the -short suffix).

# The output files are written to a subdirectory named after
# the input file. Temporary files are deleted if
# there is no file named "debug.txt" in the same directory.

# Usage:

# PubNoteRender-short.sh file.xml
# ---------------------------------------------------------------------------

SUFFIX="-short" $(dirname "$0")/PubNoteRender-en.sh $1 
