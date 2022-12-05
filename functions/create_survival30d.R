# För att lägga till res_survival som sista kolumn i merged data


create_survuval30d <- function(cleaned.data) {

cleaned.data$survival30d <- NA

cleaned.data[cleaned.data$res_survival <2, "survival30d"] <- "Yes"
cleaned.data[cleaned.data$res_survival >1, "survival30d"] <- "No"

return(cleaned.data)

}
#cleaned.data$survival30d <- cleaned.data$res_survival