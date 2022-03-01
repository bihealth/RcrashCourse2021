# Exercise 2.1 
# covered = 1/100 * 2^(day - 1)
# y = 1/100 * 2^(x - 1)

#' coveredArea
#' covered area of a lake using an exponential function
coveredArea <- function(days, beginningArea = 1/100, growthRate = 2) {
  
  y <- beginningArea * growthRate^(days-1) # fraction of covered lake
  return(y)
}

x <- 1:10 # days
y <- 1/100 * 2^(x-1) # fraction of covered lake
# lets use our function
coveredArea(x)

plot(x, y, col = "red") 
lines(x, y)
abline(h = 0.5, lty = "dashed") 


# water lilies only cover 1.5x
y <- 1/100 * 1.5^(x-1) # fraction of covered lake
coveredArea(x, growthRate = 1.5)

# water lilies cover 1/10 of the lake on day 1
y <- 1/10*1.5^(x-1)

# plot multiple versions
plot(x, coveredArea(x))
lines(x, coveredArea(x))
lines(x, coveredArea(x, growthRate = 1.5), col="green")
lines(x, coveredArea(x, growthRate = 2.5), col="red")
