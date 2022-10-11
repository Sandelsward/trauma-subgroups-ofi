## Import data
data <- import_data(test = TRUE)

## Renaming data sets fo work with merge function

data[['swetrau']] <- data$swetrau_scrambled
data[['fmp']] <- data$fmp_scrambled
data[['atgarder']] <- data$atgarder_scrambled
data[['problem']] <- data$problem_scrambled
data[['kvalgranskning2014.2017']] <- data$kvalgranskning2014.2017_scrambled

merged.data <- merge_data(data)
########
## NYTT


prepared.data <- prepare_data(merged.data)
cleaned.data <- clean_data(prepared.data)
cleaned.data <- ais_last(cleaned.data)
cleaned.data <- ais_first(cleaned.data)
cleaned.data[, 108:157] <- convert_ais_data_to_iss_regions(cleaned.data[, 108:157])

data<-cleaned.data[complete.cases(cleaned.data[,c("AISCode_01")]),]
test2 <- data
test2$area <- NA
for (i in 1:nrow(data)) {
  print(i)
  test2[i,"area"] <- areas_severe_damage(data[i,])
}
table(test2$area)