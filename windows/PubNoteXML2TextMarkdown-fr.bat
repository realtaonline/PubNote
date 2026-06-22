@echo off
setlocal

:: ---------------------------------------------------------------------------
:: PubNoteXML2TextMarkdown-fr.bat
::
:: Convertit un fichier XML PubNote en fichier texte modifiable utilisant
:: markdown dans le contenu mixte, avec des étiquettes en français.
::
:: Utilisation :
::   PubNoteXML2TextMarkdown-fr.bat fichier.xml
::
:: ---------------------------------------------------------------------------

set "MARKDOWN=markdown=yes"
call "%~dp0\PubNoteXML2Text-fr.bat" "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
exit /b %errorlevel%
