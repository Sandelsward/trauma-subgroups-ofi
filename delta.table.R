Delta.table <- ????
#library(flextable)
#library(magrittr)

### AUC table

d.auc.table <- data.frame(matrix(ncol = 9, nrow = 9))

colnames(d.auc.table) <- c("Traffic1","Traffic2","Traffic3","Traffic4","Traffic5","Shot","Stabbed","Struck","Low Energy")
rownames(d.auc.table) <- c("Traffic1","Traffic2","Traffic3","Traffic4","Traffic5","Shot","Stabbed","Struck","Low Energy")
#rownames(d.auc.table) <- c("lgb","rf","cat","xgb","svm","lr","dt","knn","auditfilter")

delta.vec <- vector()
for (r.name in names(Delta.table)) {
  
  for (c.name in names(Delta.table)) {
    
    for (resample in 1:length(Delta.table[["Traffic4"]][["auc"]])) {
      
      delta.vec[resample] <- Delta.table[[r.name]][["auc"]][resample] - Delta.table[[c.name]][["auc"]][resample]
    }
    if (r.name == c.name) {
      d.auc.table[r.name,c.name] <- "-"
    } else {
      
      delta.result <- round(gmodels::ci(delta.vec, ci=0.95), digits = 2)
      d.auc.table[r.name,c.name] <- paste(delta.result[1],"(",delta.result[2],"-",delta.result[3],")")
    }
  }
}


d.auc.table <- kable(d.auc.table, caption = "Delta AUC")%>%
  kable_styling(latex_options="scale_down")