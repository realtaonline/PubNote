@echo off
:: ---------------------------------------------------------------------------
:: PubNoteRender-de.bat
::
:: Erzeugt aus einer PubNote-XML-Datei PDF-, HTML-, DOCX- und Textausgaben
:: mit deutschsprachigen Bezeichnungen.
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
