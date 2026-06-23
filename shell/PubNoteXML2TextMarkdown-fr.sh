#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteXML2TextMarkdown-fr.sh
#
# Converts a PubNote XML file into an editable text file with markdown
# mixed content, using French labels.
#
# Usage:
#   PubNoteXML2TextMarkdown-fr.sh file.xml
# 
# ---------------------------------------------------------------------------

MARKDOWN=markdown=yes $(dirname "$0")/PubNoteXML2Text-fr.sh $1 
