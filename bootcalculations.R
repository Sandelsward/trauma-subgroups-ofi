#install.packages("boot") # need to install boot
library("boot") # load boot
source("functions/bootfunctions.R")

### data = datan du stoppar in, statistic = funktionen som genererar resultat, R= antalet körningar. 
boot_out_gender <- boot(data=cleaned.data, statistic = boot_function_gender,R = 10)
boot_out_inj_type <- boot(data=cleaned.data, statistic = boot_function_gender,R = 10)
boot_out_moi <- boot(data=cleaned.data, statistic = boot_function_moi,R = 10)
boot_out_msr <- boot(data=cleaned.data, statistic = boot_function_msr,R = 10)
boot_out_min_maj <- boot(data=cleaned.data, statistic = boot_function_min_maj,R = 10)

#### The output from the function boot contains all vectors that you want CI from but its hard to find the one you want,
# You need to specify index. For example above: index=1 (delta.gender), index=2(freq.ofi.vomen) and so on. 
#ci.gender.vomen <- boot.ci(boot.out = boot_out_gender, conf = 0.95, type=c("norm"),index=2) # CI for freq.ofi.vomen

ci.gender.woman <- boot.ci(boot.out = boot_out_gender, conf = 0.95, type=c("norm"),index=2)
ci.gender.man<- boot.ci(boot.out = boot_out_gender, conf = 0.95, type=c("norm"),index=3)
# You get the real value (not CI) via ci.gender.vomen[["t0"]]

ci.inj.penetrating <- boot.ci(boot.out = boot_out_inj_type, conf = 0.95, type=c("norm"),index=2) # CI for freq.ofi.penetrating
ci.inj.blunt <- boot.ci(boot.out = boot_out_inj_type, conf = 0.95, type=c("norm"),index=1)

#harder example, lets get delta value for (freq.ofi.traffic5)-(freq.ofi.struck) = delta.mechanism39.
#then you need to have index 39 + 12 (number of MOI) = 51
ci.inj.moi <- boot.ci(boot.out = boot_out_moi, conf = 0.95, type=c("norm"),index=51)

# minor major trauma
ci.min <- boot.ci(boot.out = boot_out_min_maj, conf = 0.95, type=c("norm"),index=1)
#ci.maj <- boot.ci(boot.out = boot_out_min_maj, conf = 0.95, type=c("norm"),index=2)

# Example for MSR: delta.severe.region7 <- (freq.ofi.face)-(freq.ofi.chest.spine) need index 14: 7(number of regions) + 7(sorted as delta value 7) = 14
ci.inj.msr.ofi.head.neck <- boot.ci(boot.out = boot_out_msr, conf = 0.95, type=c("norm"),index=1)
#ci.inj.msr.ofi.head.face <- boot.ci(boot.out = boot_out_msr, conf = 0.95, type=c("norm"),index=2)
ci.inj.msr.ofi.chest.spine <- boot.ci(boot.out = boot_out_msr, conf = 0.95, type=c("norm"),index=3)
ci.inj.msr.ofi.abdomen <- boot.ci(boot.out = boot_out_msr, conf = 0.95, type=c("norm"),index=4)
ci.inj.msr.ofi.extremities <- boot.ci(boot.out = boot_out_msr, conf = 0.95, type=c("norm"),index=5)
#ci.inj.msr.ofi.unspecified <- boot.ci(boot.out = boot_out_msr, conf = 0.95, type=c("norm"),index=6)
ci.inj.msr.ofi.multiple <- boot.ci(boot.out = boot_out_msr, conf = 0.95, type=c("norm"),index=7)

# you then get the exact CI via: ci.gender.vomen[["normal"]] where ci.gender.vomen[["normal"]][1] is 95%, ci.gender.vomen[["normal"]][2] lower CI, ci.gender.vomen[["normal"]][3] higher CI
# you can paste them togeter:

#delta.freq.vomen <- paste(round(ci.gender.vomen[["t0"]], digits = 2),"(",round(ci.gender.vomen[["normal"]][2], digits = 2),"-",round(ci.gender.vomen[["normal"]][3], digits = 2),")")
#delta.freq.vomen

#ofi.freq.head.conf.och det.riktiga <- paste(round(ci.inj.msr[["t0"]], digits = 2),"(",round(ci.inj.msr[["normal"]][2], digits = 2),"-",round(ci.inj.msr[["normal"]][3], digits = 2),")")

#delta.head.face <- paste(round(ci.gender.vomen[["t0"]], digits = 2),"(",round(ci.gender.vomen[["normal"]][2], digits = 2),"-",round(ci.gender.vomen[["normal"]][3], digits = 2),")")

#ci.men <- paste("(",round(ci.gender.vomen[["normal"]][2], digits = 2),"-",round(ci.gender.vomen[["normal"]][3], digits = 2),")")

# HÄR UNDER CI FÖR OFI FREKVENS
ci.men <- paste("(",round(ci.gender.man[["normal"]][2], digits = 2),"-",round(ci.gender.man[["normal"]][3], digits = 2),")")
ci.women <- paste("(",round(ci.gender.woman [["normal"]][2], digits = 2),"-",round(ci.gender.woman [["normal"]][3], digits = 2),")")
ci.blunt <- paste("(",round(ci.inj.blunt[["normal"]][2], digits = 2),"-",round(ci.inj.blunt[["normal"]][3], digits = 2),")")
ci.penetrating <- paste("(",round(ci.inj.penetrating[["normal"]][2], digits = 2),"-",round(ci.inj.penetrating[["normal"]][3], digits = 2),")")
ci.minor.trauma <- paste("(",round(ci.min[["normal"]][2], digits = 2),"-",round(ci.min[["normal"]][3], digits = 2),")")
#ci.major.trauma <- paste("(",round(ci.maj[["normal"]][2], digits = 2),"-",round(ci.maj[["normal"]][3], digits = 2),")")
ci.head.neck <- paste("(",round(ci.inj.msr.ofi.head.neck[["normal"]][2], digits = 2),"-",round(ci.inj.msr.ofi.head.neck[["normal"]][3], digits = 2),")")
#ci.face <- paste("(",round(ci.inj.msr.ofi.head.face[["normal"]][2], digits = 2),"-",round(ci.inj.msr.ofi.head.face[["normal"]][3], digits = 2),")")
ci.chest.spine <- paste("(",round(ci.inj.msr.ofi.chest.spine[["normal"]][2], digits = 2),"-",round(ci.inj.msr.ofi.chest.spine[["normal"]][3], digits = 2),")")
ci.abdomen <- paste("(",round(ci.inj.msr.ofi.abdomen[["normal"]][2], digits = 2),"-",round(ci.inj.msr.ofi.abdomen[["normal"]][3], digits = 2),")")
ci.extremities <- paste("(",round(ci.inj.msr.ofi.extremities[["normal"]][2], digits = 2),"-",round(ci.inj.msr.ofi.extremities[["normal"]][3], digits = 2),")")
#ci.unspecified <- paste("(",round(ci.inj.msr.ofi.unspecified[["normal"]][2], digits = 2),"-",round(ci.inj.msr.ofi.unspecified[["normal"]][3], digits = 2),")")
ci.multiple <- paste("(",round(ci.inj.msr.ofi.multiple[["normal"]][2], digits = 2),"-",round(ci.inj.msr.ofi.multiple[["normal"]][3], digits = 2),")")

