# Ränka ut frekvensen av ofi för olika grupper

# antal undersökta patienter
 
total.cohort <- nrow(cleaned.data)

#antal män

total.men <- cleaned.data[cleaned.data$pt_Gender == 1,1:2]
all.men <- nrow(total.men)

#antal män med ofi

ofi.men <- cleaned.data[cleaned.data$pt_Gender == 1,1:2]

total.ofi.men <- ofi.men[ofi.men$ofi =="Yes",]

nrow(total.ofi.men)

# Frekvens av ofi hos män

freq.ofi.men <- nrow(total.ofi.men)/nrow(total.men)

# Antal kvinnor

women <- cleaned.data[cleaned.data$pt_Gender == 2,1:2]
total.women <- nrow(women)

# antal kvinnor med ofi

ofi.women <- cleaned.data[cleaned.data$pt_Gender == 2,1:2]

total.ofi.women <- ofi.women[ofi.women$ofi =="Yes",]
nrow(total.ofi.women)

# frekvens av ofi hos kvinnor

freq.ofi.women = nrow(total.ofi.women)/sum(total.women)

# Delta frekvens kön

delta.gender <- abs((freq.ofi.men)-(freq.ofi.women))



#Antal patienter med blunt trauma

total.blunt <- cleaned.data[cleaned.data$inj_dominant == 1,4]
sum(total.blunt)

#Antal blunt trauma med ofi

ofi.blunt <- cleaned.data[cleaned.data$inj_dominant == 1,c(2,4)]

total.ofi.blunt <- ofi.blunt[ofi.blunt$ofi =="Yes",]

nrow(total.ofi.blunt)

#frekvens av ofi hos blunt trauma

freq.ofi.blunt <- nrow(total.ofi.blunt)/sum(total.blunt)

# Antal patienter med penetrating trauma
penetrating <- cleaned.data[cleaned.data$inj_dominant == 2,c(2,4)]

total.penetrating <- nrow(penetrating)

# Antal penetrerande trauma med ofi
penetrating <- cleaned.data[cleaned.data$inj_dominant == 2,c(2,4)]
total.ofi.penetrating <- penetrating[penetrating$ofi =="Yes",]
nrow(total.ofi.penetrating)

# frekvens av ofi hos penetrerande trauma

freq.ofi.penetrating <- nrow(total.ofi.penetrating)/(total.penetrating)

# delta inj.dominant

delta.inj.dominant <- abs((freq.ofi.blunt)-(freq.ofi.penetrating))

#Traumamekanism - alla patienter och ofi-kolumn


inj.mechanism <- cleaned.data[,c(2,5)]

# Antal patienter från "Traffic - motor veichle accident, not motorcycle" kod 1

tot.traffic1 <- inj.mechanism[inj.mechanism$inj_mechanism == 1,c(1,2)]
nrow(tot.traffic1)

#ofi hos "Traffic - motor veichle accident, not motorcycle" kod 1

ofi.traffic1 <- tot.traffic1[tot.traffic1$ofi == "Yes",]
nrow(ofi.traffic1)

# frekvens av ofi hos Traffic - motor veichle accident, not motorcycle" kod 1

freq.ofi.traffic1 <- nrow(ofi.traffic1)/nrow(tot.traffic1)

#Antal pateinter från "Traffic - motorcycle accident" kod 2
tot.traffic2 <- inj.mechanism[inj.mechanism$inj_mechanism == 2,c(1,2)]
nrow(tot.traffic2)

#ofi hos "Traffic - motorcycle accident" kod 2
ofi.traffic2 <- tot.traffic2[tot.traffic2$ofi == "Yes",]
nrow(ofi.traffic2)

# frekvens av ofi hos "Traffic - motorcycle accident" kod 2

freq.ofi.traffic2 <- nrow(ofi.traffic2)/nrow(tot.traffic2)


#Antal patienter från "Traffic - bicycle accident" kod 3

tot.traffic3 <- inj.mechanism[inj.mechanism$inj_mechanism == 3,c(1,2)]
nrow(tot.traffic3)

#ofi hos "Traffic - bicycle accident" kod 3

ofi.traffic3 <- tot.traffic3[tot.traffic3$ofi == "Yes",]
nrow(ofi.traffic3)

# frekvens av ofi hos "Traffic - bicycle accident" kod 3
freq.ofi.traffic3 <- nrow(ofi.traffic3)/nrow(tot.traffic3)

#Antal patienter från "Traffic - pedastrian" kod 4
tot.traffic4 <- inj.mechanism[inj.mechanism$inj_mechanism == 4,c(1,2)]
nrow(tot.traffic4)

#ofi hos "Traffic - pedastrian" kod 4
ofi.traffic4 <- tot.traffic4[tot.traffic4$ofi == "Yes",]
nrow(ofi.traffic4)

# frekvens av ofi hos "Traffic - pedastrian" kod 4
freq.ofi.traffic4 <- nrow(ofi.traffic4)/nrow(tot.traffic4)

# Antal patienter från "Traffic - other" kod 5
tot.traffic5 <- inj.mechanism[inj.mechanism$inj_mechanism == 5,c(1,2)]
nrow(tot.traffic5)

