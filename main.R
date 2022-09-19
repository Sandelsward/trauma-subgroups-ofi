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
library(tableone)

noacsr::source_all_functions()

## Import data
data <- import_data(test = TRUE)

## Whatever you do next, maybe clean data?

data[['swetrau']] <- data$swetrau_scrambled
data[['fmp']] <- data$fmp_scrambled
data[['atgarder']] <- data$atgarder_scrambled
data[['problem']] <- data$problem_scrambled
data[['kvalgranskning2014.2017']] <- data$kvalgranskning2014.2017_scrambled

merge_data <- merge_data(data)

merge_data$OFI <- create_ofi(merge_data)
print(create_ofi)


## Whatever you do next, maybe clean data?
##Frågor
##1: clean data, behöver jag göra det nu eller vänta tills jag gjort subgrupper?
  ##2: Skapa kolumner för alla subgrupper som inte finns?
  ##3: Hur ska jag skapa en kolumn för OFI?

  





