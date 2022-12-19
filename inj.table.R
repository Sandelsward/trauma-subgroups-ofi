doc.delta.inj.table<- read_docx()
doc.delta.inj.table<- body_add_table(doc.delta.inj.table, value = delta.inj.table, style = "Normal Table")
print(doc.delta.inj.table, target = "delta.inj.table.docx")

