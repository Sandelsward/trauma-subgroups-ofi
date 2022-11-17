## Bellow are functions used for the different cohorts

##########
# Gender #
##########

boot_function_gender <- function(data, index){
  
  ## Set up new dataset
  boot.data <- data[index,]
  
  total.men <- boot.data[boot.data$pt_Gender == 1,1:2]
  all.men <- nrow(total.men)
  
  #antal män med ofi
  ofi.men <- boot.data[boot.data$pt_Gender == 1,1:2]
  total.ofi.men <- ofi.men[ofi.men$ofi =="Yes",]
  nrow(total.ofi.men)
  
  # Frekvens av ofi hos män
  freq.ofi.men = (nrow(total.ofi.men)/nrow(total.men)*100)
  
  # Antal kvinnor
  women <- boot.data[boot.data$pt_Gender == 2,1:2]
  total.women <- nrow(women)
  
  # antal kvinnor med ofi
  ofi.women <- boot.data[boot.data$pt_Gender == 2,1:2]
  df.total.ofi.women <- ofi.women[ofi.women$ofi =="Yes",]
  total.ofi.women <- nrow(df.total.ofi.women)
  
  # frekvens av ofi hos kvinnor
  freq.ofi.women <- ((total.ofi.women)/(total.women)*100)
  
  # Delta frekvens kön
  delta.gender <- (freq.ofi.men)-(freq.ofi.women)
  
  return(c(delta.gender,freq.ofi.women,freq.ofi.men))
}

#####################
# Blunt/penetrating #
#####################
boot_function_inj_type <- function(data, index){
  
  ## Set up new dataset
  boot.data <- data[index,]
  
  #Antal patienter med blunt trauma
  total.blunt <- boot.data[boot.data$inj_dominant == 1,4]
  
  #Antal blunt trauma med ofi
  ofi.blunt <- boot.data[boot.data$inj_dominant == 1,c(2,4)]
  total.ofi.blunt <- ofi.blunt[ofi.blunt$ofi =="Yes",]
  
  #frekvens av ofi hos blunt trauma
  
  freq.ofi.blunt <- (nrow(total.ofi.blunt)/sum(total.blunt)*100)
  
  # Antal patienter med penetrating trauma
  penetrating <- boot.data[boot.data$inj_dominant == 2,c(2,4)]
  
  total.penetrating <- nrow(penetrating)
  
  # Antal penetrerande trauma med ofi
  penetrating <- boot.data[boot.data$inj_dominant == 2,c(2,4)]
  total.ofi.penetrating <- penetrating[penetrating$ofi =="Yes",]
  
  # frekvens av ofi hos penetrerande trauma
  freq.ofi.penetrating <- nrow(total.ofi.penetrating)/(total.penetrating*100)
  
  # delta inj.dominant
  delta.inj.dominant <- freq.ofi.blunt-freq.ofi.penetrating
  
  return(c(freq.ofi.blunt,freq.ofi.penetrating,delta.inj.dominant))
}

#######
# MOI #
#######

