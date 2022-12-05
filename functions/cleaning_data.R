
clean_data <- function(prepared.data, numbers = FALSE) {
  cleaned.data <- prepared.data %>% filter (ofi != "NA", pt_age_yrs >= 15, inj_dominant != "NA", inj_dominant != "999",NISS != "NA",pt_Gender != "NA",pt_Gender != "999", AISCode_01 != "NA", most.severe.region != "NA", most.severe.region != "999", res_survival != "NA", res_survival != "999")
  ## Note the added return statement below
  return(cleaned.data)
}

