## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(ethnoecologyR)

## -----------------------------------------------------------------------------
data(ethnoecology_data)
head(ethnoecology_data)

## -----------------------------------------------------------------------------
LUs(ethnoecology_data)

## -----------------------------------------------------------------------------
CIEs(ethnoecology_data)

## -----------------------------------------------------------------------------
FCs_eco(ethnoecology_data)

## -----------------------------------------------------------------------------
FLs_eco(ethnoecology_data, "use_forest")

## -----------------------------------------------------------------------------
NUs_eco(ethnoecology_data)

## -----------------------------------------------------------------------------
CVe_eco(ethnoecology_data)

## ----fig.cap="Chord diagram of landscape units and uses"----------------------
ethno_landscape_chord(ethnoecology_data, by = "landscape_unit")

## ----fig.cap="Chord diagram of informants and uses"---------------------------
ethno_landscape_chord(ethnoecology_data, by = "informant")

## ----fig.cap="Alluvial plot of landscape uses"--------------------------------
ethno_landscape_alluvial(ethnoecology_data)

## ----fig.cap="Radial plot of multiple ethnoecology indices"-------------------
landscape_radial_plot(ethnoecology_data, list(LUs, CIEs, FCs_eco))

## ----eval = FALSE-------------------------------------------------------------
# fit <- ethno_bayes_land(ethnoecology_data, iter = 500, chains = 2)
# print(fit, pars = c("theta[1]", "theta[2]", "theta[3]"))

