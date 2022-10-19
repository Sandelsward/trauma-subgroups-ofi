
# Funktionen får bara matas med en patient i taget! Stoppa in prepare data,
## "AISCode_01" får inte vara NA.
#
# Förslag är:
# data <- prepare_data(merged.data)
 #data<-data[complete.cases(data[,c("AISCode_01")]),]
#test2 <- data
# test2[,"area"] <- NA
 #for (i in 1:nrow(data)) {
 #print(i)
#test2[i,"area"] <- areas_severe_damage(test2[i,])    
 #}

# data <- prepare_data(merged.data)
# data<-data[complete.cases(data[,c("AISCode_01")]),]
#
# for (i in 1:nrow(data)) {
# print(i)
# test2[i,"area"] <- areas_severe_damage(data[i,])    
# }

areas_severe_damage <- function(data) {
 ### use your functions first
 data <- test2[4,]  #will use this patients as an example below.
  data <- prepared.data[4,]
data2 <- ais_first(data)
data3 <- ais_last(data2)
 

##### Gets the maximum value in the first collumn

# Testa att köra alla koder nedan för att se va de gör.
  grep("sev", colnames(data3))# Gets all columns with "sev" in name - done by ais_last

 #max(as.numeric(data3[4,grep("last", colnames(data3))]),na.rm = TRUE)
 #Tar fram vilken av "sev" kolumnerna som har högsta värde, Alltså 4 (i scramble setet)

max <- max(as.numeric(data3[,grep("sev", colnames(data3))]),na.rm = TRUE)

#### Tar ut de kolumner som har "max" som severity
 # För pat 4:               
#[1,] "AISCode_16.sev"
#[2,] "AISCode_17.sev"
#[3,] "AISCode_20.sev"


cols <- apply(data3[,grep("sev", colnames(data3))] == max, 1, function(x) names(which(x)))

# För att få kolumnnamn med regioner som har max som sev.
cols.area <- sub('.sev', '.reg', cols)
#cols.area för pat 4:
#[1,] "AISCode_16.reg"
#[2,] "AISCode_17.reg"
#[3,] "AISCode_20.reg"

areas <-data3[,cols.area]
# En lista över vilka regioner som finns i col.area
   #AISCode_16.reg AISCode_17.reg AISCode_20.reg
#.  4              4              1              1

unique.areas <- unique(as.numeric(areas))
# en variabel med alla unika regioner, som ni ser ovan så borde det vara 4 och 1
#unique.areas
 #[1] 4 1
# Det betyder alltså att region 4 och 1 har både max (4) som skadegrad och vi måste undersöka dessa djupare

if(length(unique.areas) == 1){ # Bara en region med max = Välj den
 one.area <- as.numeric(unique.areas)
 return(one.area)  
} else {

# Nedan kollar om skadegrad max fanns fler gånger i en region jämfört med en annan.
# Detta blir dock fel (?) Det borde vara region 4 två gånger och region 1 två gånger.  
number.areas <- as.data.frame(sort(table(as.numeric(areas)),decreasing=T))

vanlig.area <- number.areas[1,"Freq"] # I detta fall så blir det två gånger, alltså att reg 4 hade max som skadegrad 2 gånger

nr2.area <- number.areas[2,"Freq"] # Region 1 hade max som skadegrad 1 gång (fel?!?)

if(vanlig.area != nr2.area){ # kollar ena frekvsensen och jämför med andra
  # i patient 4:s fall så returnerar den nu ut region 4 för att den förekom 2 gånger jmf med reg 1 som förekom 1 gång. 
 samma.area <-  as.numeric(as.character(number.areas[1,"Var1"]))
  
 return(samma.area)
} else { 
  
  ### Nedan missar en kolumn av oklar anledning? Samma fel som ovan?
# new.cols.reg tar ut alla columner som tidigare visat sig innehålla "max" i sev. I detta fall alla kollumner med region 1 och 4.  
#new.cols.reg <- apply(data3[,grep(".reg", colnames(data3))] == as.character(unique.areas), 1, function(x) names(which(x)))

#new.cols.area sparar motsvarande skadegrad i alla kolumner från new.cols.reg. Alltså alla skadegrader för område 1 och 4.
new.cols.sev <- as.vector(sub('.reg', '.sev', new.cols.reg))

### Nedan tar bort de kolumner som hade max som skadegrad, men fortfarande hör till 1 och 4.
cols2 <- as.vector(cols) 
new.cols.sev2 <- new.cols.sev[!(new.cols.sev %in% cols2)]

# Hitta den nya maxnivån(alltså under 4, men fortfarande i regione 1 och 2), i detta fall 3
max2 <- max(as.numeric(data3[,new.cols.sev2])) # Error ibland? funktionen funkar dock. fattar ej 100% varför:
max(as.numeric(data3[, new.cols.sev2])) :
#no non-missing arguments to max; returning -Inf

if(length(new.cols.sev2) == 1){ # kollar ena frekvsensen och jämför med andra
  # i patient 4:s fall så returnerar den nu ut region 4 för att den förekom 2 gånger jmf med reg 1 som förekom 1 gång. 
 one.cole.reg <- as.vector(sub('.sev', '.reg', new.cols.sev2))
 one.area <-  as.numeric(data3[,new.cols.sev2])
  
  return(samma.area)
} else { 

# hitta de/den kolumnen med den nya maxnivån. i detta fall:"AISCode_29.sev"
cols.new.max.sev <- apply(data3[,new.cols.sev2] == max2, 1, function(x) names(which(x)))
# Byter till motsvarande region: "AISCode_29.reg"
cols.new.max.reg <- as.vector(sub('.sev', '.reg', cols.new.max.sev))

data4 <- data3[,cols.new.max.reg] 
unique.areas.2 <- unique(as.numeric(data4))

if(length(unique.areas.2) == 1){  # Check if above id:d regions are of the same typ? In that case return that
  return(as.numeric(unique.areas.2))
} else {

same <- length(unique.areas.2)  # I cant remember why this is multiple? i must change this.
if(same == 0){
  return("multiple")
} else {
 # This repeats the process of checking the frequency of the second highest severity in id:d regions.
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
}
