#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteXML2TextMarkdown-en.sh
#
# Converts a PubNote XML file into an editable text file with markdown
# mixed content, using English labels.
#
# Usage:
#   PubNoteXML2TextMarkdown-en.sh file.xml
# 
# ---------------------------------------------------------------------------

MARKDOWN=markdown=yes $(dirname "$0")/PubNoteXML2Text-en.sh $1 
