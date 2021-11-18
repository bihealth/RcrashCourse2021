# 2+2
# 3+7
# load libraries ----
library(tidyverse)

# load data ----
iris <- read_tsv("Datasets/iris.tsv")

a_number <- 12
a_second_number = 23

getwd()
a_number <- "twelve"
result <- TRUE
FALSE

blood_pressure <- c(120, 115, 160, 110)
bad_blood <- c(120, "none", 160, 110, TRUE)

result_second <- a_second_number + 27

# calculating summaries ----
mean(blood_pressure) # calculate the mean of my blood pressure
sum(blood_pressure)

gender <- factor(x = c("m", "f", "m"), levels = c("m", "f"))

vec1 <- c(4, 2, 1)
vec1 <- vec1 + 5


vec1 <- 1:10
vec2 <- 20:30


vec1 + vec2


differentGenders <- c("f", "B")
myVeryComplicatedFunction

# looking at vectors and elements ----
species <- iris$Species # pull out a vector
summary(species)        # understand this data
summary(factor(species))
species[15]
# use : (from the exercise) to access the first 50 element
all(species[1:50] == "setosa")

# show only group "setosa"
species[species == "setosa"]

# -> filter / define number
# works on dataframes (part of the tidyverse)
filter(iris, Species == "setosa") # logical operators: > , < , != (! =)



# write your own function ----
sumUpNumbers <- function(number1, number2){
  sumResults <- number1 + number2
  return(sumResults)
}

sumUpNumbers(3, 5, 6)
sumUpNumbers(1:3, 4:6)

samples <- rnorm(100)
summary(samples)

# change the mean / sd of our distributions
# making up my own data 
samples2 <- rnorm(n = 1000, mean = 5, sd = 50)
summary(samples2)

hist(samples2)
boxplot(samples, samples2, col = "blue")
t.test(samples, samples2)


# look at iris data
plot(iris$Sepal.Length, iris$Petal.Width)


# vectors vs factors
## vectors don't have orders, they are like in mathematics
## factors come from vector -> include groups












