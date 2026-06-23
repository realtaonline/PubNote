@echo off
setlocal

:: ---------------------------------------------------------------------------
:: PubNoteRender-short.bat
::
:: Renders a PubNote XML file to PDF, HTML, DOCX, and text using the
:: short-label set (calls PubNoteRender-en.bat with the -short suffix).
::
:: The output files are written to a subdirectory named after
:: the input file. Temporary files are deleted if
:: there is no file named "debug.txt" in the same directory.
::
:: Usage:
::   PubNoteRender-short.bat file.xml [batch=yes]
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteRender-en.bat" -short "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"