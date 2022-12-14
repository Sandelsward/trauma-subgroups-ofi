# Ränka ut frekvensen av ofi för olika grupper
library(DiagrammeR)
# antal undersökta patienter

total.cohort <- nrow(cleaned.data)

#antal män

total.men <- cleaned.data[cleaned.data$pt_Gender == 1,1:2]
all.men <- nrow(total.men)

share.men <- round(((all.men)/(total.cohort)*100), digits = 2)



#antal män med ofi

ofi.men <- cleaned.data[cleaned.data$pt_Gender == 1,1:2]

total.ofi.men <- ofi.men[ofi.men$ofi =="Yes",]

nrow(total.ofi.men)

# Frekvens av ofi hos män

freq.ofi.men = round((nrow(total.ofi.men)/nrow(total.men)*100), digits = 2)
# Antal kvinnor

women <- cleaned.data[cleaned.data$pt_Gender == 2,1:2]
total.women <- nrow(women)

# antal kvinnor med ofi

ofi.women <- cleaned.data[cleaned.data$pt_Gender == 2,1:2]

df.total.ofi.women <- ofi.women[ofi.women$ofi =="Yes",]
total.ofi.women <- nrow(df.total.ofi.women)

# frekvens av ofi hos kvinnor

freq.ofi.women <- round(((total.ofi.women)/(total.women)*100), digits = 2)

# Delta frekvens kön

delta.gender <- abs((freq.ofi.men)-(freq.ofi.women))



#Antal patienter med blunt trauma

total.blunt <- cleaned.data[cleaned.data$inj_dominant == 1, c(1,4)]
total.blunt.trauma <- nrow(total.blunt)

share.blunt <- round(((total.blunt.trauma)/(total.cohort)*100), digits = 2)
#Antal blunt trauma med ofi

ofi.blunt <- cleaned.data[cleaned.data$inj_dominant == 1,c(2,4)]

total.ofi.blunt <- ofi.blunt[ofi.blunt$ofi =="Yes",]

nrow(total.ofi.blunt)

#frekvens av ofi hos blunt trauma

freq.ofi.blunt <- round((nrow(total.ofi.blunt)/(total.blunt.trauma)*100), digits = 2)


# Antal patienter med penetrating trauma
penetrating <- cleaned.data[cleaned.data$inj_dominant == 2,c(2,4)]

total.penetrating <- nrow(penetrating)

# Antal penetrerande trauma med ofi
penetrating <- cleaned.data[cleaned.data$inj_dominant == 2,c(2,4)]
total.ofi.penetrating <- penetrating[penetrating$ofi =="Yes",]
nrow(total.ofi.penetrating)

# frekvens av ofi hos penetrerande trauma

freq.ofi.penetrating <- round((nrow(total.ofi.penetrating)/(total.penetrating)*100), digits = 2)


# delta inj.dominant

#delta.inj.dominant <- (freq.ofi.blunt)-(freq.ofi.penetrating)

#Traumamekanism - alla patienter och ofi-kolumn


inj.mechanism <- cleaned.data[,c(2,5)]

# Antal patienter från "Traffic - motor veichle accident, not motorcycle" kod 1

tot.traffic1 <- inj.mechanism[inj.mechanism$inj_mechanism == 1,c(1,2)]
nrow(tot.traffic1)

#ofi hos "Traffic - motor veichle accident, not motorcycle" kod 1

ofi.traffic1 <- tot.traffic1[tot.traffic1$ofi == "Yes",]
nrow(ofi.traffic1)

# frekvens av ofi hos Traffic - motor veichle accident, not motorcycle" kod 1

#freq.ofi.traffic1 <- nrow(ofi.traffic1)/nrow(tot.traffic1)

freq.ofi.traffic1 = round((nrow(ofi.traffic1)/nrow(tot.traffic1)*100), digits = 2)

#Antal pateinter från "Traffic - motorcycle accident" kod 2
tot.traffic2 <- inj.mechanism[inj.mechanism$inj_mechanism == 2,c(1,2)]
nrow(tot.traffic2)

