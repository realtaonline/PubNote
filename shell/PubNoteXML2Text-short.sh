#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteXML2Text-short.sh
#
# Converts a PubNote XML file into an editable text file, using the very
# short hint labels for the elements and attributes.
#
# Usage:
#   PubNoteXML2Text-short.sh file.xml
# 
# ---------------------------------------------------------------------------

SUFFIX=-short $(dirname "$0")/PubNoteXML2Text.sh "$1"
