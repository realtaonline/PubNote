@echo off
:: ---------------------------------------------------------------------------
:: PubNoteXML2TextMarkdown-short.bat
::
:: A batch file for processing a PubNote XML file into an editable text file
:: using markdown in the mixed content, with the very short hint labels for
:: the elements and attributes.
::
:: Usage:
::   PubNoteXML2TextMarkdown-short.bat file.xml
::
:: ---------------------------------------------------------------------------

set "MARKDOWN=markdown=yes"
call "%~dp0\PubNoteXML2Text-short.bat" %1
exit /b %errorlevel%
