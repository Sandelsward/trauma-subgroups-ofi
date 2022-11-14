# Fil för deskrivptiva resultat



create_table_two <- function(df.ofi.frequency) {
  
  ## Renaming data labels
  
  df.ofi.frequency$subgruops <- factor(
    df.ofi.frequency$subgruops,
    levels = c("Men", "Women", "Blunt Trauma", "Penetraiting Trauma", "Traffic - motor veichle accident, not motorcycle", "Traffic - motorcycle accident", "Traffic - bicycle accident", "Traffic - pedastrian", "Traffic - other", "Shot by handgun, shotgun, rifle, other firearm of any calibre ", "Stabbed by knife, sword, dagger other pointed or sharp object", "Struck or hit by blunt object", "Low energy fall - fall in the same level", "High energy fall - fall from a higher level","Blast injury", "Other", "Minor Trauma", "Major Trauma", "Head or Neck", "Face", "Chest, Diaphragm or Spine", "Abdomen", "Extremities", "Unspecified", "Multiple"),
    labels = c("Men", "Women", "Blunt Trauma", "Penetraiting Trauma", "Traffic - motor veichle accident, not motorcycle", "Traffic - motorcycle accident", "Traffic - bicycle accident", "Traffic - pedastrian", "Traffic - other", "Shot by handgun, shotgun, rifle, other firearm of any calibre ", "Stabbed by knife, sword, dagger other pointed or sharp object", "Struck or hit by blunt object", "Low energy fall - fall in the same level", "High energy fall - fall from a higher level","Blast injury", "Other", "Minor Trauma", "Major Trauma", "Head or Neck", "Face", "Chest, Diaphragm or Spine", "Abdomen", "Extremities", "Unspecified", "Multiple")
  )
  
  df.ofi.frequency$frequency.of.ofi <- factor(
    df.ofi.frequency$frequency.of.ofi,
    levels = c(freq.ofi.men, freq.ofi.women, freq.ofi.blunt, freq.ofi.penetrating, freq.ofi.traffic1, freq.ofi.traffic2, freq.ofi.traffic3, freq.ofi.traffic4, freq.ofi.traffic5, freq.ofi.shot, freq.ofi.stabbed, freq.ofi.struck, freq.ofi.low.energy, freq.ofi.high.energy, freq.ofi.blast, freq.ofi.other, freq.ofi.minor.trauma, freq.ofi.major.trauma, freq.ofi.head.neck, freq.ofi.face, freq.ofi.chest.spine, freq.ofi.abdomen, freq.ofi.extremities, freq.ofi.unspecified, freq.ofi.multiple),
    labels = c("Men", "Women", "Blunt Trauma", "Penetraiting Trauma", "Traffic - motor veichle accident, not motorcycle", "Traffic - motorcycle accident", "Traffic - bicycle accident", "Traffic - pedastrian", "Traffic - other", "Shot by handgun, shotgun, rifle, other firearm of any calibre ", "Stabbed by knife, sword, dagger other pointed or sharp object", "Struck or hit by blunt object", "Low energy fall - fall in the same level", "High energy fall - fall from a higher level","Blast injury", "Other", "Minor Trauma", "Major Trauma", "Head or Neck", "Face", "Chest, Diaphragm or Spine", "Abdomen", "Extremities", "Unspecified", "Multiple")
  
  )
  
  
  ## Renaming column labels
  var_label(df.ofi.frequency) <- list (
    frequency.of.ofi = "OFI frekvens",
    subgroups = "Subgrupper"
  )
  
  
  
  ## Fixing weird rounding issues + removing mean from table
  my.render.cont <- function(x) {
    with(stats.default(x), 
         c("",
           
           "Median (Min, Max)" = sprintf("%s (%s, %s)",
                                         round_pad(MEDIAN, 0), 
                                         round_pad(MIN, 0), 
                                         round_pad(MAX, 0)))
    )
  }
  
  ## Making table one
  vars2 <- c("frequency.of.ofi", "subgroups")
  df.ofi.frequency <- table1(~ subgruops  | frequency.of.ofi, 
                    data=df.ofi.frequency[,vars2], overall = FALSE, render.categorical="FREQ (PCTnoNA%)", render.continuous = my.render.cont)
  
  return(table.2)
  
}
  