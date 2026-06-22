#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteText2XMLmarkdown-de.sh
#
# Converts a PubNote XML file into an editable text file with markdown
# mixed content, using German labels.
#
# Usage:
#   PubNoteXML2TextMarkdown-de.sh file.xml
# 
# ---------------------------------------------------------------------------

MARKDOWN=markdown=yes $(dirname "$0")/PubNoteXML2Text-de.sh $1 