boot_function_moi <- function(data, index){
  
  ## Set up new dataset
  boot.data <- data[index,]
  
  #Traumamekanism - alla patienter och ofi-kolumn
  
  inj.mechanism <- boot.data[,c(2,5)]
  
  # Antal patienter från "Traffic - motor veichle accident, not motorcycle" kod 1
  tot.traffic1 <- inj.mechanism[inj.mechanism$inj_mechanism == 1,c(1,2)]
  
  #ofi hos "Traffic - motor veichle accident, not motorcycle" kod 1
  ofi.traffic1 <- tot.traffic1[tot.traffic1$ofi == "Yes",]
  
  # frekvens av ofi hos Traffic - motor veichle accident, not motorcycle" kod 1
  
  freq.ofi.traffic1 = (nrow(ofi.traffic1)/nrow(tot.traffic1)*100)
  
  #Antal pateinter från "Traffic - motorcycle accident" kod 2
  tot.traffic2 <- inj.mechanism[inj.mechanism$inj_mechanism == 2,c(1,2)]
  
  #ofi hos "Traffic - motorcycle accident" kod 2
  ofi.traffic2 <- tot.traffic2[tot.traffic2$ofi == "Yes",]
  
  # frekvens av ofi hos "Traffic - motorcycle accident" kod 2
  freq.ofi.traffic2 = (nrow(ofi.traffic2)/nrow(tot.traffic2)*100)
  
  #Antal patienter från "Traffic - bicycle accident" kod 3
  tot.traffic3 <- inj.mechanism[inj.mechanism$inj_mechanism == 3,c(1,2)]
  
  #ofi hos "Traffic - bicycle accident" kod 3
  ofi.traffic3 <- tot.traffic3[tot.traffic3$ofi == "Yes",]
  
  # frekvens av ofi hos "Traffic - bicycle accident" kod 3
  freq.ofi.traffic3 = (nrow(ofi.traffic3)/nrow(tot.traffic3)*100)
  
  #Antal patienter från "Traffic - pedastrian" kod 4
  tot.traffic4 <- inj.mechanism[inj.mechanism$inj_mechanism == 4,c(1,2)]
  
  #ofi hos "Traffic - pedastrian" kod 4
  ofi.traffic4 <- tot.traffic4[tot.traffic4$ofi == "Yes",]
  
  # frekvens av ofi hos "Traffic - pedastrian" kod 4
  freq.ofi.traffic4 = (nrow(ofi.traffic4)/nrow(tot.traffic4)*100)
  
  # Antal patienter från "Traffic - other" kod 5
  tot.traffic5 <- inj.mechanism[inj.mechanism$inj_mechanism == 5,c(1,2)]
  
  #ofi hos "Traffic - other" kod 5
  ofi.traffic5 <- tot.traffic5[tot.traffic4$ofi == "Yes",]
  
  #frekvens av ofi "Traffic - other" kod 5
  freq.ofi.traffic5 = (nrow(ofi.traffic5)/nrow(tot.traffic5)*100)
  
  # Antal patienter från "Shot by handgun, shotgun, rifle, other firearm of any calibre " kod 6
  tot.shot <- inj.mechanism[inj.mechanism$inj_mechanism == 6,c(1,2)]
  
  #ofi hos  "Shot by handgun, shotgun, rifle, other firearm of any calibre " kod 6
  ofi.shot <- tot.shot[tot.shot$ofi == "Yes",]
  
  #frekvens av ofi hos  "Shot by handgun, shotgun, rifle, other firearm of any calibre " kod 6
  freq.ofi.shot <- (nrow(ofi.shot)/nrow(tot.shot)*100)
  
  #Antal patienter från "Stabbed by knife, sword, dagger other pointed or sharp object" kod 7
  tot.stabbed <- inj.mechanism[inj.mechanism$inj_mechanism == 7,c(1,2)]
  
  #ofi hos "Stabbed by knife, sword, dagger other pointed or sharp object" kod 7
  ofi.stabbed <- tot.stabbed[tot.stabbed$ofi == "Yes",]
  
  #frekvens av ofi hos "Stabbed by knife, sword, dagger other pointed or sharp object" kod 7
  freq.ofi.stabbed <- (nrow(ofi.stabbed)/nrow(tot.stabbed)*100)
  
  #Antal patienter från "Struck or hit by blunt object" kod 8
  tot.struck <- inj.mechanism[inj.mechanism$inj_mechanism == 8,c(1,2)]
  
  #ofi hos Struck or hit by blunt object" kod 8
  ofi.struck <- tot.struck[tot.struck$ofi == "Yes",]
  
  #frekvens av ofi hos Struck or hit by blunt object" kod 8
  freq.ofi.struck <- (nrow(ofi.struck)/nrow(tot.struck)*100)
  
  #Antal patienter från "Low energy fall - fall in the same level" kod 9
  tot.low.energy <- inj.mechanism[inj.mechanism$inj_mechanism == 9,c(1,2)]
  
  #ofi hos "Low energy fall - fall in the same level" kod 9
  ofi.low.energy <- tot.low.energy[tot.low.energy$ofi == "Yes",]
  
  #frekvens av ofi hos "Low energy fall - fall in the same level" kod 9
  freq.ofi.low.energy <- (nrow(ofi.low.energy)/nrow(tot.low.energy)*100)
  
  #Antal patienter från "High energy fall - fall from a higher level" kod 10
  tot.high.energy <- inj.mechanism[inj.mechanism$inj_mechanism == 10,c(1,2)]
  
  #ofi hos "High energy fall - fall from a higher level" kod 10
  ofi.high.energy <- tot.high.energy[tot.high.energy$ofi == "Yes",]
  
  #frekvens av ofi hos "High energy fall - fall from a higher level" kod 10
  freq.ofi.high.energy <- (nrow(ofi.high.energy)/nrow(tot.high.energy)*100)
  
  #Antal patienter från "Blast injury" kod 11
  tot.blast <- inj.mechanism[inj.mechanism$inj_mechanism == 11,c(1,2)]
  
  #ofi hos "Blast injury" kod 11
  ofi.blast <- tot.blast[tot.blast$ofi == "Yes",]
  
  #frekvens av ofi hos "Blast injury" kod 11
  freq.ofi.blast <- (nrow(ofi.blast)/nrow(tot.blast)*100)
  
  #Antal patienter från "Other" kod 12
  tot.other <- inj.mechanism[inj.mechanism$inj_mechanism == 12,c(1,2)]
  
  #ofi hos "Other" kod 12
  ofi.other <- tot.other[tot.other$ofi == "Yes",]
  
  #frekvens av ofi hos "Other" kod 12
  freq.ofi.other <- (nrow(ofi.other)/nrow(tot.other)*100)
  
  ### The different delta values
  delta.mechanism1 <- (freq.ofi.traffic1)-(freq.ofi.traffic2)
  delta.mechanism2 <- (freq.ofi.traffic1)-(freq.ofi.traffic3)
  delta.mechanism3 <- (freq.ofi.traffic1)-(freq.ofi.traffic4)
  delta.mechanism4 <- (freq.ofi.traffic1)-(freq.ofi.traffic5)
  delta.mechanism5 <- (freq.ofi.traffic1)-(freq.ofi.shot)
  delta.mechanism6 <- (freq.ofi.traffic1)-(freq.ofi.stabbed)
  delta.mechanism7 <- (freq.ofi.traffic1)-(freq.ofi.struck)
  delta.mechanism8 <- (freq.ofi.traffic1)-(freq.ofi.low.energy)
  delta.mechanism9 <- (freq.ofi.traffic1)-(freq.ofi.high.energy)
  delta.mechanism10 <- (freq.ofi.traffic1)-(freq.ofi.blast)
  delta.mechanism11 <- (freq.ofi.traffic1)-(freq.ofi.other)
  delta.mechanism12 <- (freq.ofi.traffic2)-(freq.ofi.traffic3)
  delta.mechanism13 <- (freq.ofi.traffic2)-(freq.ofi.traffic4)
  delta.mechanism14 <- (freq.ofi.traffic2)-(freq.ofi.traffic5)
  delta.mechanism15 <- (freq.ofi.traffic2)-(freq.ofi.shot)
  delta.mechanism16 <- (freq.ofi.traffic2)-(freq.ofi.stabbed)
  delta.mechanism17 <- (freq.ofi.traffic2)-(freq.ofi.struck)
  delta.mechanism18 <- (freq.ofi.traffic2)-(freq.ofi.low.energy)
  delta.mechanism18 <- (freq.ofi.traffic2)-(freq.ofi.high.energy)
  delta.mechanism19 <- (freq.ofi.traffic2)-(freq.ofi.blast)
  delta.mechanism20 <- (freq.ofi.traffic2)-(freq.ofi.other)
  delta.mechanism21 <- (freq.ofi.traffic2)-(freq.ofi.other)
  delta.mechanism22 <- (freq.ofi.traffic3)-(freq.ofi.traffic4)
  delta.mechanism23 <- (freq.ofi.traffic3)-(freq.ofi.traffic5)
  delta.mechanism24 <- (freq.ofi.traffic3)-(freq.ofi.shot)
  delta.mechanism25 <- (freq.ofi.traffic3)-(freq.ofi.stabbed)
  delta.mechanism26 <- (freq.ofi.traffic3)-(freq.ofi.struck)
  delta.mechanism27 <- (freq.ofi.traffic3)-(freq.ofi.low.energy)
  delta.mechanism27 <- (freq.ofi.traffic3)-(freq.ofi.high.energy)
  delta.mechanism28 <- (freq.ofi.traffic3)-(freq.ofi.blast)
  delta.mechanism29 <- (freq.ofi.traffic3)-(freq.ofi.other)
  delta.mechanism30 <- (freq.ofi.traffic4)-(freq.ofi.traffic5)
  delta.mechanism31 <- (freq.ofi.traffic4)-(freq.ofi.shot)
  delta.mechanism32 <- (freq.ofi.traffic4)-(freq.ofi.stabbed)
  delta.mechanism33 <- (freq.ofi.traffic4)-(freq.ofi.struck)
  delta.mechanism34 <- (freq.ofi.traffic4)-(freq.ofi.low.energy)
  delta.mechanism35 <- (freq.ofi.traffic4)-(freq.ofi.high.energy)
  delta.mechanism35 <- (freq.ofi.traffic4)-(freq.ofi.blast)
  delta.mechanism36 <- (freq.ofi.traffic4)-(freq.ofi.other)
  delta.mechanism37 <- (freq.ofi.traffic5)-(freq.ofi.shot)
  delta.mechanism38 <- (freq.ofi.traffic5)-(freq.ofi.stabbed)
  delta.mechanism39 <- (freq.ofi.traffic5)-(freq.ofi.struck)
  delta.mechanism40 <- (freq.ofi.traffic5)-(freq.ofi.low.energy)
  delta.mechanism41 <- (freq.ofi.traffic5)-(freq.ofi.high.energy)
  delta.mechanism42 <- (freq.ofi.traffic5)-(freq.ofi.blast)
  delta.mechanism43 <- (freq.ofi.traffic5)-(freq.ofi.other)
  delta.mechanism44 <- (freq.ofi.shot)-(freq.ofi.stabbed)
  delta.mechanism45 <- (freq.ofi.shot)-(freq.ofi.struck)
  delta.mechanism46 <- (freq.ofi.shot)-(freq.ofi.low.energy)
  delta.mechanism47 <- (freq.ofi.shot)-(freq.ofi.high.energy)
  delta.mechanism48 <- (freq.ofi.shot)-(freq.ofi.blast)
  delta.mechanism49 <- (freq.ofi.shot)-(freq.ofi.other)
  delta.mechanism50 <- (freq.ofi.stabbed)-(freq.ofi.struck)
  delta.mechanism51 <- (freq.ofi.stabbed)-(freq.ofi.low.energy)
  delta.mechanism52 <- (freq.ofi.stabbed)-(freq.ofi.high.energy)
  delta.mechanism53 <- (freq.ofi.stabbed)-(freq.ofi.blast)
  delta.mechanism54 <- (freq.ofi.stabbed)-(freq.ofi.other)
  delta.mechanism55 <- (freq.ofi.struck)-(freq.ofi.low.energy)
  delta.mechanism56 <- (freq.ofi.struck)-(freq.ofi.high.energy)
  delta.mechanism57 <- (freq.ofi.struck)-(freq.ofi.blast)
  delta.mechanism58 <- (freq.ofi.struck)-(freq.ofi.other)
  delta.mechanism59 <- (freq.ofi.low.energy)-(freq.ofi.high.energy)
  delta.mechanism60 <- (freq.ofi.low.energy)-(freq.ofi.blast)
  delta.mechanism61 <- (freq.ofi.low.energy)-(freq.ofi.other)
  delta.mechanism62 <- (freq.ofi.high.energy)-(freq.ofi.blast)
  delta.mechanism63 <- (freq.ofi.high.energy)-(freq.ofi.other)
  delta.mechanism64 <- (freq.ofi.blast)-(freq.ofi.other)
  
  return(c(freq.ofi.traffic1,freq.ofi.traffic2,freq.ofi.traffic3,freq.ofi.traffic4,freq.ofi.traffic5,
           freq.ofi.shot,freq.ofi.stabbed,freq.ofi.struck,freq.ofi.low.energy,freq.ofi.high.energy,freq.ofi.blast,freq.ofi.other,
           delta.mechanism1,delta.mechanism2,delta.mechanism3,delta.mechanism4,delta.mechanism5,delta.mechanism6,delta.mechanism7,delta.mechanism8,
           delta.mechanism9,delta.mechanism10,delta.mechanism11,delta.mechanism12,delta.mechanism13,delta.mechanism14,delta.mechanism15,
           delta.mechanism16,delta.mechanism17,delta.mechanism18,delta.mechanism19,delta.mechanism20,delta.mechanism21,delta.mechanism22,
           delta.mechanism23,delta.mechanism24,delta.mechanism25,delta.mechanism26,delta.mechanism27,delta.mechanism28,delta.mechanism29,delta.mechanism30,
           delta.mechanism31,delta.mechanism32,delta.mechanism33,delta.mechanism34,delta.mechanism35,delta.mechanism36,delta.mechanism37,delta.mechanism38,
           delta.mechanism39,delta.mechanism40,delta.mechanism41,delta.mechanism42,delta.mechanism43,delta.mechanism44,delta.mechanism45,delta.mechanism46,
           delta.mechanism47,delta.mechanism48,delta.mechanism49,delta.mechanism50,delta.mechanism51,delta.mechanism52,delta.mechanism53,delta.mechanism54,
           delta.mechanism55,delta.mechanism56,delta.mechanism57,delta.mechanism58,delta.mechanism59,delta.mechanism60,delta.mechanism61,delta.mechanism62,
           delta.mechanism63,delta.mechanism64))
}

