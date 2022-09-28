# Funktion som skapar ny kolumn med med sista siffran i alla aiskoder.

ais_last <- function(cleaned.data) {
  returned.data <- cleaned.data %>% mutate(across(7:56, ~substr(.x, 8, 8), .names = "{col}.last"))
 return(returned.data)
}
  
