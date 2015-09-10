

library("gapminder")

str(gapminder)
head(gapminder)
summary(gapminder)

table(gapminder$continent)

plot(lifeExp ~ year, data=gapminder, subset= country=="Cambodia", type='b')


plot(lifeExp ~ gdpPercap, data=gapminder, subset= year==2007,
     log="x", col=continent)

plot(lifeExp ~ gdpPercap, data=gapminder, pch=".")

aggregate(lifeExp ~ continent, data=gapminder,  median)


### plyr
library("plyr")
ddply(gapminder, ~ continent, summarize, medianLE=median(lifeExp))

ddply(gapminder, ~ continent, summarize, nobs=length(unique(country)))

ddply(gapminder,  ~ continent, function(x) c(nobs=length(unique(x$country))))

ddply(gapminder, ~ continent, summarize,
      minLE=min(lifeExp),
      medLE=median(lifeExp),
      maxLE=max(lifeExp))


lm(lifeExp ~ continent - 1, data=gapminder)

myLinFit <- function(dat, offset=1952) {
    fit <- lm(lifeExp ~ I(year - offset), data=dat )
    vals <- coef(fit)
    names(vals) <- c("intercept", "slope")
    return(vals)
}


allcoefs <- ddply(gapminder, ~ country, myLinFit)

library(ggplot2)

gDat <- gapminder

p <- ggplot(gDat,  aes(x=gdpPercap, y=lifeExp))
p + geom_point()

p <- ggplot(gDat,  aes(x=log10(gdpPercap), y=lifeExp)) + geom_point()
p <- ggplot(gDat,  aes(x=gdpPercap, y=lifeExp)) + geom_point() + scale_x_log10()

## by continent
ggplot(gDat,  aes(x=gdpPercap, y=lifeExp)) +
       geom_point(aes(color=continent)) + scale_x_log10()


ggplot(gDat,  aes(x=gdpPercap, y=lifeExp)) +
    geom_point(alpha=0.33, size=2) + scale_x_log10()


# with loess smoother
ggplot(gDat,  aes(x=gdpPercap, y=lifeExp)) +
    geom_point(alpha=0.33, size=2) + scale_x_log10() +
    geom_smooth(method="loess")

# start with base again
p <- ggplot(gDat,  aes(x=gdpPercap, y=lifeExp)) +
       geom_point(alpha=0.33, size=2) + scale_x_log10()
p + aes(color=continent) + geom_smooth(lwd=1, se=FALSE, method="loess")


# facetting
# start with base again
p <- ggplot(gDat,  aes(x=gdpPercap, y=lifeExp)) +
    geom_point(alpha=0.33, size=2) + scale_x_log10()
p + facet_wrap(~ continent) +
     geom_smooth(lwd=1, se=FALSE, method="loess")

