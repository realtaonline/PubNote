#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteRender-fr.bat
#
# Script utilitaire pour appeler PubNoteRender-en.sh avec le suffixe -fr.
#
# Permet un glisser-déposer ou une automatisation par appel pour produire
# des rendus en français à partir d’un fichier XML PubNote.
#
# Les fichiers de sortie sont écrits dans un sous-répertoire portant le nom
# du fichier d’entrée. Les fichiers temporaires sont supprimés sauf si un
# fichier nommé "debug.txt" est présent dans le même répertoire que l’entrée.
#
# Utilisation :
#   PubNoteRender-fr.sh fichier.xml
# ---------------------------------------------------------------------------

$(dirname "$0")/PubNoteRender-en.sh -fr $1 
