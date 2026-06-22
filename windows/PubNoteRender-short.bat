@echo off
:: ---------------------------------------------------------------------------
:: PubNoteRender-short.bat
::
:: Helper script to call PubNoteRender-en.bat with the -short suffix.
::
:: Supports drag-and-drop or automated calls to generate abbreviated
:: XML-named element and attribute output from a PubNote XML file.
::
:: The output files are written to a subdirectory named after
:: the input file. Temporary files are deleted if
:: there is no file named "debug.txt" in the same directory.
::
:: Usage:
::   PubNoteRender-short.bat file.xml [batch=yes]
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteRender-en.bat" -short "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"