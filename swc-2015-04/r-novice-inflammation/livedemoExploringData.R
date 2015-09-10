
# swc session April 17

# variables
abc <- 3.123
twicethevalue <- abc * 2

# re-read date
dat <- read.csv("data/inflammation-01.csv", header=FALSE)

# inspect
str(dat)

# size
dim(dat)

# create vector
somepos <- c(3,5,9)

# first patient 
pat1 <- dat[1, ]

# summary function on patient 1
summary(pat1)

# day 1
day1 <- dat[, 1]
summary(day1)

# day 10
day10 <- dat[, 10]
summary(day10)

# max, and finding max
which(day10 == max(day10))


# apply -- seeep FUN over dat by margin
apply(dat, 1, max)  # by patient
apply(dat, 2, max)  # by day

avg_patient_inflammation <- apply(dat, 1, mean)
avg_day_inflammation <- apply(dat, 2, mean)

## see also:  rowMeans, colMeans



element <- c("o", "x", "y", "g", "e", "n")
element[ 1:3 ]    # first three elements of 'element'

element[ c(3,2,1) ]

element[ - c(2,4) ]

## plotting
plot(avg_day_inflammation)

max_day_inflammation <- apply(dat, 2, max)
min_day_inflammation <- apply(dat, 2, min)

plot(max_day_inflammation)
plot(min_day_inflammation)
