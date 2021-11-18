# Good coding practice - commenting
gene <- "KRAS" 
12 -> geneExpression

# different types of data
gene == geneExpression
vecGeneExpression <- c(12, 10, 2, 0, 34, NA)

# starting with function
mean(vecGeneExpression)
mean(vecGeneExpression, na.rm = TRUE)

?mean

# overview of plotting in base R

# decisions and functions:

#' Generate a random sample from a given distribution
#' Usage: randsamp(n) where n is the size of the sample

randsamp <- function(n, d="uniform", nrTosses = 1, probSuccess = .5) {
  
  if(d == "uniform") {
    print("You chose a uniform distribution.")
    ret <- runif(n)
  } else if(d == "normal") {
    ret <- rnorm(n)
  } else if(d == "binomial"){
    print("You chose a binomial distribution.")
    ret <- rbinom(n, size = nrTosses, prob = probSuccess)
  } else {
    stop("I don't know this distribution!")
  }
  
  return(ret)
}

y <- randsamp(2, d = "binomial", nrTosses = 10, probSuccess = 0.9)
rbinom(2)
?rbinom
