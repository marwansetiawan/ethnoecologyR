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
