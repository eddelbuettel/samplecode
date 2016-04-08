
library(RSQLite)

## filepath is relative ot the project root
con <- dbConnect(RSQLite::SQLite(), "dc-2016-04-08/sql/gapminder.sqlite")

## tables in db
dbListTables(con)

## basic queries
res <- dbGetQuery(con, "SELECT year FROM surveys")
str(res)

res <- dbGetQuery(con, "SELECT year, pop FROM surveys")
str(res)

res <- dbGetQuery(con, "SELECT * FROM surveys")
str(res)


## Unique values
res <- dbGetQuery(con, "SELECT DISTINCT country FROM surveys")
str(res)

res <- dbGetQuery(con, "SELECT DISTINCT country, year FROM surveys")
str(res)


## Calculated values
res <- dbGetQuery(con, "SELECT country, year, pop/1000.0 FROM surveys")
str(res)

res <- dbGetQuery(con, "SELECT country, year, ROUND(gdpPercap, 2) FROM surveys")
str(res)

res <- dbGetQuery(con, "SELECT country, year, ROUND(pop/1000.0) as gdp FROM surveys")
str(res)


## Filtering
res <- dbGetQuery(con, "SELECT * FROM surveys WHERE country='Iceland'")
str(res)

res <- dbGetQuery(con, "SELECT * FROM surveys WHERE year >= 2000")
str(res)

res <- dbGetQuery(con, "SELECT * FROM surveys WHERE (year >= 2000) AND (country = 'Iceland')")
str(res)

res <- dbGetQuery(con, "SELECT * FROM surveys WHERE (country = 'Iceland') OR (country = 'Madagascar') OR (country = 'Dominican Republic')")
str(res)


## More complex
res <- dbGetQuery(con, "SELECT * FROM surveys WHERE (year >= 2000) AND (country IN ('Iceland', 'Madagascar', 'Dominican Republic'))")
str(res)

sql <- paste("SELECT * ",
             "FROM surveys ",
             "WHERE (year >= 2000) ",
             "AND (country IN ('Iceland', 'Madagascar', 'Dominican Republic'))")
str(res <- dbGetQuery(con, sql))


## Sorting
sql <- paste("SELECT * FROM countries ORDER BY country ASC")
str(res <- dbGetQuery(con, sql))


sql <- paste("SELECT * FROM countries ORDER BY country DESC")
str(res <- dbGetQuery(con, sql))

sql <- paste("SELECT * FROM countries ORDER BY continent ASC, country ASC")
str(res <- dbGetQuery(con, sql))


## Order of execution
sql <- paste("SELECT country, gdpPercap FROM surveys WHERE (pop > 1000000) ORDER BY pop ASC")
str(res <- dbGetQuery(con, sql))

## Aggregation
sql <- paste("SELECT COUNT(*) FROM surveys")
str(res <- dbGetQuery(con, sql))


sql <- paste("SELECT COUNT(*), ROUND(SUM(pop/1000000.0),3) FROM surveys")
str(res <- dbGetQuery(con, sql))


sql <- paste("SELECT continent, COUNT(*) FROM countries GROUP BY continent")
str(res <- dbGetQuery(con, sql))


## Joins
sql <- paste("SELECT * FROM surveys ",
             "JOIN countries ON surveys.country = countries.country")
str(res <- dbGetQuery(con, sql))


sql <- paste("SELECT surveys.country, countries.continent, surveys.year, surveys.pop ",
             "FROM surveys ",
             "JOIN countries ON surveys.country = countries.country")
str(res <- dbGetQuery(con, sql))


## Aliases
sql <- paste("SELECT surv.year, surv.country ",
             "FROM surveys AS surv ",
             "JOIN countries AS co ON surv.country = co.country")
str(res <- dbGetQuery(con, sql))


sql <- paste("SELECT surv.year AS yr, surv.country AS con ",
             "FROM surveys AS surv ",
             "JOIN countries AS co ON surv.country = co.country")
str(res <- dbGetQuery(con, sql))
