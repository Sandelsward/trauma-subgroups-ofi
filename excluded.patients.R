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

df.total.right.age <- prepared.data %>% filter (pt_age_yrs%in% c(15:120))

total.underage.excluded <- nrow(total.underage)

# Alla patienter i registret utom de som är för unga
total.included.minus.underage <- (unfiltred.patients)-(total.underage.excluded)

# total.gender <- prepared.data[prepared.data$pt_Gender == "NA",c(1,2)]
total.age.excluded <- nrow(total.gender)

# Avsaknad av inj_dominant
only.inj.dominant <- df.total.right.age[,c(1,4)]

total.inj.dominant.999 <- only.inj.dominant %>% filter (inj_dominant%in% c(999))

total.inj.dominant.na <- only.inj.dominant %>% filter (inj_dominant%in% c(NA))

total.missing.inj.dominant <- (nrow(total.inj.dominant.999))+(nrow(total.inj.dominant.na))
# alla patienter som uppfyller ålder och har inj_dominant

df.all.right.age.and.inj.dominant <- df.total.right.age %>% filter (inj_dominant %in% c(1,2))
all.right.age.and.inj.dominant <- nrow(df.all.right.age.and.inj.dominant)


# Avsaknad av inj_mechanism

#only.inj.mechanism <- df.all.right.age.and.inj.dominant[,c(1,5)]

#total.inj.mechanism.999 <- only.inj.mechanism %>% filter (inj_mechanism%in% c(999))

#total.inj.mechanism.na <- only.inj.mechanism %>% filter (inj_mechanism%in% c(NA))

#total.missing.inj.mechanism <- (nrow(total.inj.mechanism.999))+(nrow(total.inj.mechanism.na))
#alla patienter som uppfyller ålder och har inj_dominant och inj_mechanism

#df.age.dominant.mechanism <- df.all.right.age.and.inj.dominant %>% filter (inj_mechanism %in% c(1,2,3,4,5,6,7,8,9,10,11,12))
#age.dominant.mechanism <- nrow(df.age.dominant.mechanism)
# Avsaknad av NISS (finns ej 999)

only.niss <- df.all.right.age.and.inj.dominant[,c(1,6)]
total.niss.na <- only.niss %>% filter (NISS%in% c(NA))
total.missing.niss <- nrow(total.niss.na)


# alla patienter som uppfyller ålder och har inj_dominant och har NISS
df.age.dominant.niss <- df.all.right.age.and.inj.dominant %>% filter (NISS != "NA" )
age.dominant.niss <- nrow(df.age.dominant.niss)

# Avsaknad av kod i AISCode_01
only.ais01 <- df.age.dominant.niss[,c(1,7)]
total.ais01.na <- only.ais01 %>% filter (AISCode_01 %in% c(NA))
total.missing.AIS01 <- nrow(total.ais01.na)

# alla patienter som uppfyller ålder och har inj_dominant och inj_mechanism och har NISS och AIScode01
df.age.dominant.niss.ais01 <- df.age.dominant.niss %>% filter (AISCode_01 != "NA")
age.dominant.niss.ais01 <- nrow(df.age.dominant.niss.ais01)

#Avsaknad av ofi
only.ofi <- df.age.dominant.niss.ais01[,c(1,2)]
total.ofi.na <- only.ofi %>% filter (ofi %in% c(NA))
total.missing.ofi <- nrow(total.ofi.na)




# alla patienter som uppfyller ålder och har inj_dominant och inj_mechanism och har NISS och AIScode01
df.age.dominant.niss.ais01.ofi <- df.age.dominant.niss.ais01 %>% filter (ofi != "NA")
age.dominant.niss.ais01.ofi <- nrow(df.age.dominant.niss.ais01.ofi)

#Exkluderade pga avsaknad av info i most severe region

only.mos <- df.age.dominant.niss.ais01.ofi[,c(1,58)]
total.mos.na <- only.mos %>% filter (most.severe.region %in% c(NA))
total.missing.mos <- nrow(total.mos.na)


# EJ Avsaknad av info i most severe region

df.age.dominant.niss.ais01.ofi.mos <- df.age.dominant.niss.ais01.ofi %>% filter (most.severe.region != "NA")
age.dominant.niss.ais01.ofi.mos <- nrow(df.age.dominant.niss.ais01.ofi.mos)
