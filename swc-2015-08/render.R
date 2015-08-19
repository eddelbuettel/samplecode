#!/usr/bin/Rscript

library(rmarkdown)

render("sample.Rmd", output_format="pdf_document", output_file="sample.pdf")
