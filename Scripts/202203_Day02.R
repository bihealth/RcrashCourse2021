## notes and pieces for Day 2
x <- 1:10 # days
x = 1:10 # this is the same
1:10 -> x # this is the same (can cause problems, beware)

# we are lazy - we want our own function ----
# create a function for the lake

#' coveredArea
#' covered area of a lake using an exponential function
coveredArea <- function(days, beginningArea = 1/100, growthRate = 2) {
  
  ## code comment
  y <- beginningArea * growthRate^(days-1) # fraction of covered lake
  return(y)
  
}

# drawing random numbers in R ----
runif(1) # random number from a uniform distribution
runif(3)

distribution <- "uniform"
distribution == "normal" # not the same -> FALSE
distribution == "Uniform" # not the same (case-sensitive) -> FALSE

# we want to use different distributions, eg
# binominal
# uniform
# poisson

randGenerator <- function(n, dist = "uniform"){
  if(dist == "uniform"){
    rnumber <- runif(n)
  } else {
    if(dist == "binomial"){
      # call a binomial distribution
      rnumber <- rbinom(n, size = 10, prob = 0.5)
    } else {
      stop("We do not know this distribution.")
    }
  }
  
  return(rnumber)
}

# conditions ----

incomeClassification <- function(income, low = 1200, high = 4500){
  if(income < low){
    catIncome <- "low"
  } else {
    if (income > high){
      catIncome <- "high"
    } else {
      catIncome <- "medium"
    }
  }
  
  return(catIncome)
}

incomeClassification("no income")

# using brackets in RStudio
# () -> belongs to a function call
# [] -> accessing elements of a vector
# {} -> defines a block of code

y[3]   # indexing - giving you the area covered on the third
y[4:5] # indexing multiple positions
y[c(1, 10)] 

x[y >= 0.5] # at which days is more than half of the pond covered 
            # not by number, but by condition





# complex data types ----

matrix(1:18, nrow = 3) # fill by column
mat <- matrix(1:18, nrow = 3, byrow = TRUE) # fill by row
# in a vector we can use length()
dim(mat)
ncol(mat)

mat[1, 2] # access element int the second column and in first row
mat[,3]

rownames(mat) <- LETTERS[1:3] # same as c("A", "B", "C")
colnames(mat) <- 1:6 # confusing to use numbers
colnames(mat) <- paste("X", 1:6, sep = "")
mat
mat["B",] # recommend to use names

mat[2, "X3"] <- "a" # that will change everything into texts
is.character(mat)

# lists are cool 

clothrack <- list("socks", mat, 100)
clothrack[[3]] # accessing elements with [[]] by index
patient <- list(name = "Benary", date = "02.02.2022", blood.pressure = 120)
patient$name # accessing elements by name

sum(mat)
sum(clothrack[2])   # this does not work
sum(clothrack[[2]]) # this works (because it works for matrices)


# data frames ----
names <- c("January", "Bill")
lastn <- c("Weiner", "Gates")
age   <- c(1001, 64)

participants <- data.frame(names = names, last = lastn, age = age)
class(participants)
participants[, 3] # accessing columns by index -> as with vectors
participants$age  # use names to be consistent -> like in lists 


participants$income <- c(NA, 2500000) 

# exercise 2.4 ----
data <- matrix(rnorm(15), nrow = 3)
df.data <- as.data.frame(data)
names(df.data) <- c("age", "income", "sag", "gas", "ghr") # error-prone

# adding a new column
newcol <- matrix(rep("A"), nrow = 3, ncol = 1)
df.newcol <- as.data.frame(newcol)
cbind(df.data, df.newcol) # combine two data frames

# option 3/4 
df.data$"4" <- rep("A") # = "A"
df.data$v4 <- c(rep(c("A"), 3)) # = rep("A", 3)

# option 5
df.data$simple <- "B"

###
data$v4 <- c(rep(c("A"), 3)) # adding a column to a matrix does not work

rep(c("A", "B"), 4)
rep(c("A", "B"), each = 4)

df.data$numbers <- seq(from = 0, to = 1, length.out = 3)

## reading in data using tidyverse ----
library(tidyverse)
# getwd() -> how to identify
# setwd() -> change that
data.base <- read.csv("Datasets/iris.csv")
data.tidy <- read_csv("Datasets/iris.csv")
View(data.tidy)







