#!/usr/bin/Rscript

library(methods)
library(rmarkdown)
library(docopt)

doc <- "Usage: scripted.r [-c CNTRS] [-o FILE] 

-c --countries CNTRS  file name containing list of countries [default: countries.txt]
-o --file FILE        output file [default: result.pdf]
-h --help             show this help text"

## docopt parsing
opt <- docopt(doc)


render("template.Rmd", output_format="pdf_document", output_file=opt$file)
