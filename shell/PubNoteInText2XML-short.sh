#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteInText2XML-short.sh
#
# A shell script for processing a PubNote in/submission text input file,
# labelled using the very short hint labels, into an equivalent XML file.
#
# Usage:
#   PubNoteInText2XML-short.sh file.xml
#
# Output files are placed in a subdirectory named after the input file.
# Temporary/intermediate files are cleaned unless "debug.txt" is found
# in the input directory.
#
# ---------------------------------------------------------------------------

SUFFIX=-short $(dirname "$0")/PubNoteInText2XML.sh $1