#ofi hos "Traffic - motorcycle accident" kod 2
ofi.traffic2 <- tot.traffic2[tot.traffic2$ofi == "Yes",]
nrow(ofi.traffic2)

# frekvens av ofi hos "Traffic - motorcycle accident" kod 2

#freq.ofi.traffic2 <- nrow(ofi.traffic2)/nrow(tot.traffic2)
freq.ofi.traffic2 = round((nrow(ofi.traffic2)/nrow(tot.traffic2)*100), digits = 2)


#Antal patienter från "Traffic - bicycle accident" kod 3

tot.traffic3 <- inj.mechanism[inj.mechanism$inj_mechanism == 3,c(1,2)]
nrow(tot.traffic3)

#ofi hos "Traffic - bicycle accident" kod 3

ofi.traffic3 <- tot.traffic3[tot.traffic3$ofi == "Yes",]
nrow(ofi.traffic3)

# frekvens av ofi hos "Traffic - bicycle accident" kod 3
#freq.ofi.traffic3 <- nrow(ofi.traffic3)/nrow(tot.traffic3)

freq.ofi.traffic3 = round((nrow(ofi.traffic3)/nrow(tot.traffic3)*100), digits = 2)


#Antal patienter från "Traffic - pedastrian" kod 4
tot.traffic4 <- inj.mechanism[inj.mechanism$inj_mechanism == 4,c(1,2)]
nrow(tot.traffic4)

#ofi hos "Traffic - pedastrian" kod 4
ofi.traffic4 <- tot.traffic4[tot.traffic4$ofi == "Yes",]
nrow(ofi.traffic4)

# frekvens av ofi hos "Traffic - pedastrian" kod 4
#freq.ofi.traffic4 <- nrow(ofi.traffic4)/nrow(tot.traffic4)
freq.ofi.traffic4 = round((nrow(ofi.traffic4)/nrow(tot.traffic4)*100), digits = 2)

# Antal patienter från "Traffic - other" kod 5
tot.traffic5 <- inj.mechanism[inj.mechanism$inj_mechanism == 5,c(1,2)]
nrow(tot.traffic5)

#ofi hos "Traffic - other" kod 5
ofi.traffic5 <- tot.traffic5[tot.traffic4$ofi == "Yes",]
nrow(ofi.traffic5)

#frekvens av ofi "Traffic - other" kod 5
#freq.ofi.traffic5 <- nrow(ofi.traffic5)/nrow(tot.traffic5)
freq.ofi.traffic5 = round((nrow(ofi.traffic5)/nrow(tot.traffic5)*100), digits = 2)

# Antal patienter från "Shot by handgun, shotgun, rifle, other firearm of any calibre " kod 6

tot.shot <- inj.mechanism[inj.mechanism$inj_mechanism == 6,c(1,2)]
nrow(tot.shot)

#ofi hos  "Shot by handgun, shotgun, rifle, other firearm of any calibre " kod 6
ofi.shot <- tot.shot[tot.shot$ofi == "Yes",]
nrow(ofi.shot)

#frekvens av ofi hos  "Shot by handgun, shotgun, rifle, other firearm of any calibre " kod 6

freq.ofi.shot <- round((nrow(ofi.shot)/nrow(tot.shot)*100), digits = 2)


#Antal patienter från "Stabbed by knife, sword, dagger other pointed or sharp object" kod 7


tot.stabbed <- inj.mechanism[inj.mechanism$inj_mechanism == 7,c(1,2)]
nrow(tot.stabbed)

#ofi hos "Stabbed by knife, sword, dagger other pointed or sharp object" kod 7

ofi.stabbed <- tot.stabbed[tot.stabbed$ofi == "Yes",]
nrow(ofi.stabbed)

#frekvens av ofi hos "Stabbed by knife, sword, dagger other pointed or sharp object" kod 7

#freq.ofi.stabbed <- nrow(ofi.stabbed)/nrow(tot.stabbed)
freq.ofi.stabbed <- round((nrow(ofi.stabbed)/nrow(tot.stabbed)*100), digits = 2)

#Antal patienter från "Struck or hit by blunt object" kod 8

tot.struck <- inj.mechanism[inj.mechanism$inj_mechanism == 8,c(1,2)]
nrow(tot.struck)

