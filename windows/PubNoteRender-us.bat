@echo off

:: ---------------------------------------------------------------------------
:: PubNoteRender-us.bat
::
:: Convenience wrapper for invoking PubNoteRender-en.bat with the -us suffix.
::
:: This supports drag-and-drop usage or call-based automation for English
:: rendering (using US-letter page geometry) of PubNote XML input files.
::
:: Output files are written to a subdirectory named after the input file.
:: Temporary files are deleted unless a file named "debug.txt" is found
:: in the same directory as the input file.
::
:: If "batch=yes" is the final argument, the script will not pause at the end.
::
:: Usage:
::   PubNoteRender-de.bat file.xml [batch=yes]
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteRender-en.bat" -us "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"