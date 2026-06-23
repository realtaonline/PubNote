#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteXML2Text-fr.sh
#
# Converts a PubNote XML file into an editable text file, using French
# labels for the elements and attributes.
#
# Usage:
#   PubNoteXML2Text-fr.sh file.xml
# 
# ---------------------------------------------------------------------------

SUFFIX=-fr $(dirname "$0")/PubNoteXML2Text.sh $1 
