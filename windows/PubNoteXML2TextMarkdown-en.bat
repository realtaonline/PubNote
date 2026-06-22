@echo off
:: ---------------------------------------------------------------------------
:: PubNoteXML2TextMarkdown-en.bat
::
:: A batch file for processing a PubNote XML file into an editable text file
:: using markdown in the mixed content, with English labels for the elements
:: and attributes.
::
:: Usage:
::   PubNoteXML2TextMarkdown-en.bat file.xml
::
:: ---------------------------------------------------------------------------

set "MARKDOWN=markdown=yes"
call "%~dp0\PubNoteXML2Text-en.bat" %1
exit /b %errorlevel%
