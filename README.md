# ethnoecologyR <img src="man/figures/logo.png" align="right" height="139" alt="" />

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/ethnoecologyR)](https://CRAN.R-project.org/package=ethnoecologyR)
[![R-CMD-check](https://github.com/marwansetiawan/ethnoecologyR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/marwansetiawan/ethnoecologyR/actions/workflows/R-CMD-check.yaml)
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->

## 🌿 Quantitative Ethnoecology & Landscape TEK

**`ethnoecologyR`** adalah toolkit R untuk analisis kuantitatif **Local Ecological Knowledge (LEK)** dalam konteks lanskap dan ekosistem. Paket ini mengimplementasikan berbagai indeks standar etnoekologi dan dilengkapi dengan visualisasi interaktif serta pemodelan Bayesian untuk mendukung penelitian yang *reproducible*.

Paket ini dirancang untuk membantu peneliti etnoekologi, antropolog, dan konservasionis dalam menganalisis data pengetahuan ekologi lokal secara cepat, akurat, dan terstandarisasi.

---

## ✨ Fitur Utama

| Fungsi | Deskripsi |
| :--- | :--- |
| `LUs()` | Menghitung Landscape Use (LU) |
| `CIEs()` | Menghitung Cultural Importance in Ecology (CIE) |
| `FCs_eco()` | Menghitung Frequency of Citation (FC) |
| `FLs_eco()` | Menghitung Fidelity Level (FL) |
| `NUs_eco()` | Menghitung Number of Uses (NU) |
| `CVe_eco()` | Menghitung Cultural Value of Ecolandscape (CVe) |
| `ethno_landscape_chord()` | Visualisasi hubungan Informan-Lanskap (Chord Diagram) |
| `ethno_landscape_alluvial()` | Visualisasi aliran data (Alluvial Plot) |
| `ethno_sankey_plot()` | Visualisasi aliran data (Sankey Diagram) |
| `landscape_radial_plot()` | Visualisasi perbandingan multi-indeks (Radial Plot) |
| `ethno_bayes_land()` | Pemodelan konsensus informan dengan MCMC (Stan) |
| `ethno_boot_land()` | Bootstrap resampling untuk estimasi interval kepercayaan |

---

## 🔧 Instalasi

Anda dapat menginstal versi stabil dari **CRAN**:

```r
install.packages("ethnoecologyR")
