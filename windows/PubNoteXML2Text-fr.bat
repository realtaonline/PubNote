@echo off
:: ---------------------------------------------------------------------------
:: PubNoteXML2Text-fr.bat
::
:: Script utilitaire pour appeler PubNoteXML2Text.bat avec le suffixe -fr.
::
:: Produit un fichier texte modifiable, étiqueté en français, à partir d'un
:: fichier XML PubNote.
::
:: Utilisation :
::   PubNoteXML2Text-fr.bat fichier.xml
::
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteXML2Text.bat" -fr "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
