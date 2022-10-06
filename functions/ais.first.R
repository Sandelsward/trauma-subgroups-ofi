# Funktion som skapar ny kolumn med med första siffran i alla aiskoder.
## Ändrade namn till reg(region) istället för first

ais_first <- function(cleaned.data) {
  returned.data <- cleaned.data %>% mutate(across(7:56, ~substr(.x, 1, 1), .names = "{col}.reg"))
  return(returned.data)
}

