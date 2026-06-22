#!/bin/bash

# ---------------------------------------------------------------------------
# PubNoteInText2XML-fr.sh
#
# Convertit un fichier texte de soumission PubNote en XML, en utilisant
# la grammaire iXML étiquetée en français.
#
# Les fichiers de sortie sont écrits dans un sous-répertoire portant le nom
# du fichier d’entrée. Les fichiers temporaires sont supprimés sauf si un
# fichier nommé "debug.txt" est présent dans le même répertoire que l’entrée.
#
# Utilisation :
#   PubNoteInText2XML-fr.sh fichier.xml
# ---------------------------------------------------------------------------

SUFFIX=-fr $(dirname "$0")/PubNoteInText2XML.sh $1 
