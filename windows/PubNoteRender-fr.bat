@echo off
:: ---------------------------------------------------------------------------
:: PubNoteRender-fr.bat
::
:: Script utilitaire pour appeler PubNoteRender-en.bat avec le suffixe -fr.
::
:: Permet un glisser-déposer ou une automatisation par appel pour produire
:: des rendus en français à partir d’un fichier XML PubNote.
::
:: Les fichiers de sortie sont écrits dans un sous-répertoire portant le nom
:: du fichier d’entrée. Les fichiers temporaires sont supprimés sauf si un
:: fichier nommé "debug.txt" est présent dans le même répertoire que l’entrée.
::
:: Si "batch=yes" est fourni comme dernier argument, le script ne mettra pas
:: en pause à la fin.
::
:: Utilisation :
::   PubNoteRender-fr.bat fichier.xml [batch=yes]
:: ---------------------------------------------------------------------------

call "%~dp0\PubNoteRender-en.bat" -fr "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"