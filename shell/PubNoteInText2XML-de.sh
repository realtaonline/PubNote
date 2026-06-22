#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteInText2XML-de.sh
#
# Converts a PubNote submission text input file into XML, using
# German-labelled iXML grammar.
#
# Usage:
#   PubNoteInText2XML-de.sh file.xml
#
# Output files are placed in a subdirectory named after the input file.
# Temporary/intermediate files are cleaned unless "debug.txt" is found
# in the input directory.
#
# ---------------------------------------------------------------------------

SUFFIX=-de $(dirname "$0")/PubNoteInText2XML.sh $1 
