@echo off
:: ---------------------------------------------------------------------------
:: PubNoteInText2XML-en.bat
::
:: Converts a PubNote submission text input file into XML, using
:: English-labelled iXML grammar.
::
:: Usage:
::   PubNoteInText2XML-en.bat file.txt
::
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteInText2XML.bat" -en "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
