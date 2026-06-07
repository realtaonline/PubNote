#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteXML2Text-de.sh
#
# A shell script for processing a PubNote XML file into an editable text file
# using German labels for the elements and attributes.
#
# Usage:
#   PubNoteXML2Text-de.sh [-suffix] file.xml
# 
# ---------------------------------------------------------------------------

SUFFIX=-de $(dirname "$0")/PubNoteXML2Text.sh $1 
