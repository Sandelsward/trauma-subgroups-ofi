#######################
# Delta table for MSR #
#######################


#### Create empty data frame
delta.msr.table <- data.frame(matrix(ncol = 7, nrow = 7)) #pga 7 regioner

## Name cols/rows
table.names <- c("Head or neck", "Face","Chest, diaphragm or spine","Abdomen","Extremity","Unspecified", "Multiple")
colnames(delta.msr.table) <- table.names
rownames(delta.msr.table) <- rev(table.names) # (to get the diagonal the other way)

## Just filling diagonals with "-" since they are zero
for (diag.name in table.names) {
  delta.msr.table[diag.name,diag.name] <- "-"
}

#### Calculate individual values and insert into table, need to be repeated for all values.

#delta.severe.region1 <- (freq.ofi.head.neck)-(freq.ofi.face) 7+1 =8
ci.head.face <- boot.ci(boot.out = boot_out_msr, conf = 0.95, type=c("norm"),index=8)
ci.head.face.combined <- paste(round(ci.head.face[["t0"]], digits = 2),"(",round(ci.head.face[["normal"]][2], digits = 2),"-",round(ci.head.face[["normal"]][3], digits = 2),")")
# choose cordinates of where to put calculated values into the table
delta.msr.table["Face","Head or neck"] <- ci.head.face.combined

# delta.severe.region2 <- (freq.ofi.head.neck)-(freq.ofi.chest.spine)
ci.head.chest <- boot.ci(boot.out = boot_out_msr, conf = 0.95, type=c("norm"),index=9)
ci.head.chest.combined <- paste(round(ci.head.chest[["t0"]], digits = 2),"(",round(ci.head.chest[["normal"]][2], digits = 2),"-",round(ci.head.chest[["normal"]][3], digits = 2),")")
# choose cordinates of where to put calculated values
delta.msr.table["Chest, diaphragm or spine","Head or neck"] <- ci.head.face.combined

### When the table is full you can then put this objekt in a chunk in markdown.
#deltamsrtable <- kable(delta.msr.table, caption = "Delta MRS values")%>%
 #kable_styling(latex_options="scale_down")


