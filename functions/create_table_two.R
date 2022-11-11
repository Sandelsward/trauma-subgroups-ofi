# Fil för deskrivptiva resultat



create_table_two <- function(cleaned.data) {
  
  ## Renaming data labels
  
  cleaned.data$pt_Gender <- factor(
    cleaned.data$pt_Gender,
    levels = c(1, 2),
    labels = c("Male", "Female")
  )
  
  cleaned.data$inj_mechanism <- factor(
    cleaned.data$inj_mechanism,
    levels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 999),
    labels = c("Traffic - motor veichle accident, not motorcycle", "Traffic - motorcycle accident", "Traffic - bicycle accident", "Traffic - pedastrian", "Traffic - other", "Shot by handgun, shotgun, rifle, other firearm of any calibre ", "Stabbed by knife, sword, dagger other pointed or sharp object", "Struck or hit by blunt object", "Low energy fall - fall in the same level", "High energy fall - fall from a higher level","Blast injury", "Other", "Unknown")
  )
  cleaned.data$most.severe.region <- factor(
    cleaned.data$most.severe.region,
    levels = c("Head", "Neck", "Face", "Thorax", "Spine", "Abdomen", "Lower Extremity", "Upper Extremity", "Unspeciefied", "Multiple"),
    labels = c("Head", "Neck", "Face", "Thorax", "Spine", "Abdomen", "Lower Extremity", "Upper Extremity", "Unspeciefied", "Multiple")
  )
  cleaned.data$trauma.severity <- factor(
    cleaned.data$trauma.severity,
    levels = c("minor", "major"),
    labels = c("Minor Trauma", "Major Trauma"),
  )
  
  cleaned.data$inj_dominant <- factor(
    cleaned.data$inj_dominant,
    levels = c(1, 2),
    labels = c("Blunt", "Penetrating"),
  )
  
  cleaned.data$ofi <- factor(
    cleaned.data$ofi,
    levels = c("Yes", "No"),
    labels = c("Yes, atleast one opportunity for improvement", "No opportunities for improvement"),
  )
  
  
  ## Renaming column labels
  var_label(cleaned.data) <- list (
    pt_age_yrs = "Age (years)",
    pt_Gender = "Gender",
    inj_dominant = "Dominating Type of Injury",
    ofi = "Opportunity for improvement",
    inj_mechanism = "Mechanism of injury",
    NISS = "NISS",
    trauma.severity = "Minor or Major Trauma",
    most.severe.region = "Most severe region"
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
  vars2 <- c("pt_age_yrs", "pt_Gender", "inj_mechanism","trauma.severity", "inj_dominant", "ofi", "NISS", "most.severe.region")
  table.2 <- table1(~ pt_age_yrs + pt_Gender + inj_mechanism + NISS + ofi + inj_dominant + most.severe.region | trauma.severity, 
                    data=cleaned.data[,vars2], overall = FALSE, render.categorical="FREQ (PCTnoNA%)", render.continuous = my.render.cont)
  
  return(table.2)
}