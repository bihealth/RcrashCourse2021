# The pond example ----

# 1. define a formula

# 1/100*growthrate^day

# working with specific numbers
growthRate <- 2
day <- 5

1/100*growthRate^day

# work with different numbers
# be aware that here the first day is the second day of observation
# to also have "Day 0" in it either start vector of days at 0 or change formula
# 1/100*growthRate^(days-1) would be the non confusing formula
days <- c(0,1,2,3,4,5,6,7,8,9,10) # days <- 0:10 would be the same

pondArea <- 1/100*growthRate^days # assign the result to a variable
pondArea

# selecting a specific element within our vector
pondArea[3]


# plotting 

plot(x = days, y = 1/100*growthRate^days) # works but complicated
plot(x = days, y = pondArea)# use the variable we defined earlier
abline(h = .5)
title("Pond Area")





plot(days, 1/100*growthRate^days, 
     col = "blue", log = "y", 
     main = "Log10 Pond Area")

plot(days, 1/100*growthRate^days, 
     col = "blue", main = "Pond Area")
abline(h = .5)

# a bit about functions
# to lazy to copy and paste / want to change parameters without defining everything new

pondArea_function <- function(startArea, 
                              growthRate, 
                              days){
  pondArea <- startArea*growthRate^days
  return(pondArea)
}

pondArea_function(startArea = 1/100, growthRate = 2, 
                  days = 1:20)

# lazy version (order of arguments is followed if they are not named when calling the function)
pondArea_function(1/100, 2, 1:20)

# default parameters for our function
pondArea_function_default <- function(startArea, 
                              growthRate=2, 
                              days=1:10){
  pondArea <- startArea*growthRate^days
  return(pondArea)
}

# ELse if statements

randsamp <- function(n, dist = "uniform", s = 1, p = .5){
  if(dist == "uniform"){
    ## can get pretty complex
    # if(n > 1)  # n higher than 1
    # if(dplyr::str_detect(dist, "uni")) # if detecting certain string "uni" in dist 
    # if(dist == "uniform" & n > 5) # if dist is "uniform" AND n > 5
    # if(dist == "uniform | dist == "uni") # if dist is "uniform" OR dist is "uni"
    result <- runif(n)
  }else if(dist == "normal"){
    result <- rnorm(n)
    
  }else if(dist == "binomial"){
   result <- rbinom(n, size = s, prob = p) 
  }else{
    stop("Unknown distribution") # will stop your function & return an error
    # warning() # everything after the warning will still get done but a warning is returned
    # print() # prints a statement (useful for debugging  or "progress bars")
  }
  return(result)
}

randsamp(n = 10, dist = "binomial", s = 1, p = .3)


