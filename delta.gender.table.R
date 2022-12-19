#table för delta gender

delta.gender.table <- data.frame(matrix(ncol = 2, nrow = 2)) 

## Name cols/rows
table.names <- c("Men", "Women")
colnames(delta.gender.table) <- table.names
rownames(delta.gender.table) <- rev(table.names) # (to get the diagonal the other way)

## Just filling diagonals with "-" since they are zero
for (diag.name in table.names) {
  delta.gender.table[diag.name,diag.name] <- "-"
}

delta.gender.table["Women", "Men"] <- paste.delta.gender
delta.gender.table["Men", "Women"] <- pate.delta.gender2

deltagendertable <- kable(delta.gender.table) #%>%
  #kable_styling(latex_options="scale_down")
deltagendertable.df <- as.data.frame(delta.gender.table)