#creating minor and major trauma column



create_minor_major_trauma <- function(cleaned.data) {
  
  cleaned.data$trauma.severity <- NA
  cleaned.data[cleaned.data$NISS <15, "trauma.severity"] <- "minor"
  cleaned.data[cleaned.data$NISS >=15, "trauma.severity"] <- "major"
  
  
  return(cleaned.data)
  
}

#Lyckas inte göra en funktion så att kolumnen sparas i cleaned.data

#cleaned.data["trauma.severity"] <- cleaned.data$NISS
#minor.trauma <- cleaned.data %>% filter (`Trauma Severity` %in% c(0:14))

#major.trauma <- cleaned.data %>% filter (`Trauma Severity` %in% c(15:75))
