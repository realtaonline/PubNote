#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteXML2Text-markdown.sh
#
# A shell script for processing a PubNote in/submission text input file into
# an equivalent XML file using markdown in the mixed content
#
# Usage:
#   PubNoteXML2Text-markdown.sh file.xml
# 
# ---------------------------------------------------------------------------

MARKDOWN=markdown=yes $(dirname "$0")/PubNoteXML2Text.sh "$1" 
