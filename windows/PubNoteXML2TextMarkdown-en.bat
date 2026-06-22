@echo off
setlocal

:: ---------------------------------------------------------------------------
:: PubNoteXML2TextMarkdown-en.bat
::
:: Converts a PubNote XML file into an editable text file with markdown
:: mixed content, using English labels.
::
:: Usage:
::   PubNoteXML2TextMarkdown-en.bat file.xml
::
:: ---------------------------------------------------------------------------

set "MARKDOWN=markdown=yes"
call "%~dp0\PubNoteXML2Text-en.bat" "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
exit /b %errorlevel%
