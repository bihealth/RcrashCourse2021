# First steps ----
# projects 
# keep everything related to one project in one directory
# 

iris <- read_tsv("iris.tsv") # it doesn't know "read_tsv"
iris <- read.delim("iris.tsv")
iris <- read.delim("Datasets/iris.tsv")

# Error messages are important!

"Datasets/cars.xlsx"

# Basic language ----
avariable <- 2 
name <- "Manuela Benary"
a <- c(1, 5, 7)

# use operators
a <- 3 + 5
b <- a * 3

# functions: functionName()
a <- c(3, 4, 5)

# read.delim()
help("c")

lengthAppartment <- c(2, 2, .40, 2, 1.6)
# sum up individual elements
sum(lengthAppartment)


# exercise 1.1
# documentation might change over time
waterLevels <- c("low", "medium", "high", "low")
factor(x = waterLevels, 
       levels = c("empty", "low", "medium", "high"))


# a function does one thing only

# k, kk, kkk, kkkk refactoring means make your code more clean - you might be
# able to detect bugs

# final comment

# Using the work from others ----


# installing new packages (do once for a package)
install.packages("tidyverse")
# load library (once for every session)
library(tidyverse)
