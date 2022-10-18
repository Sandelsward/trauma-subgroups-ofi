## Welcome!

## This is your project's main script file and together with
## manuscript.Rmd it provides and entry point for you and other people
## coming to the project. The code in this file should give an outline
## of the different steps conducted in your study, from importing data
## to producing results.

## This file should be relatively short, and most of the heavy
## lifting should be done by specialised functions. These functions
## live in the folder functions/ and you create a new function using
## create_function().

## Feel free to remove this introductory text as you get started.

## Source all functions (if you tick the box "Source on save" in
## RStudio functions will be automatically sourced when you save
## them). They all need to be sourced however when you compile your
## manuscript file or run this file as a job, as that happens in a
## clean R session.
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

merged.data$OFI <- create_ofi(merged.data)
prepared.data <- prepare_data(merged.data)
cleaned.data <- clean_data(prepared.data)
table.1 <- create_table_one(cleaned.data)


cleaned.data <- ais_last(cleaned.data)
cleaned.data <- ais_first(cleaned.data)

#cleaned.data <- ais_to_iss(cleaned.data)
#cleaned.data <- most.damaged.region(cleaned.data)
#cleaned.data[, 108:157] <- convert_ais_data_to_iss_regions(cleaned.data[, 108:157])
#table(test2$area)
all.patients <- nrow(merged.data)
areas.severe.damage <- areas_severe_damage(cleaned.data)
#test.data <- cleaned.data %>% mutate(across(7:56, ~substr(.x, 8, 8), .names = "{col}.last"))
total.cohort <- nrow(test2)
#cleaned.data$ais.last.1 <- apply(cleaned.data, 1, ais_last)

#cleaned.data$ais.first.1 <- apply(cleaned.data, 1, ais_first)
## Clean data 





  





