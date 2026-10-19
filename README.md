# ethnoecologyR

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/ethnoecologyR)](https://CRAN.R-project.org/package=ethnoecologyR)
[![R-CMD-check](https://github.com/marwansetiawan/ethnoecologyR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/marwansetiawan/ethnoecologyR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## 🌿 Quantitative Ethnoecology & Local Ecological Knowledge (LEK) Analysis

**`ethnoecologyR`** is an R toolkit for the quantitative analysis of **Local Ecological Knowledge (LEK)** within landscape and ecosystem contexts. The package implements various standard ethnoecology indices and is equipped with interactive visualizations and Bayesian modeling to support reproducible research.

It is designed to assist ethnoecologists, anthropologists, and conservationists in analyzing local ecological knowledge data rapidly, accurately, and in a standardized manner.

---

## ✨ Key Features

| Function | Description |
| :--- | :--- |
| `LUs()` | Calculates Landscape Use (LU) |
| `CIEs()` | Calculates Cultural Importance in Ecology (CIE) |
| `FCs_eco()` | Calculates Frequency of Citation (FC) |
| `FLs_eco()` | Calculates Fidelity Level (FL) |
| `NUs_eco()` | Calculates Number of Uses (NU) |
| `CVe_eco()` | Calculates Cultural Value of Ecolandscape (CVe) |
| `ethno_landscape_chord()` | Visualizes Informant-Landscape relationships (Chord Diagram) |
| `ethno_landscape_alluvial()` | Visualizes knowledge flow (Alluvial Plot) |
| `ethno_sankey_plot()` | Visualizes knowledge flow (Sankey Diagram) |
| `landscape_radial_plot()` | Visualizes multi-index comparisons (Radial Plot) |
| `ethno_bayes_land()` | Informant consensus modeling using MCMC (Stan) |
| `ethno_boot_land()` | Bootstrap resampling for confidence interval estimation |

---

## 🔧 Installation

You can install the stable version from **CRAN**:

```r
install.packages("ethnoecologyR")

Or install the latest development version from GitHub:
# install.packages("pak")
pak::pak("marwansetiawan/ethnoecologyR")

---

## 🚀 Example Usage

library(ethnoecologyR)

# Load the built-in test dataset
data(ethnoecology_data)

# 1. Calculate basic indices
LUs(ethnoecology_data)
CIEs(ethnoecology_data)

# 2. Visualize the relationship between Informants and Landscapes
ethno_landscape_chord(ethnoecology_data, by = "landscape_unit")

# 3. Bayesian Consensus Analysis
fit <- ethno_bayes_land(ethnoecology_data, iter = 500, chains = 2)

## 📝 Citation
If you use this package in your scientific publications, please cite it as:
citation("ethnoecologyR")

Or use the following format:
Setiawan, M. (2026). ethnoecologyR: Quantitative Ethnoecology Analysis and Landscape Knowledge Modeling. R package version 0.1.4. URL: https://cran.r-project.org/package=ethnoecologyR

👤 Author
Marwan Setiawan

BRIN (National Research and Innovation Agency of Indonesia)

ORCID: 0000-0003-2754-0640

GitHub: @marwansetiawan

📄 License
GPL (>= 3)

---

### 🚀 Langkah Eksekusi:
1. Buka repo GitHub `ethnoecologyR` lo.
2. Klik file `README.md`, lalu klik ikon **Pensil (Edit)** di pojok kanan atas.
3. Hapus semua isinya, lalu **Paste** teks bahasa Inggris di atas.
4. Klik **Commit changes**.

Sekarang, peneliti dari Jepang, Jerman, atau Amerika yang buka GitHub lo bakal langsung paham dan tertarik buat pakai paketnya. Mantap, bro! *Go international!* 🌍🔥📦
