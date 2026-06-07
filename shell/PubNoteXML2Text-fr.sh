#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteXML2Text-fr.sh
#
# A shell script for processing a PubNote XML file into an editable text file
# using French labels for the elements and attributes.
#
# Usage:
#   PubNoteXML2Text-fr.sh [-suffix] file.xml
# 
# ---------------------------------------------------------------------------

SUFFIX=-fr $(dirname "$0")/PubNoteXML2Text.sh $1 