#ofi hos "Traffic - other" kod 5
ofi.traffic5 <- tot.traffic5[tot.traffic4$ofi == "Yes",]
nrow(ofi.traffic5)

#frekvens av ofi "Traffic - other" kod 5
freq.ofi.traffic5 <- nrow(ofi.traffic5)/nrow(tot.traffic5)

# Antal patienter från "Shot by handgun, shotgun, rifle, other firearm of any calibre " kod 6

tot.shot <- inj.mechanism[inj.mechanism$inj_mechanism == 6,c(1,2)]
nrow(tot.shot)

#ofi hos  "Shot by handgun, shotgun, rifle, other firearm of any calibre " kod 6
ofi.shot <- tot.shot[tot.shot$ofi == "Yes",]
nrow(ofi.shot)

#frekvens av ofi hos  "Shot by handgun, shotgun, rifle, other firearm of any calibre " kod 6

freq.ofi.shot <- nrow(ofi.shot)/nrow(tot.shot)

#Antal patienter från "Stabbed by knife, sword, dagger other pointed or sharp object" kod 7


tot.stabbed <- inj.mechanism[inj.mechanism$inj_mechanism == 7,c(1,2)]
nrow(tot.stabbed)

#ofi hos "Stabbed by knife, sword, dagger other pointed or sharp object" kod 7

ofi.stabbed <- tot.stabbed[tot.stabbed$ofi == "Yes",]
nrow(ofi.stabbed)

#frekvens av ofi hos "Stabbed by knife, sword, dagger other pointed or sharp object" kod 7

freq.ofi.stabbed <- nrow(ofi.stabbed)/nrow(tot.stabbed)

#Antal patienter från "Struck or hit by blunt object" kod 8

tot.struck <- inj.mechanism[inj.mechanism$inj_mechanism == 8,c(1,2)]
nrow(tot.struck)

#ofi hos Struck or hit by blunt object" kod 8
ofi.struck <- tot.struck[tot.struck$ofi == "Yes",]
nrow(ofi.struck)

#frekvens av ofi hos Struck or hit by blunt object" kod 8

freq.ofi.struck <- nrow(ofi.struck)/nrow(tot.struck)

#Antal patienter från "Low energy fall - fall in the same level" kod 9

tot.low.energy <- inj.mechanism[inj.mechanism$inj_mechanism == 9,c(1,2)]
nrow(tot.low.energy)

#ofi hos "Low energy fall - fall in the same level" kod 9
ofi.low.energy <- tot.low.energy[tot.low.energy$ofi == "Yes",]
nrow(ofi.low.energy)

#frekvens av ofi hos "Low energy fall - fall in the same level" kod 9

freq.ofi.low.energy <- nrow(ofi.low.energy)/nrow(tot.low.energy)

#Antal patienter från "High energy fall - fall from a higher level" kod 10


tot.high.energy <- inj.mechanism[inj.mechanism$inj_mechanism == 10,c(1,2)]
nrow(tot.high.energy)

#ofi hos "High energy fall - fall from a higher level" kod 10
ofi.high.energy <- tot.high.energy[tot.high.energy$ofi == "Yes",]
nrow(ofi.high.energy)

#frekvens av ofi hos "High energy fall - fall from a higher level" kod 10

freq.ofi.high.energy <- nrow(ofi.high.energy)/nrow(tot.high.energy)

#Antal patienter från "Blast injury" kod 11
tot.blast <- inj.mechanism[inj.mechanism$inj_mechanism == 11,c(1,2)]
nrow(tot.blast)

#ofi hos "Blast injury" kod 11

ofi.blast <- tot.blast[tot.blast$ofi == "Yes",]
nrow(ofi.blast)

#frekvens av ofi hos "Blast injury" kod 11
freq.ofi.blast <- nrow(ofi.blast)/nrow(tot.blast)

#Antal patienter från "Other" kod 12

tot.other <- inj.mechanism[inj.mechanism$inj_mechanism == 12,c(1,2)]
nrow(tot.other)

#ofi hos "Other" kod 12

ofi.other <- tot.other[tot.other$ofi == "Yes",]
nrow(ofi.other)

#frekvens av ofi hos "Other" kod 12
freq.ofi.other <- nrow(ofi.other)/nrow(tot.other)

#Mest skadade region

most.dammaged.region.all <- cleaned.data[,c(2,58)]

# Antal patienter med Most severe region (MSR) Head

df.head <- most.dammaged.region.all[most.dammaged.region.all$most.severe.region == "Head",]

tot.head <- nrow(df.head)

# Antal med huvudskada och ofi

ofi.head.list <- df.head[df.head$ofi == "Yes",]
ofi.head <- nrow(ofi.head.list)

#frekvens av ofi hos MSR Head


           #"Head",
          # "Face",
          # "Neck",
          # "Thorax",
          # "Abdomen",
         #  "Spine",
         #  "Upper Extremity",
          # "Lower Extremity",
         #  "Unspecified",
         #  "Multiple"))


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
delta.mechanism63 <- abs((freq.ofi.blast)-(freq.ofi.other))





