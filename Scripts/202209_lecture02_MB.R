## Recap Day 1 ----
install.packages("tidyverse") # once 

# loading a package 
library(tidyverse)   # once per session / script
library("tidyverse") # works as well (is a bit inconsistent)

# basic data structures
bloodPressure <- c(120, 135, 140) # numbers
badBloodPressure <- c(120, "none", 180, 17) # character
bloodPressure >= 140 # boolean
badBloodPressure > 140 # alphabetic ordering (be careful)
weekdays <- c("mon", "tue", "wed", "thu", "mon", "mon")
weekdays.factor <- factor(weekdays, levels = c("mon", "tue", "wed", "thu", "fri"))

# started to use functions 
summary(weekdays)   # round brackets 
summary(weekdays.factor)

#' sumTwoNumbers
#' comments are your friends
sumTwoNumbers <- function(firstNumber, secondNumber){
  result <- firstNumber + secondNumber
  return(result)
}

heightTree <- sumTwoNumbers(4, 12.743)
sumTwoNumbers(-372, 379)


# area of a lake covered ----
x <- 1:10
y <- 1/100*2^(x-1)
y1 <- 1/100*1.5^(x-1) # change the doubling rate

plot(x, y)
points(x, y1, col = "blue")
abline(h = .5, col = "red", lty = 2)

y[5]
y[4:5]
y[c(3,5)]
y[-1]
y[12]

## write our own function ----
#' calculate the surface covered with lilies
pond_surface_covered <- function(days, startArea = 1/100, rateCoverage = 2){
  y <- startArea*rateCoverage^(days-1)
  return(y)
}

y <- pond_surface_covered(x)
y1 <- pond_surface_covered(x, rateCoverage = 1.5)
y2 <- pond_surface_covered(x, startArea = .02, rateCoverage = 1.25)

plot(x,y)
points(x, y1, col = "green")
points(x, y2, col = "blue")


# using random numbers ----
# distributions 
# 1. normal distribution
# 2. exponential
# 3. uniform 

runif(10)

#' random number generator
randsamp <- function(n = n, dist = "uniform"){
  if(dist == "uniform"){
    res <- runif(n)
  } else if(dist == "normal"){
    res <- rnorm(n)
  } else {
    stop("Mistake, we do not know the distribution.")
  }
  
  return(res)
}

randsamp()
randsamp(10, dist = "uniform")
randsamp(10, dist = "normal")


# more complex data types ----
m <- matrix(1:18, ncol=3, nrow=6)
m2 <- matrix(1:18, ncol = 3, byrow = TRUE)

dim(m2)  # dimension of your matrix
nrow(m2) # number of rows

y[2]
m2[4, 2]
m[3,] # get the elements of a row
m2[ ,1] # of a column

m[1:2, 1:2]

rownames(m) <- c("KRAS", "BRAF", "EGFR", "MEK1", "PI3K", "MTOR")
colnames(m) <- c("t0", "t1", "t3")

m["KRAS",]
dataT3 <- m[, "t3"]
dataT3["MEK1"]

letters
LETTERS

m[, 4] # complex data type -> error
x[14]  # simple data type returns NA


bookDescription <- list(author = "Terry Pratchett", book = "Die Scheibenwelt", 
                        publication = 1984)

bookDescription[[2]] # gives me a string
bookDescription[2:3] # gives me a list (extracting the second and third result)

bookDescription$author
bookDescription[["author"]]
bookDescription[[1]]  # all give the same result

# tables / data frames 
# each column has the same type

names <- c("January", "Manuela") # there is also function called "names"
lastn <- c("Weiner", "Benary")
age   <- c(1001, NA)

teachers <- data.frame(names=names, last_names=lastn, age=age)
dim(teachers)
class(teachers) # what type of data is this?

# how do I get our first names?
View(names) # thats the original
teachers$names
teachers[,2] # gives you a vector
teachers[1,] # gives you a data frame

rownames(teachers) <- c("Teacher1", "Teacher2")



## Brackets
# [] ... assess elements of a vector or matrix or data frame
# () ... part of calling a function - input of parameters / order of arithmetic calculations
# {} ... chunk of code - eg when defining your own function / if-else statement /loops
# [[]] ... assess element of a list

## Exercise 2.4 (as home work) - recap in the course

## Reading in data from files ----
library(readxl)
library(tidyverse)
newData <- read_excel("Datasets/ElectrolytesExamples.xlsx", sheet = "NewData")

read_csv("Datasets/TB_ORD_Gambia_Sutherland_biochemicals.csv")
# actually tab-separated
read_tsv("Datasets/TB_ORD_Gambia_Sutherland_biochemicals.csv")
iris <- read_csv("Datasets/iris.csv")
botchedData <- read_excel("Datasets/meta_data_botched.xlsx")

