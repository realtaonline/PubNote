#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteRender.sh

# Renders a PubNote XML file to PDF, HTML, DOCX, and text using raw XML
# element and attribute names as labels (calls PubNoteRender-en.sh with an
# empty suffix).

# The output files are written to a subdirectory named after
# the input file. Temporary files are deleted if
# there is no file named "debug.txt" in the same directory.

# Usage:

# PubNoteRender.sh file.xml
# ---------------------------------------------------------------------------

SUFFIX="" $(dirname "$0")/PubNoteRender-en.sh $1 
