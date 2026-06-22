#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteRender-short.sh

# Helper script to call PubNoteRender-en.sh with the -short suffix.

# Supports drag-and-drop or automated calls to generate abbreviated
# XML-named element and attribute output from a PubNote XML file.

# The output files are written to a subdirectory named after
# the input file. Temporary files are deleted if
# there is no file named "debug.txt" in the same directory.

# Usage:

# PubNoteRender-short.sh file.xml
# ---------------------------------------------------------------------------

SUFFIX="-short" $(dirname "$0")/PubNoteRender-en.sh $1 
