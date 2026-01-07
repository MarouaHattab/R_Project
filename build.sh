#!/bin/bash

# Script de build pour le projet Quarto
# Destination : Dossier public pour déploiement Vercel

echo "🚀 Démarrage du build..."

# Créer le dossier public s'il n'existe pas
mkdir -p public

# Rendre le fichier Quarto principal (index.qmd)
# Format HTML configuré dans le YAML du fichier
quarto render index.qmd

# Déplacer le fichier HTML généré vers public
if [ -f "index.html" ]; then
    mv index.html public/
    echo "✅ Fichier index.html copié."
else
    echo "❌ Erreur : index.html non généré."
    exit 1
fi

# Copier les dossiers de dépendances (images, scripts, styles)
if [ -d "index_files" ]; then
    cp -r index_files public/
    echo "✅ Dépendances index_files copiées."
fi

# Copier le CSS personnalisé si présent
if [ -f "custom.css" ]; then
    cp custom.css public/
    echo "✅ custom.css copié."
fi

echo "🎉 Build terminé avec succès !"
