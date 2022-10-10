#converting AIS_first to ISS codes.

#AIS 1, 2, 3 --> Head or neck
#AIS 4, 6 --> Chest, diaphragm and spine
#AIS 5 --> Abdomen or pelvic contents – abdominal organs
#AIS 7, 8 --> Extremities or pelvic girdle – pelvic skeleton
#AIS 9 --> Unspecified

#col 108-157 in cleaned.data = AIS first

#ais_to_iss <- function(cleaned.data) {
  
 # cleaned.data$AISCode_01.first <- factor(
 #  cleaned.data$AISCode_01.first,
   # levels = c(1, 2, 3, 4, 5, 6, 7, 8, 9),
    #labels = c("Head or neck","Head or neck", "Head or neck", "Chest, diaphragm and spine", "Abdomen or pelvic contents and abdominal organs","Chest, diaphragm and spine", "Extremities or pelvic girdle or pelvic skeleton", "Extremities or pelvic girdle or pelvic skeleton", "Unspecified"),
   # return(cleaned.data$AISCode_01.first) 
  #)
  
#}
convert_ais_to_iss_region <- function(ais) {
  iss.region <- factor(ais, levels = 1:9, labels = c("Head or neck","Head or neck", "Head or neck", "Chest, diaphragm and spine", "Abdomen or pelvic contents and abdominal organs","Chest, diaphragm and spine", "Extremities or pelvic girdle or pelvic skeleton", "Extremities or pelvic girdle or pelvic skeleton", "Unspecified"))
  return (iss.region)
}
convert_ais_data_to_iss_regions <- function(ais.data) {
  iss.regions.data <- as.data.frame(do.call(cbind, lapply(ais.data, convert_ais_to_iss_region))) 
  return(iss.regions.data)
}


    
  #}
    