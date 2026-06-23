#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteRender-de.bat
#
# Erzeugt aus einer PubNote-XML-Datei PDF-, HTML-, DOCX- und Textausgaben
# mit deutschsprachigen Bezeichnungen.
#
# Die Ausgabedateien werden in ein Unterverzeichnis geschrieben, das nach
# der Eingabedatei benannt ist. Temporäre Dateien werden gelöscht, sofern
# sich im selben Verzeichnis keine Datei namens "debug.txt" befindet.
#
# Verwendung:
#   PubNoteRender-de.sh datei.xml
# ---------------------------------------------------------------------------

$(dirname "$0")/PubNoteRender-en.sh -de $1 
