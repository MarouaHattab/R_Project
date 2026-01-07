# 📊 Analyse Stratégique : Bac Lettres Tunisie 2025

> **Analyse complète de l'offre universitaire pour les bacheliers Lettres 2025 en Tunisie**

[![Quarto](https://img.shields.io/badge/Quarto-1.4+-blue)](https://quarto.org)
[![R](https://img.shields.io/badge/R-4.0+-green)](https://www.r-project.org)
[![License](https://img.shields.io/badge/License-Educational-yellow)](LICENSE)

---

## 🌐 Accès au Rapport Interactif

**👉 [Consulter le rapport complet en ligne](https://r-project-phi.vercel.app/)**

Le rapport HTML interactif est déployé et accessible directement dans votre navigateur avec :

- Navigation fluide entre les sections
- Code repliable pour une lecture optimale
- Visualisations interactives
- Tableaux de données détaillés

---

## 📋 Description du Projet

Ce projet présente une **analyse statistique complète** des données d'orientation universitaire pour les bacheliers Lettres en Tunisie. Face à une **baisse alarmante du taux de réussite au baccalauréat** (de 44.33% en 2024 à 39.10% en 2025, soit -5.23 points), cette analyse vise à :

### 🎯 Objectifs Principaux

- **Décrire l'offre complète** : 238 filières universitaires avec leurs scores d'entrée (2024/2025), contraintes d'admission et spécialisations
- **Évaluer l'accessibilité** : Identifier les filières les plus accessibles vs les plus sélectives selon les scores d'orientation
- **Analyser la répartition géographique** : Examiner la distribution des opportunités sur le territoire tunisien (19 gouvernorats)
- **Explorer les tendances** : Comparer l'évolution des scores entre 2024 et 2025 pour comprendre l'impact de la baisse du taux de réussite
- **Fournir des recommandations** : Guider les bacheliers Lettres 2026 dans leur stratégie d'orientation

### 🔍 Questions Clés Répondues

1. **Accessibilité** : Quelles filières ont des scores d'entrée plus accessibles en 2025 vs 2024 ?
2. **Répartition géographique** : Comment les offres sont-elles distribuées sur le territoire tunisien ?
3. **Diversité des formations** : Quels domaines et spécialisations sont disponibles ?
4. **Conditions d'admission** : Quelles contraintes spécifiques (sport, langue, âge) peuvent limiter l'accès ?
5. **Tendances** : Les scores d'orientation baissent-ils parallèlement au taux de réussite ?

---

## 📁 Structure du Projet

```
./
├── index.qmd                 # Document Quarto principal (nettoyage + EDA)
├── index.html               # Rapport HTML généré (à ouvrir dans le navigateur)
├── Data/
│   ├── data.xlsx             # Données brutes officielles (240 lignes × 10 colonnes)
│   ├── data_cleaned.csv      # Données nettoyées (238 lignes, UTF-8)
│   └── data_cleaned.rds      # Données nettoyées (format R natif)
├── Notebooks/
│   ├── cleaning.ipynb        # Notebook original de nettoyage
│   └── EDA.ipynb             # Notebook original d'analyse exploratoire
├── build.sh                  # Script de build automatisé (optionnel)
├── vercel.json               # Configuration de déploiement Vercel
└── README.md                 # Ce fichier
```

---

## 📊 Données Utilisées

### Source et Période

- **Source** : Données officielles d'orientation universitaire - Ministère de l'Enseignement Supérieur, Tunisie
- **Période** : Sessions 2024 et 2025
- **Portail** : [Guide d'Orientation RNU](https://guide-orientation.rnu.tn/index.php)

### Variables Analysées

| Variable          | Description                                                        |
| ----------------- | ------------------------------------------------------------------ |
| **Filiere**       | Nom de la filière universitaire                                    |
| **Universite**    | Université proposant la filière (12 universités)                   |
| **Etablissement** | Établissement spécifique (83 établissements)                       |
| **Gouvernorat**   | Localisation géographique (19 gouvernorats)                        |
| **Criteres**      | Formule de calcul du score d'orientation (26 formules différentes) |
| **Duree**         | Durée des études (02, 03, 06, 09 ans)                              |
| **Score_2025**    | Score minimum d'entrée en 2025 (0 à 173.22 points)                 |
| **Score_2024**    | Score minimum d'entrée en 2024 (0 à 182.91 points)                 |
| **Conditions**    | Contraintes d'admission (13 types différents)                      |
| **Specialites**   | Spécialisations proposées (listes complexes)                       |

### Statistiques Clés

- **238 filières** analysées (après nettoyage)
- **12 universités** représentées
- **83 établissements** différents
- **19 gouvernorats** couverts
- **26 formules** de critères d'orientation
- **13 types** de conditions d'admission

---

## 🔧 Phase I : Nettoyage et Préparation des Données

### Défis Majeurs Identifiés

Les données brutes présentaient plusieurs défis techniques :

- **Méta-données corrompues** : Noms de colonnes avec sauts de ligne (`\n`) et tabulations (`\t`)
- **Incohérence textuelle** : Variantes multiples créant des doublons (ex: "l en sc. infirmieres" vs "Licence en Sciences Infirmières")
- **Valeurs vides ambiguës** : Utilisation de termes comme "Rien" ou "03 ans" dans des colonnes de conditions

### Pipeline de Nettoyage

#### 1. Standardisation des Colonnes

- Suppression des sauts de ligne et tabulations
- Normalisation des espaces multiples
- Suppression des caractères spéciaux

#### 2. Harmonisation des Filières

- Conversion en minuscules
- Standardisation du préfixe "L EN"
- Mapping de 22 variantes vers des noms cohérents
- Résultat : **71 filières uniques** après nettoyage initial

#### 3. Nettoyage des Entités

- **Universités** : 12 universités standardisées
- **Établissements** : 83 établissements nettoyés
- **Gouvernorats** : 19 gouvernorats avec casse standardisée

#### 4. Normalisation des Critères et Conditions

- **Critères** : 26 formules standardisées en majuscules
- **Conditions** : 13 types mappés depuis 15 variantes originales
- **Durées** : Format uniforme (02 ans, 03 ans, 06 ans, 09 ans)

#### 5. Traitement Avancé des Spécialités

- Algorithme dédié pour gérer les séparateurs multiples (`/`, `//`, `\`)
- Extraction et nettoyage de chaque spécialité
- Conversion en format liste structurée

#### 6. Gestion des Scores

- Remplacement des valeurs manquantes par 0 (nouvelles filières)
- Vérification des plages min/max
- Scores 2025 : 0 à 173.22 points
- Scores 2024 : 0 à 182.91 points

### Résultats du Nettoyage

- **240 → 238 lignes** (suppression des lignes avec Filiere vide)
- **10 colonnes** standardisées et exploitables
- **Données sauvegardées** : `Data/data_cleaned.csv` (UTF-8) et `Data/data_cleaned.rds`

---

## 📈 Phase II : Analyse Exploratoire des Données (EDA)

### Vue d'Ensemble : Contexte du Bac Lettres 2025

**Le Défi** : Moins de bacheliers, même nombre de places

Avec un taux de réussite passant de **44.33%** à **39.10%**, la compétition pour les filières universitaires devrait théoriquement diminuer. L'analyse révèle :

- **Évolution moyenne** : -0.43 points entre 2024 et 2025
- **47.5%** des filières ont vu leur score baisser
- **51.3%** des filières ont vu leur score augmenter
- **Score médian 2025** : 104.19 points

### Analyses Réalisées

#### 1. Accessibilité des Scores

- Statistiques descriptives comparatives (2024 vs 2025)
- Distribution des scores avec visualisations de densité
- Identification des tendances (forte baisse, légère baisse, stable, légère hausse, forte hausse)

#### 2. Répartition Géographique

- **Concentration** : Grand Tunis concentre 37.4% des filières
- **Top 3 gouvernorats** : Tunis (89 filières), Sfax (25), Sousse (18)
- **Inégalités** : Certains gouvernorats n'offrent qu'une ou deux filières

#### 3. Analyse par Université

- Répartition équilibrée entre les 12 universités
- Top 3 : Carthage, Gabès, Sfax (chacune ~10-11% des filières)
- Amplitude des scores par université

#### 4. Domaines d'Études

- **Catégorisation** : 14 domaines identifiés (Santé, Langues, Sciences Humaines, Arts & Design, etc.)
- **Sélectivité** : Santé et Sport restent les plus sélectives (scores médians >140 points)
- **Accessibilité** : Langues et Sciences Humaines offrent plus d'opportunités

#### 5. Conditions d'Admission

- **68.5%** des filières sans contraintes particulières
- **31.5%** avec contraintes (sport, SVT, langue, âge, sexe)
- Contraintes les plus fréquentes : âge limite (8.0%), SVT obligatoire (6.3%)

#### 6. Durée des Études

- **93.3%** des filières durent 3 ans
- Filières longues (6-9 ans) : Médecine, Pharmacie, Médecine Dentaire (scores >150 points)

#### 7. Top Filières

- **Plus sélectives** : Principalement Santé (Médecine >160 points, Sciences Infirmières >140 points)
- **Plus accessibles** : Majoritairement Langues (Français, Anglais ~70 points)

#### 8. Critères d'Orientation

- **Plus fréquent** : "FG+PH" (27.3% des filières)
- **Sélectivité** : Critères incluant SVT associés aux scores les plus élevés

#### 9. Corrélation 2024-2025

- **Coefficient de corrélation** : r = 0.90 (corrélation FORTE)
- Les filières conservent globalement leur niveau de sélectivité relatif

#### 10. Évolutions Marquantes

- **Plus grandes baisses** : Filières de Santé (-20 à -36 points)
- **Plus grandes hausses** : Filières Arts & Design (+jusqu'à 30 points)

### Visualisations Clés

- 📊 **Distributions comparées** : Densités des scores 2024 vs 2025
- 📍 **Répartition géographique** : Barres horizontales par gouvernorat avec scores moyens
- 🏛️ **Universités** : Graphique en camembert avec pourcentages
- 📚 **Domaines** : Boxplots montrant la dispersion des scores par domaine
- 🎯 **Top filières** : Comparaison visuelle sélectives vs accessibles
- 📈 **Corrélation** : Scatter plot avec ligne de régression
- 📉 **Évolutions** : Graphiques en barres des plus grandes variations

---

## 💡 Insights et Résultats Clés

### Principales Découvertes

1. **Impact limité de la baisse du taux de réussite**

   - Malgré -5.23 points au bac, l'évolution moyenne des scores est seulement de -0.43 points
   - 51% des filières ont vu leur score augmenter, suggérant une concentration des meilleurs candidats

2. **Polarisation géographique marquée**

   - Grand Tunis concentre près de 40% de l'offre
   - Inégalité d'accès pour les étudiants des régions intérieures

3. **Sélectivité par domaine**

   - Santé reste très sélective (scores >140 points)
   - Langues offrent plus d'opportunités (scores ~70-90 points)

4. **Stabilité relative des scores**
   - Corrélation forte (r=0.90) entre 2024 et 2025
   - Les filières conservent leur niveau de sélectivité relatif

### Recommandations pour les Bacheliers Lettres 2026

#### Opportunités à Saisir

| Domaine               | Avantages                              | Score Moyen |
| --------------------- | -------------------------------------- | ----------- |
| **Langues**           | Scores accessibles, peu de contraintes | ~90 points  |
| **Sciences Humaines** | Bonne diversité, débouchés variés      | ~97 points  |
| **Arts & Design**     | Profils créatifs, options diversifiées | ~104 points |
| **Communication**     | Secteur en expansion                   | ~100 points |

#### Filières Sélectives (Préparation Intensive)

| Filière                  | Score Requis | Contraintes                 |
| ------------------------ | ------------ | --------------------------- |
| **Médecine/Santé**       | >160 points  | SVT obligatoire             |
| **Sciences Infirmières** | >140 points  | Sport + contraintes de sexe |
| **Prépa Anglais**        | >130 points  | Très demandée               |
| **Architecture**         | >140 points  | Places limitées             |

#### Stratégie Géographique

- **Grand Tunis** (37% des filières) : Plus grand choix mais concurrence élevée
- **Sfax, Sousse, Monastir** : Alternatives intéressantes avec scores potentiellement plus accessibles
- **Régions intérieures** : Moins de choix mais opportunités moins connues

---

## 🛠️ Technologies Utilisées

### Analyse et Traitement des Données

- **R** (≥4.0) : Langage de programmation statistique
- **tidyverse** : Manipulation de données (dplyr, tidyr)
- **ggplot2** : Visualisation de données avancée
- **stringr** : Manipulation des chaînes de caractères
- **readxl** : Lecture des fichiers Excel
- **knitr** : Génération de rapports
- **viridis** : Palettes de couleurs accessibles

### Publication et Présentation

- **Quarto** : Système de publication scientifique et technique
- **HTML** : Format de sortie interactif avec code-folding
- **Bootstrap** : Framework CSS pour l'interface
- **Vercel** : Plateforme de déploiement web

---

## 🚀 Installation et Utilisation

### Prérequis

- **R** (version 4.0 ou supérieure) : [Télécharger R](https://www.r-project.org)
- **Quarto** : [Installer Quarto](https://quarto.org/docs/get-started/)
- **Packages R** : Voir la liste complète dans l'en-tête de `index.qmd`

### Installation des Packages R

```r
# Installer les packages nécessaires
install.packages(c(
  "readxl",      # Lecture Excel
  "dplyr",       # Manipulation de données
  "stringr",     # Manipulation de chaînes
  "tidyr",       # Nettoyage des données
  "ggplot2",     # Visualisations
  "scales",      # Formatage des axes
  "knitr",       # Tableaux formatés
  "viridis"      # Palettes de couleurs
))
```

### Exécution Locale

1. **Cloner ou télécharger** le projet
2. **Ouvrir un terminal** dans le répertoire du projet
3. **Lancer le rendu** :
   ```bash
   quarto render index.qmd
   ```
4. **Ouvrir le résultat** : Le fichier `index.html` sera généré et peut être ouvert dans votre navigateur

### Build Automatisé (Optionnel)

```bash
# Rendre le script exécutable
chmod +x build.sh

# Exécuter le build
./build.sh
```

---

## 📦 Résultats et Livrables

### Rapport HTML Interactif

- **Format** : HTML avec navigation fluide
- **Fonctionnalités** :
  - Code repliable pour une lecture optimale
  - Table des matières interactive
  - Visualisations intégrées
  - Tableaux de données détaillés
- **Accès** : [Consulter en ligne](https://r-project-phi.vercel.app/) ou ouvrir `index.html` localement

### Données Nettoyées

- **`Data/data_cleaned.csv`** : Format CSV avec encodage UTF-8 (pour Excel, analyses)
- **`Data/data_cleaned.rds`** : Format R natif (préserve les listes de spécialités)

### Scripts Reproductibles

- **`index.qmd`** : Document Quarto complet avec tout le code (nettoyage + EDA)
- **`Notebooks/cleaning.ipynb`** : Notebook original de nettoyage
- **`Notebooks/EDA.ipynb`** : Notebook original d'analyse exploratoire

---

## 📊 Méthodologie

### Approche

1. **Nettoyage rigoureux** : Standardisation complète des données brutes
2. **Analyse exploratoire** : Exploration systématique de toutes les dimensions
3. **Visualisation** : Graphiques clairs et informatifs
4. **Synthèse** : Conclusions et recommandations actionnables

### Reproducibilité

- Tous les codes sont inclus dans le document Quarto
- Les données brutes sont fournies
- Les étapes sont documentées et commentées
- Les résultats peuvent être reproduits en exécutant `quarto render index.qmd`

---

## 🌐 Déploiement

Le projet est déployé sur **Vercel** et accessible à l'adresse :

**👉 [https://r-project-phi.vercel.app/](https://r-project-phi.vercel.app/)**

### Configuration

- **Plateforme** : Vercel
- **Build automatique** : À chaque push sur le dépôt
- **Configuration** : `vercel.json` pour les paramètres de déploiement

---


## 📄 Licence

Ce projet est destiné à des fins **éducatives et de recherche**. Les données sont issues de sources officielles publiques et sont utilisées dans le cadre d'une analyse statistique.

---

## 📚 Ressources Complémentaires

- [Documentation Quarto](https://quarto.org/docs/)
- [Guide d'Orientation RNU](https://guide-orientation.rnu.tn/index.php)
- [Documentation tidyverse](https://www.tidyverse.org/)
- [Documentation ggplot2](https://ggplot2.tidyverse.org/)

---

**⭐ Si ce projet vous est utile, n'hésitez pas à le partager !**
