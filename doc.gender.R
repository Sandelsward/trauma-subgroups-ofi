doc.gender <- read_docx()
doc.gender <- body_add_table(doc.gender, value = deltagendertable.df, style = "Normal Table")
print(doc.gender, target = "gender.table.docx")