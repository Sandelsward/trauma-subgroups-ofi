# Delta table för minor och major trauma



delta.minmaj.table <- data.frame(matrix(ncol = 2, nrow = 2)) 

## Name cols/rows
table.names <- c("Minor Trauma", "Major Trauma")
colnames(delta.minmaj.table) <- table.names
rownames(delta.minmaj.table) <- rev(table.names) # (to get the diagonal the other way)

## Just filling diagonals with "-" since they are zero
for (diag.name in table.names) {
  delta.minmaj.table[diag.name,diag.name] <- "-"
}

#delta.gender.table["Women", "Men"] <- paste.delta.gender
#delta.gender.table["Men", "Women"] <- pate.delta.gender2

delta.minmaj.table["Major Trauma", "Minor Trauma"] <- paste.delta.min.maj
delta.minmaj.table["Minor Trauma", "Major Trauma"] <- paste.delta.min.maj2


deltaminmajtable <- kable(delta.minmaj.table)  %>%
  kable_styling(latex_options="scale_down")
