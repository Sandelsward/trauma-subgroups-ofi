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


prepared.data <- prepare_data(merged.data)
cleaned.data <- clean_data(prepared.data)

data<-cleaned.data[complete.cases(cleaned.data[,c("AISCode_01")]),]
test2 <- data
test2$area <- NA
for (i in 1:nrow(data)) {
  print(i)
  test2[i,"area"] <- areas_severe_damage(data[i,])
}

table.1 <- create_table_one(cleaned.data)

cleaned.data <- ais_last(cleaned.data)
cleaned.data <- ais_first(cleaned.data)
#cleaned.data <- ais_to_iss(cleaned.data)
#cleaned.data <- most.damaged.region(cleaned.data)
cleaned.data[, 108:157] <- convert_ais_data_to_iss_regions(cleaned.data[, 108:157])


#test.data <- cleaned.data %>% mutate(across(7:56, ~substr(.x, 8, 8), .names = "{col}.last"))

#cleaned.data$ais.last.1 <- apply(cleaned.data, 1, ais_last)

#cleaned.data$ais.first.1 <- apply(cleaned.data, 1, ais_first)
## Clean data 





  





