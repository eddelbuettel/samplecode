
library("gapminder")
library("ggplot2")

countries <- c("Canada", "United States", "United Kingdom", "Germany", "France", "Japan", "Italy")

subgm <- subset(gapminder, country %in% countries)

p <- ggplot(subgm,  aes(x=gdpPercap, y=lifeExp)) +
    geom_point(alpha=0.33, size=1) +
    scale_x_log10() +
    facet_wrap(~ continent) + aes(color=country) +
    geom_smooth(lwd=0.25, se=FALSE, method="loess")


