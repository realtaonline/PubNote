#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteRender-fr.bat
#
# Produit à partir d’un fichier XML PubNote des sorties PDF, HTML, DOCX et
# texte en utilisant des étiquettes en français.
#
# Les fichiers de sortie sont écrits dans un sous-répertoire portant le nom
# du fichier d’entrée. Les fichiers temporaires sont supprimés sauf si un
# fichier nommé "debug.txt" est présent dans le même répertoire que l’entrée.
#
# Utilisation :
#   PubNoteRender-fr.sh fichier.xml
# ---------------------------------------------------------------------------

$(dirname "$0")/PubNoteRender-en.sh -fr $1 
