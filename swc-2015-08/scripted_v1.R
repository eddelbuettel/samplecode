#!/usr/bin/Rscript

library(methods)
library(rmarkdown)
library(docopt)

doc <- "Usage: scripted.r [-c CNTRS] [-o FILE] 

-c --countries CNTRS  comma-separated list of counties
                      [default: 'United States,United Kingdom,France,Germany,Canada,Japan']
-o --file FILE        output file [default: result.pdf]
-h --help             show this help text"

## docopt parsing
opt <- docopt(doc)

writeFile <- function(srcfile, countries) {
    out <- file(srcfile, "w")
    cat("## What?

A simple demo mixing text, _markup_ and code.

```{r, echo=FALSE}
library(gapminder)
library(ggplot2)
```

## Prepare Subset

```{r}

countries <- ", file=out)

    cat(paste0("c(\"", paste(strsplit(countries, ",")[[1]], collapse="\",\""), "\")"), file=out)

    cat("
subgm <- subset(gapminder, country %in% countries)
```

## Create And Show Plot

```{r}
p <- ggplot(subgm,  aes(x=gdpPercap, y=lifeExp)) +
    geom_point(alpha=0.33, size=1) +
    scale_x_log10() +
    facet_wrap(~ continent) + aes(color=country) +
    geom_smooth(lwd=0.25, se=FALSE, method=\"loess\")
p
```", file=out)
    close(out)
}

srcfile <- tempfile(fileext=".Rmd")
writeFile(srcfile, opt$countries)
render(srcfile, output_format="pdf_document", output_file=opt$file)
unlink(srcfile)
