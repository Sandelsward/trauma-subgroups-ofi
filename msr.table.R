doc.delta.msr.table<- read_docx()
doc.delta.msr.table<- body_add_table(doc, value = delta.msr.table, style = "Normal Table")
print(doc.delta.msr.table, target = "delta.msr.table.docx")