#######
# MSR #
#######

boot_function_msr <- function(data, index){
  
  ## Set up new dataset
  boot.data <- data[index,]
  
  #Mest skadade region enligt AIS-koder
  
  most.severe.region.all <- boot.data[,c(2,58)]
  cleaned.most.severe.region <- most.severe.region.all %>% filter (most.severe.region %in% c("Head", "Face","Neck","Thorax","Abdomen","Spine","Upper Extremity","Lower Extremity","Unspecified", "Multiple"))
  
  # Antal patienter med Most severe region (MSR) Head, Neck = ISS Head or neck
  df.head.neck <- cleaned.most.severe.region %>% filter (most.severe.region%in% c("Head", "Neck"))
  tot.head.neck <- nrow(df.head.neck)
  
  # Antal med Head or neck och ofi
  ofi.head.neck.list <- df.head.neck[df.head.neck$ofi == "Yes",]
  ofi.head.neck <- nrow(ofi.head.neck.list)
  
  #frekvens av ofi hos MSR Head or neck. 
  freq.ofi.head.neck <- ((ofi.head.neck)/(tot.head.neck)*100)
  
  
  # Antal patienter med Most severe region (MSR) Face
  df.face <- cleaned.most.severe.region[cleaned.most.severe.region$most.severe.region == "Face",]
  tot.face <- nrow(df.face)
  # Antal med face och ofi
  
  ofi.face.list <- df.face[df.face$ofi == "Yes",]
  ofi.face <- nrow(ofi.face.list)
  
  #frekvens av ofi hos MSR Face
  freq.ofi.face <- ((ofi.face)/(tot.face)*100)
  
  # Antal patienter med Most severe region (MSR) Thorax or spine = ISS Chest, diaphragm or spine
  
  df.chest.spine <- cleaned.most.severe.region %>% filter (most.severe.region%in% c("Thorax", "Spine"))
  
  tot.chest.spine <- nrow(df.chest.spine)
  
  # Antal med chest or spine och ofi
  
  ofi.chest.spine.list <- df.chest.spine[df.chest.spine$ofi == "Yes",]
  ofi.chest.spine <- nrow(ofi.chest.spine.list)
  
  #frekvens av ofi hos MSR Chest or Spine
  freq.ofi.chest.spine <- ((ofi.chest.spine)/(tot.chest.spine)*100)
  
  # Antal patienter med Most severe region Abdomen  = ISS Abdomen
  
  df.abdomen <- cleaned.most.severe.region[cleaned.most.severe.region$most.severe.region == "Abdomen",]
  
  tot.abdomen <- nrow(df.abdomen)
  
  # Antal med abdomen och ofi
  
  ofi.abdomen.list <- df.abdomen[df.abdomen$ofi == "Yes",]
  ofi.abdomen <- nrow(ofi.abdomen.list)
  
  #frekvens av ofi hos MSR abdomen
  freq.ofi.abdomen <- ((ofi.abdomen)/(tot.abdomen)*100)
  
  # Antal patienter med Most severe region Lower or upper extremities = ISS Extremities
  
  df.extremities <- cleaned.most.severe.region %>% filter (most.severe.region%in% c("Lower Extremity", "Upper Extremity"))
  
  tot.extremities <- nrow(df.extremities)
  
  # Antal med extremities och ofi
  ofi.extremities.list <- df.extremities[df.extremities$ofi == "Yes",]
  ofi.extremities <- nrow(ofi.extremities.list)
  
  #frekvens av ofi hos MSR extremities. 
  freq.ofi.extremities <- ((ofi.extremities)/(tot.extremities)*100)
  
  
  # Antal patienter med Most severe region Unspecified
  
  df.unspecified <- cleaned.most.severe.region[cleaned.most.severe.region$most.severe.region == "Unspecified",]
  
  tot.unspecified <- nrow(df.unspecified)
  
  # Antal med unspecified och ofi
  
  ofi.unspecified.list <- df.unspecified[df.unspecified$ofi == "Yes",]
  ofi.unspecified <- nrow(ofi.unspecified.list)
  
  #frekvens av ofi hos MSR unspecified
  #freq.ofi.unspecified <- (ofi.unspecified)/(tot.unspecified)
  freq.ofi.unspecified <- ((ofi.unspecified)/(tot.unspecified)*100)
  
  
  # Antal patienter med Most severe region multiple
  
  df.multiple <- cleaned.most.severe.region[cleaned.most.severe.region$most.severe.region == "Multiple",]
  
  tot.multiple <- nrow(df.multiple)
  
  # Antal med multiple och ofi
  
  ofi.multiple.list <- df.multiple[df.multiple$ofi == "Yes",]
  ofi.multiple <- nrow(ofi.multiple.list)
  
  #frekvens av ofi hos MSR multiple
  #freq.ofi.multiple <- (ofi.multiple)/(tot.multiple)
  
  freq.ofi.multiple<- ((ofi.multiple)/(tot.multiple)*100)
  
  ################ 
  # Delta values #
  ################
  delta.severe.region1 <- (freq.ofi.head.neck)-(freq.ofi.face)
  delta.severe.region2 <- (freq.ofi.head.neck)-(freq.ofi.chest.spine)
  delta.severe.region3 <- (freq.ofi.head.neck)-(freq.ofi.abdomen)
  delta.severe.region4 <- (freq.ofi.head.neck)-(freq.ofi.extremities)
  delta.severe.region5 <- (freq.ofi.head.neck)-(freq.ofi.unspecified)
  delta.severe.region6 <- (freq.ofi.head.neck)-(freq.ofi.multiple)
  delta.severe.region7 <- (freq.ofi.face)-(freq.ofi.chest.spine)
  delta.severe.region8 <- (freq.ofi.face)-(freq.ofi.abdomen)
  delta.severe.region9 <- (freq.ofi.face)-(freq.ofi.extremities)
  delta.severe.region10 <- (freq.ofi.face)-(freq.ofi.unspecified)
  delta.severe.region11 <- (freq.ofi.face)-(freq.ofi.multiple)
  delta.severe.region12 <- (freq.ofi.chest.spine)-(freq.ofi.abdomen)
  delta.severe.region13 <- (freq.ofi.chest.spine)-(freq.ofi.extremities)                                                        
  delta.severe.region14 <- (freq.ofi.chest.spine)-(freq.ofi.unspecified)                                                        
  delta.severe.region15 <- (freq.ofi.chest.spine)-(freq.ofi.multiple)
  delta.severe.region16 <- (freq.ofi.abdomen)-(freq.ofi.extremities)                            
  delta.severe.region17 <- (freq.ofi.abdomen)-(freq.ofi.unspecified) 
  delta.severe.region18 <- (freq.ofi.abdomen)-(freq.ofi.multiple) 
  delta.severe.region19 <- (freq.ofi.extremities)-(freq.ofi.unspecified)     
  delta.severe.region20 <- (freq.ofi.extremities)-(freq.ofi.multiple) 
  delta.severe.region21 <- (freq.ofi.unspecified)-(freq.ofi.multiple) 
  
  return(c(freq.ofi.head.neck,freq.ofi.face,freq.ofi.chest.spine,freq.ofi.abdomen,freq.ofi.extremities,
           freq.ofi.unspecified,freq.ofi.multiple,delta.severe.region1,delta.severe.region2,delta.severe.region3,delta.severe.region4,delta.severe.region5
           ,delta.severe.region6,delta.severe.region7,delta.severe.region8,delta.severe.region9,delta.severe.region10,
           delta.severe.region11,delta.severe.region12,delta.severe.region13,delta.severe.region14,delta.severe.region15,
           delta.severe.region16,delta.severe.region17,delta.severe.region18,delta.severe.region19,delta.severe.region20,delta.severe.region21))
}

