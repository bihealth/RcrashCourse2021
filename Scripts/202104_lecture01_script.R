## --- reading first data ----
library(readr)
iris <- read_delim("../Datasets/iris.tsv", "\t", escape_double = FALSE, trim_ws = TRUE)
View(iris)

## --- preparing / assigning variable ----
myRandomNumbers <- rnorm(100) # functions in R ()
x <- 5
y <- "text"

#?
#??

#a = 12 = b   # this will not work
a <- 12 -> b  # but this will
a + b

rnorm(n = 100)
a %/% x # integer division
x == b
a <- c(2, 5, 7)
b <- 1:12


myRandomNumbers <= 0 
data.frame(myRandomNumbers)

trial <- c("low", "low", "medium", "medium")
factor_trial <- factor(x = trial, levels = c("placebo", "low", "medium", "high")) # better use this
factor_trial <- factor(trial, c("placebo", "low", "medium", "high"))              # rather than this

# examples for meaningful variables
genes <- c("BRAF", "KRAS", "ERK")
expGenes <- c(4200, 220, 2000)


## --- what you should never do ----
c <- c(3, 5, 7)      # confusing
 


