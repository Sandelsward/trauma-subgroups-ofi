# Ränka ut frekvensen av ofi för olika grupper

# antal undersökta patienter
 
total.cohort <- nrow(test2)

#antal män

total.men %>% filter(test2$pt_Gender == 1, na.rm = TRUE)
total.men <- test2[test2$pt_Gender == 1,1]