@echo off
:: ---------------------------------------------------------------------------
:: PubNoteRender.bat
::
:: Helper script to call PubNoteRender-en.bat with the empty suffix.
::
:: Supports drag-and-drop or automated calls to generate
:: XML-named element and attribute output from a PubNote XML file.
::
:: The output files are written to a subdirectory named after
:: the input file. Temporary files are deleted if
:: there is no file named "debug.txt" in the same directory.
::
:: Usage:
::
::   PubNoteRender.bat file.xml
:: ---------------------------------------------------------------------------

set "SUFFIX="
set "SUFFIXSET=1"
call "%~dp0\PubNoteRender-en.bat" "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
