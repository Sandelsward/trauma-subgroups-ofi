## This file shows how to write a function in R

#example_function <- function() {
    ## This is a comment and will not be interpreted by R
   # x <- 1 + 2
  #  return (x)

create_table_one <- function(all.subgroups) {
  
  ## Renaming data labels
  
  all.subgroups$pt_Gender <- factor(
    all.subgroups$pt_Gender,
    levels = c(1, 2),
    labels = c("Male", "Female")
  )
  
  all.subgroups$inj_mechanism <- factor(
    all.subgroups$inj_mechanism,
    levels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 999),
    labels = c("Traffic - motor veichle accident, not motorcycle", "Traffic - motorcycle accident", "Traffic - bicycle accident", "Traffic - pedastrian", "Traffic - other", "Shot by handgun, shotgun, rifle, other firearm of any calibre ", "Stabbed by knife, sword, dagger other pointed or sharp object", "Struck or hit by blunt object", "Low energy fall - fall in the same level", "High energy fall - fall from a higher level","Blast injury", "Other", "Unknown")
  )
  
  all.subgroups$inj_dominant <- factor(
  all.subgroups$inj_dominant,
  levels = c(1, 2),
  labels = c("Blunt", "Penetrating"),
)

all.subgroups$ofi <- factor(
  all.subgroups$ofi,
  levels = c("Yes", "No"),
  labels = c("Yes, atleast one opportunity for improvement", "No opportunities for improvement"),
)


## Renaming column labels
var_label(all.subgroups) <- list (
  pt_age_yrs = "Age (years)",
  pt_Gender = "Gender",
  inj_dominant = "Dominating Type of Injury",
  ofi = "Opportunity for improvement",
  inj_mechanism = "Mechanism of injury"
)



## Fixing weird rounding issues + removing mean from table
my.render.cont <- function(x) {
  with(stats.default(x), 
       c("",
         
         "Median (Min, Max)" = sprintf("%s (%s, %s)",
                                       round_pad(MEDIAN, 0), 
                                       round_pad(MIN, 0), 
                                       round_pad(MAX, 0)))
  )
}

## Making table one
vars2 <- c("pt_age_yrs", "pt_Gender", "inj_mechanism", "inj_dominant", "ofi")
table.1 <- table1(~ pt_age_yrs + pt_Gender + inj_mechanism + inj_dominant | ofi, 
             data=all.subgroups[,vars2], overall = FALSE, render.categorical="FREQ (PCTnoNA%)", render.continuous = my.render.cont)

return(table.1)
}

