# lily pond problem - Exercise 2.1 ----
x <- 1:10    # days

#' pond_surface_covered
#' param: n0 ... starting area covered
pond_surface_covered <- function(day, n0 = 1/100, growth_rate = 2){
  # vectorized function
  y <- n0*growth_rate^(day-1)
  return(y)
}

y <- pond_surface_covered(x)
# plotting
plot(x, y, col = "blue")
abline(h = 0.5, col = "red")

# how much is covered on day 3
y[3]
y[c(1, 7)]


# example for function - random distribution ----
# including extension to exercise 2.3

#' random samples from multiple distribution
#' n ... number of samples
#' d ... distribution
randsamp <- function(n, d = "uniform"){
  if(d == "uniform"){
    return( runif(n) )
  } else if(d == "normal"){
    return( rnorm(n))
  } else if(d == "binomial"){
    return(rbinom(n, size = 1, prob = 0.5))
  } else{
    stop("I don't know this distribution.")
  }
}

# types of variables ----
## numbers / strings (simple text) / boolean (TRUE or FALSE)
## vector (multiple elements of the same type)
m <- matrix(1:18, ncol = 3, nrow = 6)
m <- matrix(1:18, ncol = 3, byrow = TRUE)
dim(m)
ncol(m)
nrow(m)
m[2, 3]
m[, 3]

colnames(m) <- letters[1:ncol(m)]
rownames(m) <- LETTERS[1:nrow(m)]

m["C", "b"]
# select a smaller matrix
# : is not working for text
m[1:2, 1:2]
m[c("A", "B"), c("a", "b")]

ind <- colnames(m) != "b"  # ! = without space
m[, ind]


data <- list("Charitéplatz", 1, "10115", "Berlin", TRUE)
data[[2]]
names(data) <- c("street", "number", "code", "city", "company")

data[["code"]]

data.frame
names <- c("January", "Manuela", "Bill")
lastn <- c("Weiner", "Benary", "Gates")
age <- c(1001, NA, 64)

# data frames are lists 
d <- data.frame(names = names, last_names = lastn, age = age)
View(d)
dim(d)
d[3,1]
class(d["age"])
d$age
d[3,]

t(m)
class(t(d)) # you don't want to use it on data frames

## Exercise 2.4 ----
mat_rand <- matrix(rnorm(15), nrow = 5)
colnames(mat_rand) <- letters[1:ncol(mat_rand)]
rownames(mat_rand) <- LETTERS[1:nrow(mat_rand)]
mat_rand
df_rand <- as.data.frame(mat_rand)
# mat_rand[, "new"] <- rep("A", nrow(mat_rand)) - not working
df_rand[, "new"] <- rep("A", nrow(mat_rand))
df_rand$another_new <- "B"
df_rand[,6] <- "more"
