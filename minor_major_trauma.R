#creating minor and major trauma column
library(dplyr)

cleaned.data["Trauma Severity"] <- cleaned.data$NISS

minor.trauma <- cleaned.data %>% filter (`Trauma Severity` %in% c(0:14))

major.trauma <- cleaned.data %>% filter (`Trauma Severity` %in% c(15:75))

#cleaned.data["Minor Trauma"] <- cleaned.data %>% filter (NISS %in% c(1:75)) 

#cleaned.data %>% add_column(newColname = ("Minor Trauma"))