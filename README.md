## Analyse stratégique Bac Lettres Tunisie 2025

Ce projet livre une analyse complète de l’offre universitaire pour les bacheliers Lettres 2025 en Tunisie. Il unifie le nettoyage des données officielles d’orientation et une EDA narrative, puis génère un rapport Quarto prêt à être présenté. L’objectif est de fournir aux étudiants et décideurs une vue claire sur l’accessibilité, la sélectivité et la répartition des filières.

### Objectifs

- Décrire l’offre de filières (scores 2024/2025, contraintes, spécialisations).
- Évaluer l’accessibilité géographique et par université.
- Identifier les domaines les plus sélectifs ou accessibles.
- Produire un support lisible (HTML) et des données nettoyées réutilisables.

### Contexte et périmètre

- Périmètre : filières universitaires pour bacheliers Lettres, sessions 2024 et 2025.
- Sources : données officielles d’orientation (scores, conditions, établissements, gouvernorats).
- Public : étudiants, conseillers d’orientation, responsables académiques.

### Structure du projet

```
./
├── index.qmd                 # Document Quarto principal (nettoyage + EDA)
├── Data/
│   ├── data.xlsx             # Données brutes officielles
│   ├── data_cleaned.csv      # Données nettoyées (export)
│   └── data_cleaned.rds      # Données nettoyées (RDS)
├── build.sh                  # Script de build (optionnel)
└── README.md                 # Présent document
```

### Données utilisées

- Source : Données officielles d’orientation universitaire (Tunisie).
- Période : Sessions 2024 et 2025.
- Variables : Filière, Université, Établissement, Gouvernorat, Critères, Durée, Scores 2024/2025, Conditions, Spécialités.

### Pipeline de nettoyage (Phase I)

- Standardisation des noms de colonnes (suppression sauts de ligne/tabulations, accents conservés).
- Harmonisation des filières (mapping des variantes, normalisation minuscule/espaces).
- Nettoyage Université / Établissement / Gouvernorat (trim, casse, corrections ciblées).
- Normalisation des critères, durées d’études et conditions d’admission.
- Traitement avancé de la colonne Spécialités (séparation, trim, title case).
- Gestion des scores : remplacement des NA par 0 pour nouvelles filières, contrôle min/max.
- Exports : `Data/data_cleaned.csv` (UTF-8) et `Data/data_cleaned.rds`.

### Analyses réalisées

- Nettoyage complet : noms de colonnes, harmonisation des filières, conditions, spécialités, scores.
- Accessibilité des scores : comparaisons 2024 vs 2025, tendances et évolutions.
- Répartition géographique et par université : concentration de l’offre et sélectivité.
- Domaines et sélectivité : scores moyens, dispersion, top sélectives vs accessibles.
- Contraintes d’admission et durées d’études : poids des conditions et investissement temps.
- Corrélations et évolutions marquantes : stabilité des scores et variations fortes.

### Focus EDA (Phase II)

- Scores : statistiques descriptives 2024/2025, distributions, évolutions.
- Géographie : part des filières par gouvernorat, contrastes intérieur/Grand Tunis.
- Universités : volume de filières, amplitude des scores min/max.
- Domaines : dispersion des scores, parts relatives, sélectivité par boxplots.
- Contraintes : fréquence des conditions (sport, SVT, langue, âge, sexe).
- Durées : répartition 2/3/6/9 ans, sélectivité associée.
- Tops : filières les plus sélectives vs accessibles.
- Critères : formules d’orientation les plus courantes et leur score moyen.
- Corrélation : stabilité des scores entre 2024 et 2025.
- Evolutions marquantes : plus fortes hausses/baisses par filière.

### Visualisations clés

- Densités et distributions comparées (2024 vs 2025).
- Barres horizontales (gouvernorats, universités, domaines).
- Boxplots (sélectivité par domaine).
- Comparaisons top filières (plus/moins sélectives).
- Corrélation scores 2024/2025.

### Prérequis

- R ≥ 4.0
- Quarto : https://quarto.org
- Packages R (voir en-tête de `index.qmd`) : tidyverse, ggplot2, scales, knitr, viridis, readxl, stringr, tidyr, etc.

### Exécution

1. Installer Quarto et les packages R requis.
2. Depuis la racine du projet, lancer :
   ```bash
   quarto render index.qmd
   ```
3. Ouvrir le HTML généré (`index.html`) pour la présentation.

### Résultats attendus

- Rapport HTML interactif (code-folding activé) prêt pour présentation.
- Données nettoyées disponibles dans `Data/data_cleaned.csv` et `Data/data_cleaned.rds`.

### Livrables

- Rapport `index.html` (narratif, code repliable).
- Données nettoyées (CSV, RDS) réutilisables pour d’autres analyses.
- Scripts reproductibles dans `index.qmd` (nettoyage + EDA).

### Stack technique

- R + tidyverse, ggplot2, dplyr, stringr, tidyr, readxl, knitr, viridis.
- Quarto (rendu HTML, code-folding).
- Bash (build.sh optionnel).

### Auteur

- Maroua Hattab — Janvier 2025
