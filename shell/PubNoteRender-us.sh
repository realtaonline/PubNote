#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteRender-us.bat
#
# Renders a PubNote XML file to PDF, HTML, DOCX, and text using English
# labels with US-letter page geometry (calls PubNoteRender-en.sh with the
# -us suffix).
#
# Output files are written to a subdirectory named after the input file.
# Temporary files are deleted unless a file named "debug.txt" is found
# in the same directory as the input file.
#
# Usage:
#   PubNoteRender-de.sh file.xml
# ---------------------------------------------------------------------------

$(dirname "$0")/PubNoteRender-en.sh -us $1 
