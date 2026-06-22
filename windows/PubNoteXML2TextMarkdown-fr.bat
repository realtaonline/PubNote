@echo off
setlocal

:: ---------------------------------------------------------------------------
:: PubNoteXML2TextMarkdown-fr.bat
::
:: Script utilitaire pour produire, à partir d'un fichier XML PubNote, un
:: fichier texte modifiable utilisant markdown dans le contenu mixte, avec
:: des étiquettes en français pour les éléments et attributs.
::
:: Utilisation :
::   PubNoteXML2TextMarkdown-fr.bat fichier.xml
::
:: ---------------------------------------------------------------------------

set "MARKDOWN=markdown=yes"
call "%~dp0\PubNoteXML2Text-fr.bat" "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
exit /b %errorlevel%
