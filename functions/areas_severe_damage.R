
#### Funktionen får bara matas med en patient i taget! Stoppa in prepare data,
## "AISCode_01" får inte vara NA.
#
# Förslag är:
# data <- prepare_data(merged.data)
# data<-data[complete.cases(data[,c("AISCode_01")]),]
#
# for (i in 1:nrow(data)) {
# print(i)
# test2[i,"area"] <- areas_severe_damage(data[i,])    
# }


areas_severe_damage <- function(data) {
 ### use your functions first

data2 <- ais_first(data)
data3 <- ais_last(data2)



##### Gets the maximum value in the first collumn

# Testa att köra alla koder nedan för att se va de gör.
 # grep("sev", colnames(data3)) Getts all collumns with first in name

# as.numeric(data3[4,grep("fast", colnames(data3))]) = En vector/patient med alla skador. exemplet är pat 4

# max(as.numeric(data3[4,grep("last", colnames(data3))]),na.rm = TRUE)
# Tar fram vilken av ovan som är störst, alltså nr 7 för pat 4 

max <- max(as.numeric(data3[,grep("sev", colnames(data3))]),na.rm = TRUE)

#### Extraherar motsvarande kollumner där .sev == max
cols <- apply(data3[,grep("sev", colnames(data3))] == max, 1, function(x) names(which(x)))

#### byter till motsvarande area namn.
cols.area <- sub('.sev', '.reg', cols)

areas <-data3[,cols.area]
unique.areas <- unique(as.numeric(areas))

if(length(unique.areas) == 1){
  return(unique.areas)
} else {
  
number.areas <- as.data.frame(sort(table(as.numeric(areas)),decreasing=T))
vanlig.area <- number.areas[1,"Freq"]
nr2.area <- number.areas[2,"Freq"]
if(vanlig.area != nr2.area){
  
  samma.area <-  as.numeric(as.character(number.areas[1,"Var1"]))
  
  return(samma.area)
} else { 
  
  ### Nedan missar en kolumn av oklar anledning?
new.cols.reg <- apply(data3[,grep(".reg", colnames(data3))] == as.character(unique.areas), 1, function(x) names(which(x)))
new.cols.area <- as.vector(sub('.reg', '.sev', new.cols.reg))
cols2 <- as.vector(cols)
new.cols.area2 <- new.cols.area[!(new.cols.area %in% cols)]

data4 <- data3[,new.cols.area2]
unique.areas.2 <- unique(as.numeric(data4))

if(length(unique.areas.2) == 1){
  return(as.numeric(unique.areas.2))
} else {

same <- length(unique.areas.2)  
if(same == 0){
  return("multiple")
} else {

  number.areas.multiple <- as.data.frame(sort(table(as.numeric(data4)),decreasing=T))
  vanlig.area.multiple <- number.areas.multiple[1,"Freq"]
  nr2.area.multiple <- number.areas.multiple[2,"Freq"]

  if(vanlig.area.multiple > nr2.area.multiple){
    
    samma.area.multiple <-  as.numeric(as.character(number.areas.multiple[1,"Var1"]))
    
    return(samma.area.multiple)
  } else { 
  
   return("hejåå")
  
}
}
}
}
}
}
