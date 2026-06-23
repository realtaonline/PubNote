@echo off
setlocal

:: ---------------------------------------------------------------------------
:: PubNoteXML2Text-en.bat
::
:: Converts a PubNote XML file into an editable text file, using English
:: labels for the elements and attributes.
::
:: Usage:
::   PubNoteXML2Text-en.bat file.xml
::
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteXML2Text.bat" -en "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
