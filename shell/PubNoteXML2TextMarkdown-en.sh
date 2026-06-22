#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteXML2TextMarkdown-en.sh
#
# A shell script for processing a PubNote in/submission text input file into
# an equivalent XML file using markdown in the mixed content
#
# Usage:
#   PubNoteXML2TextMarkdown-en.sh file.xml
# 
# ---------------------------------------------------------------------------

MARKDOWN=markdown=yes $(dirname "$0")/PubNoteXML2Text-en.sh $1 
