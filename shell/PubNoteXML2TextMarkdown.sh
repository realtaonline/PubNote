#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteXML2Text-markdown.sh
#
# Converts a PubNote XML file into an editable text file with markdown
# mixed content, using raw XML element and attribute names as labels.
#
# Usage:
#   PubNoteXML2Text-markdown.sh file.xml
# 
# ---------------------------------------------------------------------------

MARKDOWN=markdown=yes $(dirname "$0")/PubNoteXML2Text.sh "$1" 
