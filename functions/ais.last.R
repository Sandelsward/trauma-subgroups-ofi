# Funktion som skapar ny kolumn med med sista siffran i alla aiskoder.
# Ändrade koden till sev (severity) från tid last

ais_last <- function(cleaned.data) {
  returned.data <- cleaned.data %>% mutate(across(7:56, ~substr(.x, 8, 8), .names = "{col}.sev"))
 return(returned.data)
}
  
