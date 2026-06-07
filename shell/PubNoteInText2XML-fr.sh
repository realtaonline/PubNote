#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteInText2XML-fr.sh
#
# Script utilitaire pour appeler PubNoteInText2XM.sh avec le suffixe -fr.
#
# Permet un glisser-déposer ou une automatisation par appel pour produire
# des rendus en français à partir d’un fichier XML PubNote.
#
# Les fichiers de sortie sont écrits dans un sous-répertoire portant le nom
# du fichier d’entrée. Les fichiers temporaires sont supprimés sauf si un
# fichier nommé "debug.txt" est présent dans le même répertoire que l’entrée.
#
# Utilisation :
#   PubNoteInText2XML-fr.sh fichier.xml
# ---------------------------------------------------------------------------

SUFFIX=-fr $(dirname "$0")/PubNoteInText2XML.sh $1 
