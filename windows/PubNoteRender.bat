@echo off
:: ---------------------------------------------------------------------------
:: PubNoteRender.bat
::
:: Renders a PubNote XML file to PDF, HTML, DOCX, and text using raw XML
:: element and attribute names as labels (calls PubNoteRender-en.bat with
:: an empty suffix).
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
