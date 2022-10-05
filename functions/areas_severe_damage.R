
#### Funktionen får bara matas med en patient i taget! Stoppa in prepare data

areas_severe_damage <- function(data) {
 ### use your functions first

data2 <- ais_first(data)
data3 <- ais_last(data2)
##### Gets the maximum value in the first collumn

# Testa att köra alla koder nedan för att se va de gör.
# grep("first", colnames(data3)) Getts all collumns with first in name

# as.numeric(data3[4,grep("fast", colnames(data3))]) = En vector/patient med alla skador. exemplet är pat 4

# max(as.numeric(data3[4,grep("last", colnames(data3))]),na.rm = TRUE)
# Tar fram vilken av ovan som är störst, alltså nr 7 för pat 4 

max <- max(as.numeric(data3[,grep("sev", colnames(data3))]),na.rm = TRUE)

#### Extraherar motsvarande kollumner där .sev == max
cols <- apply(data3[,grep("sev", colnames(data3))] == max, 1, function(x) names(which(x)))

#### byter till motsvarande area namn.
cols.area <- sub('.sev', '.reg', cols)

areas <-data3[,cols.area]
number.areas <- as.data.frame(sort(table(as.numeric(areas)),decreasing=T))

if(length(areas) == 1){
  return(areas)
} else {
  return(number.areas[1,1])
}
}


if ( length(areas) == 1) {
  return(areas)
} else if ( number.areas[1,2]=!number.areas[2,2]) {
  return(number.areas[1,1])
} else if ( number.areas[1,2]=!number.areas[2,2]) {
  return("hejåå")
} else {
  return("hej")
}



number.areas <- sort(table(as.numeric(areas)),decreasing=T)
data <- prepare_data(merged.data)
test <- areas_severe_damage(data = data[4,])