#ofi hos Struck or hit by blunt object" kod 8
ofi.struck <- tot.struck[tot.struck$ofi == "Yes",]
nrow(ofi.struck)

#frekvens av ofi hos Struck or hit by blunt object" kod 8

#freq.ofi.struck <- nrow(ofi.struck)/nrow(tot.struck)
freq.ofi.struck <- round((nrow(ofi.struck)/nrow(tot.struck)*100), digits = 2)


#Antal patienter från "Low energy fall - fall in the same level" kod 9

tot.low.energy <- inj.mechanism[inj.mechanism$inj_mechanism == 9,c(1,2)]
nrow(tot.low.energy)

#ofi hos "Low energy fall - fall in the same level" kod 9
ofi.low.energy <- tot.low.energy[tot.low.energy$ofi == "Yes",]
nrow(ofi.low.energy)

#frekvens av ofi hos "Low energy fall - fall in the same level" kod 9

#freq.ofi.low.energy <- nrow(ofi.low.energy)/nrow(tot.low.energy)
freq.ofi.low.energy <- round((nrow(ofi.low.energy)/nrow(tot.low.energy)*100), digits = 2)

#Antal patienter från "High energy fall - fall from a higher level" kod 10


tot.high.energy <- inj.mechanism[inj.mechanism$inj_mechanism == 10,c(1,2)]
nrow(tot.high.energy)

#ofi hos "High energy fall - fall from a higher level" kod 10
ofi.high.energy <- tot.high.energy[tot.high.energy$ofi == "Yes",]
nrow(ofi.high.energy)

#frekvens av ofi hos "High energy fall - fall from a higher level" kod 10

#freq.ofi.high.energy <- nrow(ofi.high.energy)/nrow(tot.high.energy)
freq.ofi.high.energy <- round((nrow(ofi.high.energy)/nrow(tot.high.energy)*100), digits = 2)

#Antal patienter från "Blast injury" kod 11
tot.blast <- inj.mechanism[inj.mechanism$inj_mechanism == 11,c(1,2)]
nrow(tot.blast)

#ofi hos "Blast injury" kod 11

ofi.blast <- tot.blast[tot.blast$ofi == "Yes",]
nrow(ofi.blast)

#frekvens av ofi hos "Blast injury" kod 11
#freq.ofi.blast <- nrow(ofi.blast)/nrow(tot.blast)
freq.ofi.blast <- round((nrow(ofi.blast)/nrow(tot.blast)*100), digits = 2)
#Antal patienter från "Other" kod 12

tot.other <- inj.mechanism[inj.mechanism$inj_mechanism == 12,c(1,2)]
nrow(tot.other)

#ofi hos "Other" kod 12

ofi.other <- tot.other[tot.other$ofi == "Yes",]
nrow(ofi.other)

#frekvens av ofi hos "Other" kod 12
#freq.ofi.other <- nrow(ofi.other)/nrow(tot.other)
freq.ofi.other <- round((nrow(ofi.other)/nrow(tot.other)*100), digits = 2)


#Mest skadade region enligt AIS-koder

cleaned.most.severe.region <- cleaned.data[,c(2,58)]

nrow(cleaned.most.severe.region)


# Antal patienter med Most severe region (MSR) Head, Neck = ISS Head or neck

df.head.neck <- cleaned.most.severe.region %>% filter (most.severe.region%in% c("Head", "Neck"))

tot.head.neck <- nrow(df.head.neck)

share.head.neck <- round(((tot.head.neck)/(total.cohort)*100), digits = 2)

# Antal med Head or neck och ofi

ofi.head.neck.list <- df.head.neck[df.head.neck$ofi == "Yes",]
ofi.head.neck <- nrow(ofi.head.neck.list)


#frekvens av ofi hos MSR Head or neck. 
freq.ofi.head.neck <- round(((ofi.head.neck)/(tot.head.neck)*100), digits = 2)


# Antal patienter med Most severe region (MSR) Face

df.face <- cleaned.most.severe.region[cleaned.most.severe.region$most.severe.region == "Face",]

