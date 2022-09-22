prepare_data <- function(data) {
  data$ofi <- create_ofi(data)
  all.ais <- data[, 153:203]
  small.data <- data[,c( "Gender","ofi", "pt_age_yrs","inj_dominant", "inj_mechanism")]
  all.subgroups <- cbind(small.data, all.ais)
  return(all.subgroups)
}