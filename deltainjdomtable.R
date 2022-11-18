# Delta table för inj dominant


delta.inj.table <- data.frame(matrix(ncol = 2, nrow = 2)) 

## Name cols/rows
table.names <- c("Blunt Trauma", "Penetrating Trauma")
colnames(delta.inj.table) <- table.names
rownames(delta.inj.table) <- rev(table.names) # (to get the diagonal the other way)

## Just filling diagonals with "-" since they are zero
for (diag.name in table.names) {
  delta.inj.table[diag.name,diag.name] <- "-"
}



delta.inj.table["Penetrating Trauma", "Blunt Trauma"] <- paste.delta.inj.dominant
delta.inj.table["Blunt Trauma", "Penetrating Trauma"] <- paste.delta.inj.dominant2


deltainjtable <- kable(delta.inj.table, caption = "Delta values for blunt and penetrating trauma") 