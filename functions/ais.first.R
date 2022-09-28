# Funktion som skapar ny kolumn med med första siffran i alla aiskoder.

ais_first <- function(cleaned.data) {
  returned.data <- cleaned.data %>% mutate(across(7:56, ~substr(.x, 1, 1), .names = "{col}.first"))
  return(returned.data)
}

