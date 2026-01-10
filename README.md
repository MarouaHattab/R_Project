# Strategic Analysis: Baccalaureate Lettres Tunisia 2025

> **Comprehensive analysis of university offerings for Lettres baccalaureate graduates 2025 in Tunisia**

[![Quarto](https://img.shields.io/badge/Quarto-1.4+-blue)](https://quarto.org)
[![R](https://img.shields.io/badge/R-4.0+-green)](https://www.r-project.org)
[![License](https://img.shields.io/badge/License-Educational-yellow)](LICENSE)

---

## Access to Interactive Report

**[View the complete report online](https://r-project-phi.vercel.app/)**

The interactive HTML report is deployed and accessible directly in your browser with:

- Smooth navigation between sections
- Collapsible code for optimal reading
- Interactive visualizations
- Detailed data tables

---

## Project Description

This project presents a **comprehensive statistical analysis** of university orientation data for Lettres baccalaureate graduates in Tunisia. Faced with an **alarming drop in the baccalaureate success rate** (from 44.33% in 2024 to 39.10% in 2025, a -5.23 point decrease), this analysis aims to:

### Main Objectives

- **Describe the complete offering**: 238 university programs with their entry scores (2024/2025), admission constraints, and specializations
- **Evaluate accessibility**: Identify the most accessible vs most selective programs based on orientation scores
- **Analyze geographic distribution**: Examine the distribution of opportunities across Tunisian territory (19 governorates)
- **Explore trends**: Compare score evolution between 2024 and 2025 to understand the impact of the success rate decline
- **Provide recommendations**: Guide Lettres baccalaureate graduates 2026 in their orientation strategy

### Key Questions Answered

1. **Accessibility**: Which programs have more accessible entry scores in 2025 vs 2024?
2. **Geographic distribution**: How are offerings distributed across Tunisian territory?
3. **Training diversity**: What fields and specializations are available?
4. **Admission conditions**: What specific constraints (sports, language, age) can limit access?
5. **Trends**: Are orientation scores declining in parallel with the success rate?

---

## Project Structure

```
./
├── index.qmd                 # Main Quarto document (cleaning + EDA)
├── index.html               # Generated HTML report (open in browser)
├── Data/
│   ├── data.xlsx             # Raw official data (240 rows × 10 columns)
│   ├── data_cleaned.csv      # Cleaned data (238 rows, UTF-8)
│   └── data_cleaned.rds      # Cleaned data (native R format)
├── Notebooks/
│   ├── cleaning.ipynb        # Original cleaning notebook
│   └── EDA.ipynb             # Original exploratory analysis notebook
├── build.sh                  # Automated build script (optional)
├── vercel.json               # Vercel deployment configuration
└── README.md                 # This file
```

---

## Data Used

### Source and Period

- **Source**: Official university orientation data - Ministry of Higher Education, Tunisia
- **Period**: 2024 and 2025 sessions
- **Portal**: [RNU Orientation Guide](https://guide-orientation.rnu.tn/index.php)

### Variables Analyzed

| Variable          | Description                                                     |
| ----------------- | --------------------------------------------------------------- |
| **Filiere**       | University program name                                         |
| **Universite**    | University offering the program (12 universities)               |
| **Etablissement** | Specific institution (83 institutions)                          |
| **Gouvernorat**   | Geographic location (19 governorates)                           |
| **Criteres**      | Orientation score calculation formula (26 different formulas)   |
| **Duree**         | Study duration (02, 03, 06, 09 years)                           |
| **Score_2025**    | Minimum entry score in 2025 (0 to 173.22 points)                |
| **Score_2024**    | Minimum entry score in 2024 (0 to 182.91 points)                |
| **Conditions**    | Admission constraints (13 different types)                      |
| **Specialites**   | Proposed specializations (complex lists)                        |

### Key Statistics

- **238 programs** analyzed (after cleaning)
- **12 universities** represented
- **83 different institutions**
- **19 governorates** covered
- **26 orientation** criteria formulas
- **13 types** of admission conditions

---

## Phase I: Data Cleaning and Preparation

### Major Challenges Identified

Raw data presented several technical challenges:

- **Corrupted metadata**: Column names with line breaks (`\n`) and tabs (`\t`)
- **Textual inconsistency**: Multiple variants creating duplicates (e.g., "l en sc. infirmieres" vs "Licence en Sciences Infirmières")
- **Ambiguous empty values**: Use of terms like "Rien" or "03 ans" in condition columns

### Cleaning Pipeline

#### 1. Column Standardization

- Removal of line breaks and tabs
- Normalization of multiple spaces
- Removal of special characters

#### 2. Program Harmonization

- Conversion to lowercase
- Standardization of "L EN" prefix
- Mapping of 22 variants to coherent names
- Result: **71 unique programs** after initial cleaning

#### 3. Entity Cleaning

- **Universities**: 12 standardized universities
- **Institutions**: 83 cleaned institutions
- **Governorates**: 19 governorates with standardized case

#### 4. Criteria and Conditions Normalization

- **Criteria**: 26 formulas standardized in uppercase
- **Conditions**: 13 types mapped from 15 original variants
- **Durations**: Uniform format (02 years, 03 years, 06 years, 09 years)

#### 5. Advanced Processing of Specializations

- Dedicated algorithm to handle multiple separators (`/`, `//`, `\`)
- Extraction and cleaning of each specialization
- Conversion to structured list format

#### 6. Score Management

- Replacement of missing values with 0 (new programs)
- Min/max range verification
- 2025 Scores: 0 to 173.22 points
- 2024 Scores: 0 to 182.91 points

### Cleaning Results

- **240 → 238 rows** (removal of rows with empty Filiere)
- **10 standardized** and usable columns
- **Saved data**: `Data/data_cleaned.csv` (UTF-8) and `Data/data_cleaned.rds`

---

## Phase II: Exploratory Data Analysis (EDA)

### Overview: Context of Bac Lettres 2025

**The Challenge**: Fewer graduates, same number of places

With a success rate dropping from **44.33%** to **39.10%**, competition for university programs should theoretically decrease. The analysis reveals:

- **Average evolution**: -0.43 points between 2024 and 2025
- **47.5%** of programs saw their score decrease
- **51.3%** of programs saw their score increase
- **2025 median score**: 104.19 points

### Analyses Performed

#### 1. Score Accessibility

- Comparative descriptive statistics (2024 vs 2025)
- Score distribution with density visualizations
- Trend identification (sharp decline, slight decline, stable, slight increase, sharp increase)

#### 2. Geographic Distribution

- **Concentration**: Greater Tunis concentrates 37.4% of programs
- **Top 3 governorates**: Tunis (89 programs), Sfax (25), Sousse (18)
- **Inequalities**: Some governorates offer only one or two programs

#### 3. University Analysis

- Balanced distribution among 12 universities
- Top 3: Carthage, Gabès, Sfax (each ~10-11% of programs)
- Score range by university

#### 4. Fields of Study

- **Categorization**: 14 identified fields (Health, Languages, Humanities, Arts & Design, etc.)
- **Selectivity**: Health and Sports remain the most selective (median scores >140 points)
- **Accessibility**: Languages and Humanities offer more opportunities

#### 5. Admission Conditions

- **68.5%** of programs without particular constraints
- **31.5%** with constraints (sports, biology, language, age, gender)
- Most frequent constraints: age limit (8.0%), mandatory biology (6.3%)

#### 6. Study Duration

- **93.3%** of programs last 3 years
- Long programs (6-9 years): Medicine, Pharmacy, Dental Medicine (scores >150 points)

#### 7. Top Programs

- **Most selective**: Primarily Health (Medicine >160 points, Nursing Sciences >140 points)
- **Most accessible**: Mainly Languages (French, English ~70 points)

#### 8. Orientation Criteria

- **Most frequent**: "FG+PH" (27.3% of programs)
- **Selectivity**: Criteria including biology associated with highest scores

#### 9. 2024-2025 Correlation

- **Correlation coefficient**: r = 0.90 (STRONG correlation)
- Programs generally maintain their relative level of selectivity

#### 10. Notable Changes

- **Largest decreases**: Health programs (-20 to -36 points)
- **Largest increases**: Arts & Design programs (+up to 30 points)

### Key Visualizations

- **Compared distributions**: 2024 vs 2025 score densities
- **Geographic distribution**: Horizontal bars by governorate with average scores
- **Universities**: Pie chart with percentages
- **Fields**: Boxplots showing score dispersion by field
- **Top programs**: Visual comparison selective vs accessible
- **Correlation**: Scatter plot with regression line
- **Evolutions**: Bar charts of largest variations

---

## Insights and Key Results

### Main Findings

1. **Limited impact of success rate decline**

   - Despite -5.23 points at bac, average score evolution is only -0.43 points
   - 51% of programs saw their score increase, suggesting concentration of best candidates

2. **Marked geographic polarization**

   - Greater Tunis concentrates nearly 40% of offerings
   - Access inequality for students from interior regions

3. **Selectivity by field**

   - Health remains highly selective (scores >140 points)
   - Languages offer more opportunities (scores ~70-90 points)

4. **Relative score stability**
   - Strong correlation (r=0.90) between 2024 and 2025
   - Programs maintain their relative selectivity level

### Recommendations for Lettres Baccalaureate Graduates 2026

#### Opportunities to Seize

| Field                 | Advantages                               | Average Score |
| --------------------- | ---------------------------------------- | ------------- |
| **Languages**         | Accessible scores, few constraints       | ~90 points    |
| **Humanities**        | Good diversity, varied career paths      | ~97 points    |
| **Arts & Design**     | Creative profiles, diversified options   | ~104 points   |
| **Communication**     | Expanding sector                         | ~100 points   |

#### Selective Programs (Intensive Preparation)

| Program                  | Required Score | Constraints                    |
| ------------------------ | -------------- | ------------------------------ |
| **Medicine/Health**      | >160 points    | Mandatory biology              |
| **Nursing Sciences**     | >140 points    | Sports + gender constraints    |
| **English Prep**         | >130 points    | High demand                    |
| **Architecture**         | >140 points    | Limited places                 |

#### Geographic Strategy

- **Greater Tunis** (37% of programs): Greater choice but high competition
- **Sfax, Sousse, Monastir**: Interesting alternatives with potentially more accessible scores
- **Interior regions**: Fewer choices but less known opportunities

---

## Technologies Used

### Data Analysis and Processing

- **R** (≥4.0): Statistical programming language
- **tidyverse**: Data manipulation (dplyr, tidyr)
- **ggplot2**: Advanced data visualization
- **stringr**: String manipulation
- **readxl**: Excel file reading
- **knitr**: Report generation
- **viridis**: Accessible color palettes

### Publishing and Presentation

- **Quarto**: Scientific and technical publishing system
- **HTML**: Interactive output format with code-folding
- **Bootstrap**: CSS framework for interface
- **Vercel**: Web deployment platform

---

## Installation and Usage

### Prerequisites

- **R** (version 4.0 or higher): [Download R](https://www.r-project.org)
- **Quarto**: [Install Quarto](https://quarto.org/docs/get-started/)
- **R Packages**: See complete list in `index.qmd` header

### Installing R Packages

```r
# Install necessary packages
install.packages(c(
  "readxl",      # Excel reading
  "dplyr",       # Data manipulation
  "stringr",     # String manipulation
  "tidyr",       # Data cleaning
  "ggplot2",     # Visualizations
  "scales",      # Axis formatting
  "knitr",       # Formatted tables
  "viridis"      # Color palettes
))
```

### Local Execution

1. **Clone or download** the project
2. **Open a terminal** in the project directory
3. **Launch rendering**:
   ```bash
   quarto render index.qmd
   ```
4. **Open the result**: The `index.html` file will be generated and can be opened in your browser

### Automated Build (Optional)

```bash
# Make the script executable
chmod +x build.sh

# Execute the build
./build.sh
```

---

## Results and Deliverables

### Interactive HTML Report

- **Format**: HTML with smooth navigation
- **Features**:
  - Collapsible code for optimal reading
  - Interactive table of contents
  - Integrated visualizations
  - Detailed data tables
- **Access**: [View online](https://r-project-phi.vercel.app/) or open `index.html` locally

### Cleaned Data

- **`Data/data_cleaned.csv`**: CSV format with UTF-8 encoding (for Excel, analyses)
- **`Data/data_cleaned.rds`**: Native R format (preserves specialization lists)

### Reproducible Scripts

- **`index.qmd`**: Complete Quarto document with all code (cleaning + EDA)
- **`Notebooks/cleaning.ipynb`**: Original cleaning notebook
- **`Notebooks/EDA.ipynb`**: Original exploratory analysis notebook

---

## Methodology

### Approach

1. **Rigorous cleaning**: Complete standardization of raw data
2. **Exploratory analysis**: Systematic exploration of all dimensions
3. **Visualization**: Clear and informative graphics
4. **Synthesis**: Actionable conclusions and recommendations

### Reproducibility

- All code is included in the Quarto document
- Raw data is provided
- Steps are documented and commented
- Results can be reproduced by executing `quarto render index.qmd`

---

## Deployment

The project is deployed on **Vercel** and accessible at:

**[https://r-project-phi.vercel.app/](https://r-project-phi.vercel.app/)**

### Configuration

- **Platform**: Vercel
- **Automatic build**: On each repository push
- **Configuration**: `vercel.json` for deployment settings

---

## License

This project is intended for **educational and research purposes**. Data comes from official public sources and is used as part of a statistical analysis.

---

## Additional Resources

- [Quarto Documentation](https://quarto.org/docs/)
- [RNU Orientation Guide](https://guide-orientation.rnu.tn/index.php)
- [tidyverse Documentation](https://www.tidyverse.org/)
- [ggplot2 Documentation](https://ggplot2.tidyverse.org/)

---

**If this project is useful to you, feel free to share it!**