tot.face <- nrow(df.face)

# Antal med face och ofi

ofi.face.list <- df.face[df.face$ofi == "Yes",]
ofi.face <- nrow(ofi.face.list)

#frekvens av ofi hos MSR Face
#freq.ofi.face <- (ofi.face)/(tot.face)
freq.ofi.face <- round(((ofi.face)/(tot.face)*100), digits = 2)

# Antal patienter med Most severe region (MSR) Thorax or spine = ISS Chest, diaphragm or spine

df.chest.spine <- cleaned.most.severe.region %>% filter (most.severe.region%in% c("Thorax", "Spine"))

tot.chest.spine <- nrow(df.chest.spine)

# Antal med chest or spine och ofi

ofi.chest.spine.list <- df.chest.spine[df.chest.spine$ofi == "Yes",]
ofi.chest.spine <- nrow(ofi.chest.spine.list)

#frekvens av ofi hos MSR Chest or Spine
#freq.ofi.chest.spine <- (ofi.chest.spine)/(tot.chest.spine)
freq.ofi.chest.spine <- round(((ofi.chest.spine)/(tot.chest.spine)*100), digits = 2)

# Antal patienter med Most severe region Abdomen  = ISS Abdomen

df.abdomen <- cleaned.most.severe.region[cleaned.most.severe.region$most.severe.region == "Abdomen",]

tot.abdomen <- nrow(df.abdomen)

# Antal med abdomen och ofi

ofi.abdomen.list <- df.abdomen[df.abdomen$ofi == "Yes",]
ofi.abdomen <- nrow(ofi.abdomen.list)

#frekvens av ofi hos MSR abdomen
#freq.ofi.abdomen <- (ofi.abdomen)/(tot.abdomen)
freq.ofi.abdomen <- round(((ofi.abdomen)/(tot.abdomen)*100), digits = 2)

# Antal patienter med Most severe region Lower or upper extremities = ISS Extremities

df.extremities <- cleaned.most.severe.region %>% filter (most.severe.region%in% c("Lower Extremity", "Upper Extremity"))

tot.extremities <- nrow(df.extremities)

# Antal med extremities och ofi

ofi.extremities.list <- df.extremities[df.extremities$ofi == "Yes",]
ofi.extremities <- nrow(ofi.extremities.list)


#frekvens av ofi hos MSR extremities. 
#freq.ofi.extremities <- (ofi.extremities)/(tot.extremities)
freq.ofi.extremities <- round(((ofi.extremities)/(tot.extremities)*100), digits = 2)


# Antal patienter med Most severe region Unspecified

df.unspecified <- cleaned.most.severe.region[cleaned.most.severe.region$most.severe.region == "Unspecified",]

tot.unspecified <- nrow(df.unspecified)

# Antal med unspecified och ofi

ofi.unspecified.list <- df.unspecified[df.unspecified$ofi == "Yes",]
ofi.unspecified <- nrow(ofi.unspecified.list)

#frekvens av ofi hos MSR unspecified
#freq.ofi.unspecified <- (ofi.unspecified)/(tot.unspecified)
freq.ofi.unspecified <- round(((ofi.unspecified)/(tot.unspecified)*100), digits = 2)


# Antal patienter med Most severe region multiple

df.multiple <- cleaned.most.severe.region[cleaned.most.severe.region$most.severe.region == "Multiple",]

tot.multiple <- nrow(df.multiple)

# Antal med multiple och ofi

ofi.multiple.list <- df.multiple[df.multiple$ofi == "Yes",]
ofi.multiple <- nrow(ofi.multiple.list)

#frekvens av ofi hos MSR multiple
#freq.ofi.multiple <- (ofi.multiple)/(tot.multiple)

freq.ofi.multiple<- round(((ofi.multiple)/(tot.multiple)*100), digits = 2)
# Antal patienter med minor trauma


##df.minor.trauma <- cleaned.data %>% filter (trauma.severity %in% c("minor")) 
df.minor.trauma <- cleaned.data[cleaned.data$trauma.severity == "minor",]

#df.tot.minor.trauma <- df.minor.trauma[,c(2,59)]

