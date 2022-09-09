# exercise 3.2

library(tidyverse)
iris <- read_csv("Datasets/iris.csv")

library(colorDF)
summary_colorDF(iris)

## sanitize column names
colnames(iris) <- gsub("[^a-z]", "_", colnames(iris), ignore.case = TRUE)

## first: diagnosis
iris$Sepal_Length
# temporary variable, we are not modifying sl!
sl <- as.numeric(iris$Sepal_Length)
is.na(sl)
problems <- which(is.na(sl))
iris$Sepal_Length[ problems ]

## once the problem is diagnosed, let us clean up Sepal_Length
iris$Sepal_Length <- gsub(",", ".", iris$Sepal_Length)
iris$Sepal_Length <- gsub("[a-z]", "", iris$Sepal_Length, ignore.case = TRUE)
iris$Sepal_Length <- as.numeric(iris$Sepal_Length)

# function takes a character vector
# and shows the elements which cannot be converted to numbers
showProblems <- function(x) {
  ret <- x[ which(is.na(as.numeric(x))) ]
  return(ret)
}

showProblems(iris$Petal_Length)

iris$Petal_Length <- as.numeric(gsub("[^0-9.,]", "", iris$Petal_Length))

### there is a problem with Sepal_Width: anything larger than 10 misses a decimal dot
sel <- which(iris$Sepal_Width > 10)
iris$Sepal_Width[ sel ] <- iris$Sepal_Width[ sel ] / 10


## problems with Species
unique(iris$Species)
iris$Species <- tolower(iris$Species)
