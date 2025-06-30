@echo off
:: ---------------------------------------------------------------------------
:: PubNoteRender-de.bat
::
:: Hilfsskript zum Aufruf von PubNoteRender-en.bat mit dem Suffix -de.
::
:: Unterstützt Drag-and-Drop oder automatisierte Aufrufe zur Erzeugung
:: deutschsprachiger Ausgaben aus einer PubNote-XML-Datei.
::
:: Die Ausgabedateien werden in ein Unterverzeichnis geschrieben, das nach
:: der Eingabedatei benannt ist. Temporäre Dateien werden gelöscht, sofern
:: sich im selben Verzeichnis keine Datei namens "debug.txt" befindet.
::
:: Wenn "batch=yes" als letztes Argument übergeben wird, pausiert das Skript
:: am Ende nicht.
::
:: Verwendung:
::   PubNoteRender-de.bat datei.xml [batch=yes]
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteRender-en.bat" -de "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
