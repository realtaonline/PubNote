#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteRender-de.bat
#
# Hilfsskript zum Aufruf von PubNoteRender-en.sh mit dem Suffix -de.
#
# Unterstützt Drag-and-Drop oder automatisierte Aufrufe zur Erzeugung
# deutschsprachiger Ausgaben aus einer PubNote-XML-Datei.
#
# Die Ausgabedateien werden in ein Unterverzeichnis geschrieben, das nach
# der Eingabedatei benannt ist. Temporäre Dateien werden gelöscht, sofern
# sich im selben Verzeichnis keine Datei namens "debug.txt" befindet.
#
# Verwendung:
#   PubNoteRender-de.sh datei.xml
# ---------------------------------------------------------------------------

$(dirname "$0")/PubNoteRender-en.sh -de $1 
