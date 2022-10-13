# Ränka ut frekvensen av ofi för olika grupper

# antal undersökta patienter
 
total.cohort <- nrow(test2)

#antal män

total.men <- test2[test2$pt_Gender == 1,1:2]
nrow(total.men)

#antal män med ofi

ofi.men <- test2[test2$pt_Gender == 1,1:2]

total.ofi.men <- ofi.men[ofi.men$ofi =="Yes",]

nrow(total.ofi.men)

# Frekvens av ofi hos män

freq.ofi.men <- nrow(total.ofi.men)/nrow(total.men)

# Antal kvinnor

women <- test2[test2$pt_Gender == 2,1:2]
total.women <- nrow(women)

# antal kvinnor med ofi

ofi.women <- test2[test2$pt_Gender == 2,1:2]

total.ofi.women <- ofi.women[ofi.women$ofi =="Yes",]
nrow(total.ofi.women)

# frekvens av ofi hos kvinnor

freq.ofi.women = nrow(total.ofi.women)/sum(total.women)

#Antal patienter med blunt trauma

total.blunt <- test2[test2$inj_dominant == 1,4]
sum(total.blunt)

#Antal blunt trauma med ofi

ofi.blunt <- test2[test2$inj_dominant == 1,c(2,4)]

total.ofi.blunt <- ofi.blunt[ofi.blunt$ofi =="Yes",]

nrow(total.ofi.blunt)

#frekvens av ofi hos blunt trauma

freq.ofi.blunt <- nrow(total.ofi.blunt)/sum(total.blunt)

# Antal patienter med penetrating trauma
penetrating <- test2[test2$inj_dominant == 2,c(2,4)]

total.penetrating <- nrow(penetrating)

# Antal penetrerande trauma med ofi
penetrating <- test2[test2$inj_dominant == 2,c(2,4)]
total.ofi.penetrating <- penetrating[penetrating$ofi =="Yes",]
nrow(total.ofi.penetrating)

# frekvens av ofi hos penetrerande trauma

freq.ofi.penetrating <- nrow(total.ofi.penetrating)/(total.penetrating)

#Traumamekanism - alla patienter och ofi-kolumn

inj.mechanism <- test2[,c(2,5)]

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
