@echo off
:: ---------------------------------------------------------------------------
:: PubNoteXML2Text-fr.bat
::
:: Convertit un fichier XML PubNote en fichier texte modifiable, en
:: utilisant des étiquettes en français pour les éléments et attributs.
::
:: Utilisation :
::   PubNoteXML2Text-fr.bat fichier.xml
::
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteXML2Text.bat" -fr "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
