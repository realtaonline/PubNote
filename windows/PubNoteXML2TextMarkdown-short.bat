@echo off
setlocal

:: ---------------------------------------------------------------------------
:: PubNoteXML2TextMarkdown-short.bat
::
:: Converts a PubNote XML file into an editable text file with markdown
:: mixed content, using the very short hint labels.
::
:: Usage:
::   PubNoteXML2TextMarkdown-short.bat file.xml
::
:: ---------------------------------------------------------------------------

set "MARKDOWN=markdown=yes"
call "%~dp0\PubNoteXML2Text-short.bat" "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
exit /b %errorlevel%
