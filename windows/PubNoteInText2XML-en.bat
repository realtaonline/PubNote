@echo off
:: ---------------------------------------------------------------------------
:: PubNoteInText2XML-en.bat
::
:: A batch file for processing a PubNote in/submission text input file into
:: an equivalent XML file using English labels for the elements and
:: attributes.
::
:: Usage:
::   PubNoteInText2XML-en.bat file.txt
::
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteInText2XML.bat" -en "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
