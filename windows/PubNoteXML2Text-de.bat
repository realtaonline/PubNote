@echo off
:: ---------------------------------------------------------------------------
:: PubNoteXML2Text-de.bat
::
:: A batch file for processing a PubNote XML file into an editable text file
:: using German labels for the elements and attributes.
::
:: Usage:
::   PubNoteXML2Text-de.bat file.xml
::
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteXML2Text.bat" -de "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
