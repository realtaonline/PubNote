#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteText2XMLmarkdown-de.sh
#
# A shell script for processing a PubNote in/submission text input file into
# an equivalent XML file using markdown in the mixed content
#
# Usage:
#   PubNoteXML2TextMarkdown-de.sh [-suffix] file.xml
# 
# ---------------------------------------------------------------------------

MARKDOWN=markdown=yes $(dirname "$0")/PubNoteXML2Text-de.sh $1 
