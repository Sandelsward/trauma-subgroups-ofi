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
delta.msr.table["Chest, diaphragm or spine","Head or neck"] <- ci.head.chest.combined

paste.delta.severe.region.1 <- paste(round(ci.delta.severe.region.1[["t0"]], digits = 2),"(",round(ci.delta.severe.region.1[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.1[["normal"]][3], digits = 2),")")
paste.delta.severe.region.2 <- paste(round(ci.delta.severe.region.2[["t0"]], digits = 2),"(",round(ci.delta.severe.region.2[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.2[["normal"]][3], digits = 2),")")
paste.delta.severe.region.3 <- paste(round(ci.delta.severe.region.3[["t0"]], digits = 2),"(",round(ci.delta.severe.region.3[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.3[["normal"]][3], digits = 2),")")
delta.msr.table["Abdomen","Head or neck"] <- paste.delta.severe.region.3
paste.delta.severe.region.4 <- paste(round(ci.delta.severe.region.4[["t0"]], digits = 2),"(",round(ci.delta.severe.region.4[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.4[["normal"]][3], digits = 2),")")
delta.msr.table["Extremity","Head or neck"] <- paste.delta.severe.region.4

paste.delta.severe.region.5 <- paste(round(ci.delta.severe.region.5[["t0"]], digits = 2),"(",round(ci.delta.severe.region.5[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.5[["normal"]][3], digits = 2),")")
delta.msr.table["Unspecified","Head or neck"] <- paste.delta.severe.region.5

paste.delta.severe.region.6 <- paste(round(ci.delta.severe.region.6[["t0"]], digits = 2),"(",round(ci.delta.severe.region.6[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.6[["normal"]][3], digits = 2),")")
delta.msr.table["Multiple","Head or neck"] <- paste.delta.severe.region.6

paste.delta.severe.region.7 <- paste(round(ci.delta.severe.region.7[["t0"]], digits = 2),"(",round(ci.delta.severe.region.7[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.7[["normal"]][3], digits = 2),")")
delta.msr.table["Chest, diaphragm or spine","Face"] <- paste.delta.severe.region.7

paste.delta.severe.region.8 <- paste(round(ci.delta.severe.region.8[["t0"]], digits = 2),"(",round(ci.delta.severe.region.8[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.8[["normal"]][3], digits = 2),")")

delta.msr.table["Abdomen","Face"] <- paste.delta.severe.region.8

paste.delta.severe.region.9 <- paste(round(ci.delta.severe.region.9[["t0"]], digits = 2),"(",round(ci.delta.severe.region.9[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.9[["normal"]][3], digits = 2),")")

delta.msr.table["Extremity","Face"] <- paste.delta.severe.region.9

paste.delta.severe.region.10 <- paste(round(ci.delta.severe.region.10[["t0"]], digits = 2),"(",round(ci.delta.severe.region.10[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.10[["normal"]][3], digits = 2),")")

delta.msr.table["Unspecified","Face"] <- paste.delta.severe.region.10


paste.delta.severe.region.11 <- paste(round(ci.delta.severe.region.11[["t0"]], digits = 2),"(",round(ci.delta.severe.region.11[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.11[["normal"]][3], digits = 2),")")

delta.msr.table["Multiple","Face"] <- paste.delta.severe.region.11


paste.delta.severe.region.12 <- paste(round(ci.delta.severe.region.12[["t0"]], digits = 2),"(",round(ci.delta.severe.region.12[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.12[["normal"]][3], digits = 2),")")

delta.msr.table["Abdomen","Chest, diaphragm or spine"] <- paste.delta.severe.region.12


paste.delta.severe.region.13 <- paste(round(ci.delta.severe.region.13[["t0"]], digits = 2),"(",round(ci.delta.severe.region.13[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.13[["normal"]][3], digits = 2),")")

delta.msr.table["Extremity","Chest, diaphragm or spine"] <- paste.delta.severe.region.13


paste.delta.severe.region.14 <- paste(round(ci.delta.severe.region.14[["t0"]], digits = 2),"(",round(ci.delta.severe.region.14[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.14[["normal"]][3], digits = 2),")")

delta.msr.table["Unspecified","Chest, diaphragm or spine"] <- paste.delta.severe.region.14


paste.delta.severe.region.15 <- paste(round(ci.delta.severe.region.15[["t0"]], digits = 2),"(",round(ci.delta.severe.region.15[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.15[["normal"]][3], digits = 2),")")

delta.msr.table["Multiple","Chest, diaphragm or spine"] <- paste.delta.severe.region.15


paste.delta.severe.region.16 <- paste(round(ci.delta.severe.region.16[["t0"]], digits = 2),"(",round(ci.delta.severe.region.16[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.16[["normal"]][3], digits = 2),")")

delta.msr.table["Extremity","Abdomen"] <- paste.delta.severe.region.16


paste.delta.severe.region.17 <- paste(round(ci.delta.severe.region.17[["t0"]], digits = 2),"(",round(ci.delta.severe.region.17[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.17[["normal"]][3], digits = 2),")")

delta.msr.table["Unspecified","Abdomen"] <- paste.delta.severe.region.17

paste.delta.severe.region.18 <- paste(round(ci.delta.severe.region.18[["t0"]], digits = 2),"(",round(ci.delta.severe.region.18[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.18[["normal"]][3], digits = 2),")")

delta.msr.table["Multiple","Abdomen"] <- paste.delta.severe.region.18


paste.delta.severe.region.19 <- paste(round(ci.delta.severe.region.19[["t0"]], digits = 2),"(",round(ci.delta.severe.region.19[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.19[["normal"]][3], digits = 2),")")

delta.msr.table["Unspecified","Extremity"] <- paste.delta.severe.region.19


paste.delta.severe.region.20 <- paste(round(ci.delta.severe.region.20[["t0"]], digits = 2),"(",round(ci.delta.severe.region.20[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.20[["normal"]][3], digits = 2),")")

delta.msr.table["Multiple","Extremity"] <- paste.delta.severe.region.20


paste.delta.severe.region.21 <- paste(round(ci.delta.severe.region.21[["t0"]], digits = 2),"(",round(ci.delta.severe.region.21[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.21[["normal"]][3], digits = 2),")")

delta.msr.table["Multiple","Unspecified"] <- paste.delta.severe.region.21

paste.delta.severe.region.22 <- paste(round(ci.delta.severe.region.22[["t0"]], digits = 2),"(",round(ci.delta.severe.region.22[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.22[["normal"]][3], digits = 2),")")
delta.msr.table["Head or neck","Face"] <- paste.delta.severe.region.22

paste.delta.severe.region.23 <- paste(round(ci.delta.severe.region.23[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.23[["normal"]][3], digits = 2),")")
delta.msr.table["Head or neck","Chest, diaphragm or spine"] <- paste.delta.severe.region.23

paste.delta.severe.region.24 <- paste(round(ci.delta.severe.region.24[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.24[["normal"]][3], digits = 2),")")

delta.msr.table["Face","Chest, diaphragm or spine"] <- paste.delta.severe.region.24


paste.delta.severe.region.25 <- paste(round(ci.delta.severe.region.25[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.25[["normal"]][3], digits = 2),")")

delta.msr.table["Head or neck","Abdomen"] <- paste.delta.severe.region.25

paste.delta.severe.region.26 <- paste(round(ci.delta.severe.region.26[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.26[["normal"]][3], digits = 2),")")

delta.msr.table["Face","Abdomen"] <- paste.delta.severe.region.26


paste.delta.severe.region.27 <- paste(round(ci.delta.severe.region.27[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.27[["normal"]][3], digits = 2),")")

delta.msr.table["Chest, diaphragm or spine","Abdomen"] <- paste.delta.severe.region.27


paste.delta.severe.region.28 <- paste(round(ci.delta.severe.region.28[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.28[["normal"]][3], digits = 2),")")

delta.msr.table["Head or neck","Extremity"] <- paste.delta.severe.region.28


paste.delta.severe.region.29 <- paste(round(ci.delta.severe.region.29[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.29[["normal"]][3], digits = 2),")")

delta.msr.table["Face","Extremity"] <- paste.delta.severe.region.29


paste.delta.severe.region.30 <- paste(round(ci.delta.severe.region.30[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.30[["normal"]][3], digits = 2),")")

delta.msr.table["Chest, diaphragm or spine","Extremity"] <- paste.delta.severe.region.30


paste.delta.severe.region.31 <- paste(round(ci.delta.severe.region.31[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.31[["normal"]][3], digits = 2),")")

delta.msr.table["Abdomen","Extremity"] <- paste.delta.severe.region.31



paste.delta.severe.region.32 <- paste(round(ci.delta.severe.region.32[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.32[["normal"]][3], digits = 2),")")

delta.msr.table["Head or neck","Unspecified"] <- paste.delta.severe.region.32


paste.delta.severe.region.33 <- paste(round(ci.delta.severe.region.33[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.33[["normal"]][3], digits = 2),")")

delta.msr.table["Face","Unspecified"] <- paste.delta.severe.region.33


paste.delta.severe.region.34 <- paste(round(ci.delta.severe.region.34[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.34[["normal"]][3], digits = 2),")")

delta.msr.table["Chest, diaphragm or spine","Unspecified"] <- paste.delta.severe.region.34


paste.delta.severe.region.35 <- paste(round(ci.delta.severe.region.35[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.35[["normal"]][3], digits = 2),")")

delta.msr.table["Abdomen","Unspecified"] <- paste.delta.severe.region.35


paste.delta.severe.region.36 <- paste(round(ci.delta.severe.region.36[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.36[["normal"]][3], digits = 2),")")

delta.msr.table["Extremity","Unspecified"] <- paste.delta.severe.region.36

paste.delta.severe.region.37 <- paste(round(ci.delta.severe.region.37[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.37[["normal"]][3], digits = 2),")")

delta.msr.table["Head or neck","Multiple"] <- paste.delta.severe.region.37


paste.delta.severe.region.38 <- paste(round(ci.delta.severe.region.38[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.38[["normal"]][3], digits = 2),")")

delta.msr.table["Face","Multiple"] <- paste.delta.severe.region.38


paste.delta.severe.region.39 <- paste(round(ci.delta.severe.region.39[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.39[["normal"]][3], digits = 2),")")

delta.msr.table["Chest, diaphragm or spine","Multiple"] <- paste.delta.severe.region.39


paste.delta.severe.region.40 <- paste(round(ci.delta.severe.region.40[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.40[["normal"]][3], digits = 2),")")

delta.msr.table["Abdomen","Multiple"] <- paste.delta.severe.region.40


paste.delta.severe.region.41 <- paste(round(ci.delta.severe.region.41[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.41[["normal"]][3], digits = 2),")")

delta.msr.table["Extremity","Multiple"] <- paste.delta.severe.region.41


paste.delta.severe.region.42 <- paste(round(ci.delta.severe.region.42[["t0"]], digits = 2),"(",round(ci.delta.severe.region.23[["normal"]][2], digits = 2),"-",round(ci.delta.severe.region.42[["normal"]][3], digits = 2),")")

delta.msr.table["Unspecified","Multiple"] <- paste.delta.severe.region.42



### When the table is full you can then put this objekt in a chunk in markdown.
deltamsrtable <- kable(delta.msr.table, caption = "Delta MRS values") #%>%
 #kable_styling(latex_options="scale_down")




