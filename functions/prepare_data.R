prepare_data <- function(data) {
  data$ofi <- create_ofi(data)
  all.ais <- data[, 153:203]
  small.data <- data[,c( "pt_Gender","ofi", "pt_age_yrs","inj_dominant", "inj_mechanism", "NISS")]
  all.subgroups <- cbind(small.data, all.ais)
  return(all.subgroups)
}