tot.minor.trauma <- nrow(df.minor.trauma)

#ofi hos minor trauma
df.ofi.minor.trauma <- df.minor.trauma[df.minor.trauma$ofi == "Yes",]
ofi.minor.trauma <- nrow(df.ofi.minor.trauma)

# frekvens av ofi hos minor trauma

#freq.ofi.minor.trauma <- (ofi.minor.trauma)/(tot.minor.trauma)
freq.ofi.minor.trauma<- round(((ofi.minor.trauma)/(tot.minor.trauma)*100), digits = 2)

# Antal patienter med major trauma
df.major.trauma <- cleaned.data[cleaned.data$trauma.severity == "major",]

#df.tot.major.trauma <- df.major.trauma[,c(2,59)]
tot.major.trauma <- nrow(df.major.trauma)

share.major.trauma <- round(((tot.major.trauma)/(total.cohort)*100), digits = 2)

#ofi hos major trauma
df.ofi.major.trauma <- df.major.trauma[df.major.trauma$ofi == "Yes",]
ofi.major.trauma <- nrow(df.ofi.major.trauma)

# frekvens av ofi hos major trauma

#freq.ofi.major.trauma <- (ofi.major.trauma)/(tot.major.trauma)
freq.ofi.major.trauma<- round(((ofi.major.trauma)/(tot.major.trauma)*100), digits = 2)

#delta inom minor/major trauma

delta.minor.major.trauma <- abs((freq.ofi.minor.trauma)-(freq.ofi.major.trauma))

#delta inom inj mechanism

