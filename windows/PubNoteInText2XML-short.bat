@echo off
setlocal

:: ---------------------------------------------------------------------------
:: PubNoteInText2XML-short.bat
::
:: Converts a PubNote submission text input file into XML, using the
:: short-label iXML grammar.
::
:: Usage:
::   PubNoteInText2XML-short.bat file.txt
::
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteInText2XML.bat" -short "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
