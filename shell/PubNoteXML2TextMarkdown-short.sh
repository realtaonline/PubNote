#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteXML2TextMarkdown-short.sh
#
# Converts a PubNote XML file into an editable text file with markdown
# mixed content, using the very short hint labels.
#
# Usage:
#   PubNoteXML2TextMarkdown-short.sh file.xml
# 
# ---------------------------------------------------------------------------

MARKDOWN=markdown=yes $(dirname "$0")/PubNoteXML2Text-short.sh $1 
