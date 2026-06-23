@echo off
setlocal

:: ---------------------------------------------------------------------------
:: PubNoteXML2TextMarkdown.bat
::
:: Converts a PubNote XML file into an editable text file with markdown
:: mixed content, using raw XML element and attribute names as labels.
::
:: Usage:
::   PubNoteXML2TextMarkdown.bat [-suffix] file.xml
::
:: ---------------------------------------------------------------------------

set "MARKDOWN=markdown=yes"
call "%~dp0\PubNoteXML2Text.bat" "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
exit /b %errorlevel%
