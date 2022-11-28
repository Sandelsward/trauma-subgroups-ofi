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
library(DiagrammeR)
library(assertthat)
library(formattable)
noacsr::source_all_functions()

## Import data
data <- import_data()

## Renaming data sets fo work with merge function


merged.data <- merge_data(data)
########
## NYTT

merged.data$OFI <- create_ofi(merged.data)
prepared.data <- prepare_data(merged.data)
prepared.data$most.severe.region <- create_most_severe_region(prepared.data)
cleaned.data <- clean_data(prepared.data)
cleaned.data <- create_minor_major_trauma(cleaned.data)
table.1 <- create_table_one(cleaned.data)
#table.2 <- create_table_two(df.ofi.frequency)
all.patients <- nrow(merged.data)
pt_demographics <- Test_table(cleaned.data)


## I suggest that you source this file separately in your markdown,
## for now, because that allows you to cache the "main" chunk and save
## some time knitting

## source("frequency.of.ofi.R")
## #### Inladdad istället för att ha den i functions. Du skulle också
## kunnat skriva koden direkt här.




#cleaned.data$ais.last.1 <- apply(cleaned.data, 1, ais_last)

#cleaned.data$ais.first.1 <- apply(cleaned.data, 1, ais_first)
## Clean data 