delta.mechanism1 <- abs((freq.ofi.traffic1)-(freq.ofi.traffic2))
delta.mechanism2 <- abs((freq.ofi.traffic1)-(freq.ofi.traffic3))
delta.mechanism3 <- abs((freq.ofi.traffic1)-(freq.ofi.traffic4))
delta.mechanism4 <- abs((freq.ofi.traffic1)-(freq.ofi.traffic5))
delta.mechanism5 <- abs((freq.ofi.traffic1)-(freq.ofi.shot))
delta.mechanism6 <- abs((freq.ofi.traffic1)-(freq.ofi.stabbed))
delta.mechanism7 <- abs((freq.ofi.traffic1)-(freq.ofi.struck))
delta.mechanism8 <- abs((freq.ofi.traffic1)-(freq.ofi.low.energy))
delta.mechanism9 <- abs((freq.ofi.traffic1)-(freq.ofi.high.energy))
delta.mechanism10 <- abs((freq.ofi.traffic1)-(freq.ofi.blast))
delta.mechanism11 <- abs((freq.ofi.traffic1)-(freq.ofi.other))
delta.mechanism12 <- abs((freq.ofi.traffic2)-(freq.ofi.traffic3))
delta.mechanism13 <- abs((freq.ofi.traffic2)-(freq.ofi.traffic4))
delta.mechanism14 <- abs((freq.ofi.traffic2)-(freq.ofi.traffic5))
delta.mechanism15 <- abs((freq.ofi.traffic2)-(freq.ofi.shot))
delta.mechanism16 <- abs((freq.ofi.traffic2)-(freq.ofi.stabbed))
delta.mechanism17 <- abs((freq.ofi.traffic2)-(freq.ofi.struck))
delta.mechanism18 <- abs((freq.ofi.traffic2)-(freq.ofi.low.energy))
delta.mechanism18 <- abs((freq.ofi.traffic2)-(freq.ofi.high.energy))
delta.mechanism19 <- abs((freq.ofi.traffic2)-(freq.ofi.blast))
delta.mechanism20 <- abs((freq.ofi.traffic2)-(freq.ofi.other))
delta.mechanism21 <- abs((freq.ofi.traffic2)-(freq.ofi.other))
delta.mechanism22 <- abs((freq.ofi.traffic3)-(freq.ofi.traffic4))
delta.mechanism23 <- abs((freq.ofi.traffic3)-(freq.ofi.traffic5))
delta.mechanism24 <- abs((freq.ofi.traffic3)-(freq.ofi.shot))
delta.mechanism25 <- abs((freq.ofi.traffic3)-(freq.ofi.stabbed))
delta.mechanism26 <- abs((freq.ofi.traffic3)-(freq.ofi.struck))
delta.mechanism27 <- abs((freq.ofi.traffic3)-(freq.ofi.low.energy))
delta.mechanism27 <- abs((freq.ofi.traffic3)-(freq.ofi.high.energy))
delta.mechanism28 <- abs((freq.ofi.traffic3)-(freq.ofi.blast))
delta.mechanism29 <- abs((freq.ofi.traffic3)-(freq.ofi.other))
delta.mechanism30 <- abs((freq.ofi.traffic4)-(freq.ofi.traffic5))
delta.mechanism31 <- abs((freq.ofi.traffic4)-(freq.ofi.shot))
delta.mechanism32 <- abs((freq.ofi.traffic4)-(freq.ofi.stabbed))
delta.mechanism33 <- abs((freq.ofi.traffic4)-(freq.ofi.struck))
delta.mechanism34 <- abs((freq.ofi.traffic4)-(freq.ofi.low.energy))
delta.mechanism35 <- abs((freq.ofi.traffic4)-(freq.ofi.high.energy))
delta.mechanism35 <- abs((freq.ofi.traffic4)-(freq.ofi.blast))
delta.mechanism36 <- abs((freq.ofi.traffic4)-(freq.ofi.other))
delta.mechanism37 <- abs((freq.ofi.traffic5)-(freq.ofi.shot))
delta.mechanism38 <- abs((freq.ofi.traffic5)-(freq.ofi.stabbed))
delta.mechanism39 <- abs((freq.ofi.traffic5)-(freq.ofi.struck))
delta.mechanism40 <- abs((freq.ofi.traffic5)-(freq.ofi.low.energy))
delta.mechanism41 <- abs((freq.ofi.traffic5)-(freq.ofi.high.energy))
delta.mechanism42 <- abs((freq.ofi.traffic5)-(freq.ofi.blast))
delta.mechanism43 <- abs((freq.ofi.traffic5)-(freq.ofi.other))
delta.mechanism44 <- abs((freq.ofi.shot)-(freq.ofi.stabbed))
delta.mechanism45 <- abs((freq.ofi.shot)-(freq.ofi.struck))
delta.mechanism46 <- abs((freq.ofi.shot)-(freq.ofi.low.energy))
delta.mechanism47 <- abs((freq.ofi.shot)-(freq.ofi.high.energy))
delta.mechanism48 <- abs((freq.ofi.shot)-(freq.ofi.blast))
delta.mechanism49 <- abs((freq.ofi.shot)-(freq.ofi.other))
delta.mechanism50 <- abs((freq.ofi.stabbed)-(freq.ofi.struck))
delta.mechanism51 <- abs((freq.ofi.stabbed)-(freq.ofi.low.energy))
delta.mechanism52 <- abs((freq.ofi.stabbed)-(freq.ofi.high.energy))
delta.mechanism53 <- abs((freq.ofi.stabbed)-(freq.ofi.blast))
delta.mechanism54 <- abs((freq.ofi.stabbed)-(freq.ofi.other))
delta.mechanism55 <- abs((freq.ofi.struck)-(freq.ofi.low.energy))
delta.mechanism56 <- abs((freq.ofi.struck)-(freq.ofi.high.energy))
delta.mechanism57 <- abs((freq.ofi.struck)-(freq.ofi.blast))
delta.mechanism58 <- abs((freq.ofi.struck)-(freq.ofi.other))
delta.mechanism59 <- abs((freq.ofi.low.energy)-(freq.ofi.high.energy))
delta.mechanism60 <- abs((freq.ofi.low.energy)-(freq.ofi.blast))
delta.mechanism61 <- abs((freq.ofi.low.energy)-(freq.ofi.other))
delta.mechanism62 <- abs((freq.ofi.high.energy)-(freq.ofi.blast))
delta.mechanism63 <- abs((freq.ofi.high.energy)-(freq.ofi.other))
delta.mechanism64 <- abs((freq.ofi.blast)-(freq.ofi.other))

# Delta inom most severe region

