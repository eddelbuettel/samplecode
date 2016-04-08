
library(gapminder)
library(data.table)
gm <- data.table(gapminder)

gm[ continent=='Asia', .(year, lifeExp, country)]

gm[,.(mgdp=mean(gdpPercap)),by=continent]

gm[, .(avgle=mean(lifeExp)), by=country]
gm[, .(avgle=mean(lifeExp)), by=country][, .(min=min(avgle),max=max(avgle))]

gm[, .(gdbBillions = sum(gdpPercap*pop/1e9)), by=.(continent, year)]
