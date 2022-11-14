#Ny data frame för main results. Alla freq of ofi. och subgrupper
#Gör en kolumn med alla frekvenser

#first_column <- c("freq.ofi.men","freq.ofi.women")
#new.df <- data.frame(first_column)

subgruops <- c("Men", "Women", "Blunt Trauma", "Penetraiting Trauma", "Traffic - motor veichle accident, not motorcycle", "Traffic - motorcycle accident", "Traffic - bicycle accident", "Traffic - pedastrian", "Traffic - other", "Shot by handgun, shotgun, rifle, other firearm of any calibre ", "Stabbed by knife, sword, dagger other pointed or sharp object", "Struck or hit by blunt object", "Low energy fall - fall in the same level", "High energy fall - fall from a higher level","Blast injury", "Other", "Minor Trauma", "Major Trauma", "Head or Neck", "Face", "Chest, Diaphragm or Spine", "Abdomen", "Extremities", "Unspecified", "Multiple")
frequency.of.ofi <- c(freq.ofi.men, freq.ofi.women, freq.ofi.blunt, freq.ofi.penetrating, freq.ofi.traffic1, freq.ofi.traffic2, freq.ofi.traffic3, freq.ofi.traffic4, freq.ofi.traffic5, freq.ofi.shot, freq.ofi.stabbed, freq.ofi.struck, freq.ofi.low.energy, freq.ofi.high.energy, freq.ofi.blast, freq.ofi.other, freq.ofi.minor.trauma, freq.ofi.major.trauma, freq.ofi.head.neck, freq.ofi.face, freq.ofi.chest.spine, freq.ofi.abdomen, freq.ofi.extremities, freq.ofi.unspecified, freq.ofi.multiple)

df.ofi.frequency <- data.frame(subgruops, frequency.of.ofi)

print (df.ofi.frequency)

#freq.ofi.men, freq.ofi.women, freq.ofi.blunt, freq.ofi.penetrating, freq.ofi.traffic1, freq.ofi.traffic2, freq.ofi.traffic3, freq.ofi.traffic4, freq.ofi.traffic5, freq.ofi.shot, freq.ofi.stabbed, freq.ofi.struck, freq.ofi.low.energy, freq.ofi.high.energy, freq.ofi.blast, freq.ofi.other, freq.ofi.minor.trauma, freq.ofi.major.trauma, freq.ofi.head.neck, freq.ofi.face, freq.ofi.chest.spine, freq.ofi.abdomen, freq.ofi.extremities, freq.ofi.unspecified, freq.ofi.multiple