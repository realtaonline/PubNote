@echo off
:: ---------------------------------------------------------------------------
:: PubNoteInText2XML-short.bat
::
:: A batch file for processing a PubNote in/submission text input file,
:: labelled using the very short hint labels, into an equivalent XML file.
::
:: Usage:
::   PubNoteInText2XML-short.bat file.txt
::
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteInText2XML.bat" -short "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
