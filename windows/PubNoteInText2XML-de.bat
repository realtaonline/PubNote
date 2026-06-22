@echo off
:: ---------------------------------------------------------------------------
:: PubNoteInText2XML-de.bat
::
:: Converts a PubNote submission text input file into XML, using
:: German-labelled iXML grammar.
::
:: Usage:
::   PubNoteInText2XML-de.bat file.txt
::
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteInText2XML.bat" -de "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
