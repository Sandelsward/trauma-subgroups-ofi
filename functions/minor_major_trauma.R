#creating minor and major trauma column



create_minor_major_trauma <- function(cleaned.data) {

cleaned.data["trauma.severity"] <- cleaned.data$NISS

minor.trauma <- cleaned.data %>% filter (`trauma.severity` %in% c(0:14))

major.trauma <- cleaned.data %>% filter (`trauma.severity` %in% c(15:75))

return(cleaned.data)

}

#Lyckas inte göra en funktion så att kolumnen sparas i cleaned.data


#minor.trauma <- cleaned.data %>% filter (`Trauma Severity` %in% c(0:14))

#major.trauma <- cleaned.data %>% filter (`Trauma Severity` %in% c(15:75))