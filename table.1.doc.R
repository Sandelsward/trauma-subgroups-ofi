doc <- read_docx()

# Insert the data frame into the Word document
doc <- body_add_table(doc, value = table.1.df, style = "Normal Table")

# Save the Word document
print(doc, target = "table.docx")











