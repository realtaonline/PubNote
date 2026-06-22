@echo off
setlocal

:: ---------------------------------------------------------------------------
:: PubNoteXML2Text-short.bat
::
:: Converts a PubNote XML file into an editable text file, using the very
:: short hint labels for the elements and attributes.
::
:: Usage:
::   PubNoteXML2Text-short.bat file.xml
::
:: ---------------------------------------------------------------------------

set PNNOINDENT="indent=no"
call "%~dp0\PubNoteXML2Text.bat" -short "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
