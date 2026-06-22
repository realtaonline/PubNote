@echo off
:: ---------------------------------------------------------------------------
:: PubNoteInText2XML-fr.bat
::
:: Convertit un fichier texte de soumission PubNote en XML, en utilisant
:: la grammaire iXML étiquetée en français.
::
:: Utilisation :
::   PubNoteInText2XML-fr.bat fichier.txt
::
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteInText2XML.bat" -fr "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
