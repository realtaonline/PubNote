#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteXML2Text-en.sh
#
# A shell script for processing a PubNote XML file into an editable text file
# using English labels for the elements and attributes.
#
# Usage:
#   PubNoteXML2Text-en.sh [-suffix] file.xml
# 
# ---------------------------------------------------------------------------

SUFFIX=-en $(dirname "$0")/PubNoteXML2Text.sh "$1"
