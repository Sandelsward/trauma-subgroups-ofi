doc.delta.minmaj.table<- read_docx()
doc.delta.minmaj.table<- body_add_table(doc, value = delta.minmaj.table, style = "Normal Table")
print(doc.delta.minmaj.table, target = "delta.minmaj.table.docx")

