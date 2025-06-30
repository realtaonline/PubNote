#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteRender-us.bat
#
# Convenience wrapper for invoking PubNoteRender-en.sh with the -us suffix.
#
# This supports drag-and-drop usage or call-based automation for English
# rendering (using US-letter page geometry) of PubNote XML input files.
#
# Output files are written to a subdirectory named after the input file.
# Temporary files are deleted unless a file named "debug.txt" is found
# in the same directory as the input file.
#
# Usage:
#   PubNoteRender-de.sh file.xml
# ---------------------------------------------------------------------------

$(dirname "$0")/PubNoteRender-en.sh -us $1 
