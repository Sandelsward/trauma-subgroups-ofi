
clean_data <- function(prepared.data, numbers = FALSE)
cleaned.data <- prepared.data %>% filter (ofi != "NA", pt_age_yrs >= 15, inj_dominant != "NA", inj_dominant != "999", inj_mechanism != "999", inj_mechanism != "NA",NISS != "NA",pt_Gender != "NA")