delta.severe.region1 <- abs((freq.ofi.head.neck)-(freq.ofi.face))
delta.severe.region2 <- abs((freq.ofi.head.neck)-(freq.ofi.chest.spine))
delta.severe.region3 <- abs((freq.ofi.head.neck)-(freq.ofi.abdomen))
delta.severe.region4 <- abs((freq.ofi.head.neck)-(freq.ofi.extremities))
delta.severe.region5 <- abs((freq.ofi.head.neck)-(freq.ofi.unspecified))
delta.severe.region6 <- abs((freq.ofi.head.neck)-(freq.ofi.multiple))
delta.severe.region7 <- abs((freq.ofi.face)-(freq.ofi.chest.spine))
delta.severe.region8 <- abs((freq.ofi.face)-(freq.ofi.abdomen))
delta.severe.region9 <- abs((freq.ofi.face)-(freq.ofi.extremities))
delta.severe.region10 <- abs((freq.ofi.face)-(freq.ofi.unspecified))
delta.severe.region11 <- abs((freq.ofi.face)-(freq.ofi.multiple))
delta.severe.region12 <- abs((freq.ofi.chest.spine)-(freq.ofi.abdomen))
delta.severe.region13 <- abs((freq.ofi.chest.spine)-(freq.ofi.extremities))                                                        
delta.severe.region14 <- abs((freq.ofi.chest.spine)-(freq.ofi.unspecified))                                                        
delta.severe.region15 <- abs((freq.ofi.chest.spine)-(freq.ofi.multiple))
delta.severe.region16 <- abs((freq.ofi.abdomen)-(freq.ofi.extremities))                            
delta.severe.region17 <- abs((freq.ofi.abdomen)-(freq.ofi.unspecified)) 
delta.severe.region18 <- abs((freq.ofi.abdomen)-(freq.ofi.multiple)) 
delta.severe.region19 <- abs((freq.ofi.extremities)-(freq.ofi.unspecified))     
delta.severe.region20 <- abs((freq.ofi.extremities)-(freq.ofi.multiple)) 
delta.severe.region21 <- abs((freq.ofi.unspecified)-(freq.ofi.multiple)) 

# Den subgrupp med högst ofi frekvens

max.freq <- (max(freq.ofi.men, freq.ofi.women, freq.ofi.blunt, freq.ofi.penetrating, freq.ofi.traffic1, freq.ofi.traffic2, freq.ofi.traffic3, freq.ofi.traffic4, freq.ofi.traffic5, freq.ofi.shot, freq.ofi.stabbed, freq.ofi.struck, freq.ofi.low.energy, freq.ofi.high.energy, freq.ofi.blast, freq.ofi.other, freq.ofi.head.neck, freq.ofi.face, freq.ofi.chest.spine, freq.ofi.extremities, freq.ofi.abdomen, freq.ofi.multiple))

# Den subgrupp med lägst ofi frekvens

min.freq <- (min(freq.ofi.men, freq.ofi.women, freq.ofi.blunt, freq.ofi.penetrating, freq.ofi.traffic1, freq.ofi.traffic2, freq.ofi.traffic3, freq.ofi.traffic4, freq.ofi.traffic5, freq.ofi.shot, freq.ofi.stabbed, freq.ofi.struck, freq.ofi.low.energy, freq.ofi.high.energy, freq.ofi.blast, freq.ofi.other, freq.ofi.head.neck, freq.ofi.face, freq.ofi.chest.spine, freq.ofi.extremities, freq.ofi.abdomen, freq.ofi.multiple))

# Genomsnittlig ålder hos alla pat

mean.age <- round(mean(cleaned.data$pt_age_yrs))

# Genomsnittlig NISS

mean.niss <- round(mean(cleaned.data$NISS))
sd.niss <- round(sd(cleaned.data$NISS), digits = 2)

# Hur många i hela cohorten som hade OFI

df.ofi.cleaned.data <- cleaned.data[cleaned.data$ofi =="Yes",]
ofi.cleaned.data <- nrow(df.ofi.cleaned.data)

mean.ofi <- round(((((ofi.cleaned.data)/(total.cohort)) * 100)),digits = 2)


####
####

####

