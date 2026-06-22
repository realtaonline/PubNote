@echo off
:: ---------------------------------------------------------------------------
:: PubNoteInText2XML-fr.bat
::
:: Script utilitaire pour appeler PubNoteInText2XML.bat avec le suffixe -fr.
::
:: Permet un glisser-déposer ou une automatisation par appel pour produire
:: du XML PubNote à partir d'un fichier texte étiqueté en français.
::
:: Utilisation :
::   PubNoteInText2XML-fr.bat fichier.txt
::
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteInText2XML.bat" -fr "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
