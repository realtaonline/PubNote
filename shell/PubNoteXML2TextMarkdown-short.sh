#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteXML2TextMarkdown-short.sh
#
# A shell script for processing a PubNote in/submission text input file into
# an equivalent XML file using markdown in the mixed content, using the very
# short hint labels for the elements and attributes.
#
# Usage:
#   PubNoteXML2TextMarkdown-short.sh file.xml
# 
# ---------------------------------------------------------------------------

MARKDOWN=markdown=yes $(dirname "$0")/PubNoteXML2Text-short.sh $1 
