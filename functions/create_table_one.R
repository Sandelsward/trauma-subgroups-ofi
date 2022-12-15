
create_table_one <- function(cleaned.data) 
  
{
  
  ## Renaming data labels
  
  cleaned.data$pt_Gender <- factor(
    cleaned.data$pt_Gender,
    levels = c(1, 2),
    labels = c("Male", "Female")
  )
  cleaned.data$survival30d <- factor(
     cleaned.data$survival30d,
     levels = c("Yes", "No"),
     labels = c("Deceased", "Alive")
  )   
  
  cleaned.data$most.severe.region <- factor(
    cleaned.data$most.severe.region,
    levels = c("Head", "Neck", "Face", "Thorax", "Spine", "Abdomen", "Lower Extremity", "Upper Extremity", "Unspeciefied", "Multiple"),
    labels = c("Head", "Neck", "Face", "Thorax", "Spine", "Abdomen", "Lower Extremity", "Upper Extremity", "Unspeciefied", "Multiple")
    
    
    
    #cleaned.data$most.severe.region <- factor(
    #  cleaned.data$most.severe.region,
    # levels = c("Head"&"Neck", "Face", "Thorax"&"Spine", "Abdomen", "Lower Extremity"&"Upper Extremity", "Unspeciefied", "Multiple"),
    #  labels = c("Head or Neck", "Face", "Chest, Diaphragm or Spine", "Abdomen", "Extremities", "Unspecified", "Multiple")
  )
 
   cleaned.data$inj_dominant <- factor(
    cleaned.data$inj_dominant,
    levels = c(1, 2),
    labels = c("Blunt", "Penetrating"),
  
  )
  
  
  cleaned.data$trauma.severity <- factor(
    cleaned.data$trauma.severity,
    levels = c("minor", "major"),
    labels = c("Minor Trauma", "Major Trauma"),
  

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
    NISS = "NISS",
    trauma.severity = "Minor or Major Trauma",
    most.severe.region = "The most severely injured body region",
    
    survival30d = "30-day mortality rate"
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
  vars2 <- c("pt_age_yrs", "pt_Gender", "survival30d", "trauma.severity", "inj_dominant", "ofi", "NISS", "most.severe.region")
  table.1 <- table1(~ pt_age_yrs + pt_Gender + NISS + survival30d + inj_dominant + trauma.severity + most.severe.region | ofi, 
                    data=cleaned.data[,vars2], overall = FALSE, render.categorical="FREQ (PCTnoNA%)", render.continuous = my.render.cont)
  
  return(table.1)
}

