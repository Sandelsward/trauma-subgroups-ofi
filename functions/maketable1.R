## This file shows how to write a function in R

#example_function <- function() {
    ## This is a comment and will not be interpreted by R
   # x <- 1 + 2
  #  return (x)

make_table_one <- function(as) {
  
  ## Renaming data labels
  
  as$Gender <- factor(
    as$Gender,
    levels = c(1, 2),
    labels = c("Male", "Female")
  )
  
  as$inj_mechanism <- factor(
    as$inj_mechanism,
    levels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 999),
    labels = c("Traffic - motor veichle accident, not motorcycle", "Traffic - motorcycle accident", "Traffic - bicycle accident", "Traffic - pedastrian", "Traffic - other", "Shot by handgun, shotgun, rifle, other firearm of any calibre ", "Stabbed by knife, sword, dagger other pointed or sharp object", "Struck or hit by blunt object", "Low energy fall - fall in the same level", "High energy fall - fall from a higher level", "Other", "Unknown")
  )
  
  
  )

as$inj_dominant <- factor(
  as$inj_dominant,
  levels = c(1, 2),
  labels = c("Blunt", "Penetrating"),
)

as$ofi <- factor(
  as$ofi,
  levels = c("Yes", "No"),
  labels = c("Yes, atleast one opportunity for improvement", "No opportunities for improvement"),
)


## Renaming column labels
var_label(as) <- list (
  pt_age_yrs = "Age (years)",
  pt_Gender = "Gender",
  NISS = "NISS",
  inj_dominant = "Dominating Type of Injury",
  ofi = "Opportunity for improvement"
  inj_mechanism = "Mechanism of injury"
)


## Not being used
## rndr <- function(x, name, ...) {
##  if (!is.numeric(x)) return(render.categorical.default(x))
##  what <- switch(name,
##                 pt_age_years = "Mean (SD)",
##                 ISS  = "Mean (SD)")
##  parse.abbrev.render.code(c("", what))(x)
## }


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
vars2 <- c("pt_age_yrs", "Gender", "inj_mechanism", "NISS", "inj_dominant", "ofi")
t1 <- table1(~ pt_age_yrs + Gender + inj_mechanism + NISS + inj_dominant + ed_sbp_value | ofi, 
             data=as[,vars2], overall = FALSE, render.categorical="FREQ (PCTnoNA%)", render.continuous = my.render.cont)

return(t1)
}
