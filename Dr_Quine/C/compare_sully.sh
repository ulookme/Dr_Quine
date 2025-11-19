#!/bin/bash

# Fichier de référence
ref="Sully_0.c"

# Vérifier qu'il existe
if [ ! -f "$ref" ]; then
    echo "Fichier de référence $ref introuvable."
    exit 1
fi

# Boucle sur tous les fichiers Sully_*.c
for f in Sully_*.c; do
    # Ne pas re-comparer le fichier de référence avec lui-même
    if [ "$f" = "$ref" ]; then
        continue
    fi

    echo "==============================="
    echo "Comparaison : $ref  <-->  $f"
    echo "-------------------------------"

    # Afficher les différences (format unifié)
    if diff -u "$ref" "$f"; then
        echo "✔ Aucun différence dans le code."
    else
        echo "❌ Des différences existent (voir ci-dessus)."
    fi

    echo
done
