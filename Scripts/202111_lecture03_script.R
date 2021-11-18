# Repetition ----
data <- matrix(1:12, nrow = 3)
data
data[1,2:3]

dataList <- list(a = "text", b = 12)
dataList[[1]]
class(dataList[1])

dataList$a

## tidying data ----
## load libraries ----
library(tidyverse)
library(readxl)
library(colorDF)
# side note: install a new package using "install.packages()"

## load the data for today ----
expr <- read_excel("Datasets/expression_data_vaccination_example.xlsx")
summary_colorDF(expr)

botched <- read_excel("Datasets/meta_data_botched.xlsx")
View(botched)
summary_colorDF(botched)

## substitutions ----
group <- c("Control", " control", "control ", "Control   ", "treatment A")
group <- gsub(pattern = "Control", replacement = "control", group)
group <- gsub(pattern = " ", replacement = "", group) # might be problematic

# clarify pattern
group <- gsub(pattern = " +$", "", group) # + ... 1 or more occurrences
group <- gsub(pattern = "^ *", "", group) # * ... 0 or more occurrences
group

# special meanings:
# ^ .. beginning of a string
# $ .. ending of a string

trimws(group)

# another example 
foo <- c("a1_123", "a1_231", "a2_17", "B2_23", "c2_889")
foo1 <- gsub(pattern = "_.*", replacement = "", foo)
gsub("B", "b", foo1)

foo1 <- tolower(foo1)  # simplification of regular expressions
toupper(foo1)  # this only goes into the console -> assign to variables if used further

gsub(pattern = "[0-9]|_", replacement = "", foo)

# example with organism names
vec <- c("mouse", " Mouse", "mus domesticus", "chicken", "Schicken", "Duck")
clean.vec <- gsub("S*chicken", "Chicken", gsub("^m.*", "Mouse", gsub("^ *", "", vec)))

gsub("A|b", "z", c("Alpha", "beta"))

# Exercise 3.1
genes <- c("ANKRD22", "ank.rep.domain 12", "ifng-1", "ANKRD-33", "  ankrd23")
genes <- tolower(genes)
genes <- trimws(genes)
ankrd.genes <- gsub(pattern = "\\..*", "rd", genes)
ankrd.genes <- gsub("[0-9\\-]", "", ankrd.genes)
genes[ankrd.genes == "ankrd"]



names(botched)
# clean the vector
# reassign into a new column in your dataframe
sex <- botched$SEX
# transform it
botched$cleanedGender <- sex
names(botched)
summary_colorDF(botched)
# contigency table to check your cleaned data
table(botched$SEX, botched$cleanedGender)

# create a new dataframe

## wide vs long format
iris
# transform from wide to long
# part of tidyverse
iris_long <- pivot_longer(iris, c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width))
ggplot(iris_long, aes(x = name, y = value, fill = Species)) + geom_violin()

ggplot(iris, aes(x = Petal.Width, y = Petal.Length, color = Species)) + geom_point()

result <- prcomp(as.matrix(iris[,2:5]))
result.df <- as.data.frame(result$x)
result.df$Species <- iris$Species

ggplot(result.df, aes(x = PC1, y = PC2, color = Species)) + geom_point()


pivot_wider(iris_long, names_from = "name", values_from = "value")

cars <- read.csv("Datasets/mtcars_wide.csv")
cars$mpg <- gsub("[a-zA-Z]", "", cars$mpg)
cars$mpg <- as.numeric(cars$mpg)
trimws(cars$drat)
cars$drat <- as.numeric(cars$drat)
summary_colorDF(cars)

pivot_longer(cars, -c(X, model))

