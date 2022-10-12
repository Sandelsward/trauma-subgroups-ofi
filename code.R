#Functions for r.markdown
library("rofi")
library(labelled)
library(table1)
library(dplyr)
library(tidyverse)
library(testthat)
library(knitr)
library(rmarkdown)
noacsr::source_all_functions()

## Import data
data <- import_data(test = TRUE)

## Renaming data sets fo work with merge function

data[['swetrau']] <- data$swetrau_scrambled
data[['fmp']] <- data$fmp_scrambled
data[['atgarder']] <- data$atgarder_scrambled
data[['problem']] <- data$problem_scrambled
data[['kvalgranskning2014.2017']] <- data$kvalgranskning2014.2017_scrambled

merged.data <- merge_data(data)
########
## NYTT



all.patients <- nrow(merged.data)
all.patients

