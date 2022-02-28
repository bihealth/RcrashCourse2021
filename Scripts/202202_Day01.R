# script for first day
# move to working directory
setwd("C:/Users/mbenary_c/CUBI/teaching/RcrashCourse2022_02")
3 + 2
library(tidyverse)
iris <- read_tsv("Datasets/iris.tsv")
iris <- read_csv("Datasets/iris.csv")


## why programming ? ----
# more flexibility
# ensure reproducibility
# for public use by other researchers
# to be more general -> automation
# having loops, using more complex programming

## why R ?
# statistical language 
# exploratory data analysis / data wrangling
# community for statistical / bioinformatical tools
# it's open source

# not an easy language 
# huge community - > multiple ways of doing the same thing (confusing)
# image analysis / machine learning -> use other languages

## programming basics ----
# store data for reuse 
some_data <- 3 + 5           # bad example for a variable name
some_text <- "write some text"
fname <- "Datasets/iris.tsv"
a <- 2
a <- c(2, 3, 7, 5)

# use different types of data (text, numbers)
# use functions - solve more complex issues
# "<-"
# https://github.com/bihealth/RcrashCourse2021

# factor - some data with a pre-defined order / categories
weekdays <- c("mon", "tue", "wed", "thu", "mon", "mon")
weekdays.factor <- factor(weekdays, levels = c("mon", "tue", "wed", "thu", "fri"))
sort(weekdays) # by default: text -> alphabetically
sort(weekdays.factor) # factor: use predefined order
summary(weekdays)
summary(weekdays.factor)

sum_of_a <- 2 + 3 + 7
sum(a)

# adding two vectors
short <- c(1:5, NA, NA) # = c(1,2,3,4,5, NA, NA)
long <- 1:7 

# how to define the length of a vector
summary(short) # not exactly, but also important
length(short)  # that's the way to go
length(long)
sum(short, na.rm = T)

short + long
short <- short + 3
short < long
all(short > long, na.rm = T)


## summary ----
# variable storing data 
# assignment (stores the data) <-
# types of data: numbers, text, vectors, factors
# functions: starting"(" and closing ")" -> ? to learn more about the function

## reading in data ----
# https://github.com/bihealth/RcrashCourse2021
iris <- read_tsv("Datasets/iris.tsv")

## same same, but different ----
# same function name for different programs
?dplyr::filter # works with tables, gets us a subset
?stats::filter # Linear Filtering on a Time Series

filter() # we will use dplyr
stats::filter # we are specifically calling a function from a package