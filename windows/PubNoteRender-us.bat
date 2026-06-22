@echo off

:: ---------------------------------------------------------------------------
:: PubNoteRender-us.bat
::
:: Renders a PubNote XML file to PDF, HTML, DOCX, and text using English
:: labels with US-letter page geometry (calls PubNoteRender-en.bat with
:: the -us suffix).
::
:: Output files are written to a subdirectory named after the input file.
:: Temporary files are deleted unless a file named "debug.txt" is found
:: in the same directory as the input file.
::
:: If "batch=yes" is the final argument, the script will not wait at the end.
::
:: Usage:
::   PubNoteRender-de.bat file.xml [batch=yes]
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteRender-en.bat" -us "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"