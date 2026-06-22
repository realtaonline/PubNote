@echo off
:: ---------------------------------------------------------------------------
:: PubNoteInText2XML-de.bat
::
:: A batch file for processing a PubNote in/submission text input file into
:: an equivalent XML file using German labels for the elements and
:: attributes.
::
:: Usage:
::   PubNoteInText2XML-de.bat file.txt
::
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteInText2XML.bat" -de "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
