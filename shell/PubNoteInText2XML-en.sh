#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteInText2XML-en.sh
#
# A shell script for processing a PubNote in/submission text input file into
# an equivalent XML file.
#
# Usage:
#   PubNoteInText2XML-en.sh file.xml
#
# Output files are placed in a subdirectory named after the input file.
# Temporary/intermediate files are cleaned unless "debug.txt" is found
# in the input directory.
#
# ---------------------------------------------------------------------------

SUFFIX=-en $(dirname "$0")/PubNoteInText2XML.sh $1 
