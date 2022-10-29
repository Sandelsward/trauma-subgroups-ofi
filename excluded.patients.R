library (dplyr)
#antal pat innan filter
unfiltred.patients <- nrow(prepared.data)
#antal bortfiltrerade patienter
tot.excluded.patients <- (nrow(prepared.data))-(nrow(cleaned.data))

#Antal patienter som filtreras av varje specifik anledning

# Avsaknad av registrerat kön (finns inga med NA)

total.gender <- prepared.data[prepared.data$pt_Gender == "NA",c(1,2)]
total.age.excluded <- nrow(total.gender)

# Patienter under 15 år (finns inga med NA)
only.gender <- prepared.data[,c(1,3)]

total.underage <- only.gender %>% filter (pt_age_yrs%in% c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14)) 

total.underage.excluded <- nrow(total.underage)

# Alla patienter i registret utom de som är för unga
total.included.minus.underage <- (unfiltred.patients)-(total.underage.excluded)

# total.gender <- prepared.data[prepared.data$pt_Gender == "NA",c(1,2)]
total.age.excluded <- nrow(total.gender)

# Avsaknad av inj_dominant
only.inj.dominant <- prepared.data[,c(1,4)]

total.inj.dominant.999 <- only.inj.dominant %>% filter (inj_dominant%in% c(999))

total.inj.dominant.na <- only.inj.dominant %>% filter (inj_dominant%in% c(NA))
  
total.missing.inj.dominant <- (nrow(total.inj.dominant.999))+(nrow(total.inj.dominant.na))
# alla patienter som uppfyller ålder och har inj_dominant
all.right.age.and.inj.dominant <- ((unfiltred.patients)-(total.missing.inj.dominant))

# Avsaknad av inj_mechanism

only.inj.mechanism <- prepared.data[,c(1,5)]

total.inj.mechanism.999 <- only.inj.mechanism %>% filter (inj_mechanism%in% c(999))

total.inj.mechanism.na <- only.inj.mechanism %>% filter (inj_mechanism%in% c(NA))

total.missing.inj.mechanism <- (nrow(total.inj.mechanism.999))+(nrow(total.inj.mechanism.na))
#alla patienter som uppfyller ålder och har inj_dominant och inj_mechanism

age.dominant.mechanism <- (all.right.age.and.inj.dominant)-(total.missing.inj.mechanism)

# Avsaknad av NISS (finns ej 999)

only.niss <- prepared.data[,c(1,6)]
total.niss.na <- only.niss %>% filter (NISS%in% c(NA))
total.missing.niss <- nrow(total.niss.na)

# alla patienter som uppfyller ålder och har inj_dominant och inj_mechanism och har NISS
age.dominant.mechanism.niss <- (age.dominant.mechanism)-(total.missing.niss)

# Avsaknad av kod i AISCode_01
only.ais01 <- prepared.data[,c(1,7)]
total.ais01.na <- only.ais01 %>% filter (AISCode_01 %in% c(NA))
total.missing.AIS01 <- nrow(total.ais01.na)

# alla patienter som uppfyller ålder och har inj_dominant och inj_mechanism och har NISS och AIScode01
age.dominant.mechanism.niss.ais01 <- (age.dominant.mechanism.niss)-(total.missing.AIS01)

#Avsaknad av ofi
only.ofi <- prepared.data[,c(1,2)]
total.ofi.na <- only.ofi %>% filter (ofi %in% c(NA))
total.missing.ofi <- nrow(total.ofi.na)

# alla patienter som uppfyller ålder och har inj_dominant och inj_mechanism och har NISS och AIScode01

age.dominant.mechanism.niss.ais01.ofi <- (age.dominant.mechanism.niss.ais01)-(total.missing.ofi)