###############
# Minor/Major #
###############

##########
# Gender #
##########

boot_function_min_maj <- function(data, index){
  
  ## Set up new dataset
  boot.data <- data[index,]
  # Antal patienter med minor trauma
  
  ##df.minor.trauma <- cleaned.data %>% filter (trauma.severity %in% c("minor")) 
  df.minor.trauma <- boot.data[boot.data$trauma.severity == "minor",]
  
  #df.tot.minor.trauma <- df.minor.trauma[,c(2,59)]
  tot.minor.trauma <- nrow(df.minor.trauma)
  
  #ofi hos minor trauma
  df.ofi.minor.trauma <- df.minor.trauma[df.minor.trauma$ofi == "Yes",]
  ofi.minor.trauma <- nrow(df.ofi.minor.trauma)
  
  # frekvens av ofi hos minor trauma
  freq.ofi.minor.trauma<- ((ofi.minor.trauma)/(tot.minor.trauma)*100)
  
  # Antal patienter med major trauma
  df.major.trauma <- cleaned.data[cleaned.data$trauma.severity == "major",]
  
  #df.tot.major.trauma <- df.major.trauma[,c(2,59)]
  tot.major.trauma <- nrow(df.major.trauma)
  
  #ofi hos major trauma
  df.ofi.major.trauma <- df.major.trauma[df.major.trauma$ofi == "Yes",]
  ofi.major.trauma <- nrow(df.ofi.major.trauma)
  
  # frekvens av ofi hos major trauma
  freq.ofi.major.trauma<- ((ofi.major.trauma)/(tot.major.trauma)*100)
  
  #delta inom minor/major trauma
  
  delta.minor.major.trauma <- (freq.ofi.minor.trauma)-(freq.ofi.major.trauma)
  
  return(c(freq.ofi.minor.trauma,freq.ofi.major.trauma,delta.minor.major.trauma))
}