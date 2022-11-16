#install.packages("boot") # need to install boot
library("boot") # load boot
source("functions/boot_function.R")

### data = datan du stoppar in, statistic = funktionen som genererar resultat, R= antalet körningar. 
boot_out_gender <- boot(data=cleaned.data, statistic = boot_function_gender,R = 1000)
boot_out_inj_type <- boot(data=cleaned.data, statistic = boot_function_gender,R = 1000)
boot_out_moi <- boot(data=cleaned.data, statistic = boot_function_moi,R = 1000)
boot_out_msr <- boot(data=cleaned.data, statistic = boot_function_msr,R = 1000)
boot_out_min_maj <- boot(data=cleaned.data, statistic = boot_function_min_maj,R = 1000)

#### The output from the function boot contains all vectors that you want CI from but its hard to find the one you want,
# You need to specify index. For example above: index=1 (delta.gender), index=2(freq.ofi.vomen) and so on. 
ci.gender.vomen <- boot.ci(boot.out = boot_out_gender, conf = 0.95, type=c("norm"),index=2) # CI for freq.ofi.vomen

# You get the real value (not CI) via ci.gender.vomen[["t0"]]

ci.inj.type <- boot.ci(boot.out = boot_out_gender, conf = 0.95, type=c("norm"),index=2) # CI for freq.ofi.penetrating

#harder example, lets get delta value for (freq.ofi.traffic5)-(freq.ofi.struck) = delta.mechanism39.
#then you need to have index 39 + 12 (number of MOI) = 51
ci.inj.moi <- boot.ci(boot.out = boot_out_moi, conf = 0.95, type=c("norm"),index=51)

# Example for MSR: delta.severe.region7 <- (freq.ofi.face)-(freq.ofi.chest.spine) need index 14: 7(number of regions) + 7(sorted as delta value 7) = 14
ci.inj.msr <- boot.ci(boot.out = boot_out_msr, conf = 0.95, type=c("norm"),index=14)

# you then get the exact CI via: ci.gender.vomen[["normal"]] where ci.gender.vomen[["normal"]][1] is 95%, ci.gender.vomen[["normal"]][2] lower CI, ci.gender.vomen[["normal"]][3] higher CI
# you can paste them togeter:

delta.freq.vomen <- paste(ci.gender.vomen[["t0"]],"(",round(ci.gender.vomen[["normal"]][2], digits = 2),"-",round(ci.gender.vomen[["normal"]][3], digits = 2),")")
delta.freq.vomen
