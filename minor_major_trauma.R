#creating minor and major trauma column




cleaned.data["Trauma Severity"] <- cleaned.data$NISS

minor.trauma <- cleaned.data %>% filter (`Trauma Severity` %in% c(0:14))

major.trauma <- cleaned.data %>% filter (`Trauma Severity` %in% c(15:75))


#Lyckas inte göra en funktion så att kolumnen sparas i cleaned.data
