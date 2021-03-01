x <- rnorm(100)
y <- rnorm(100)
plot(x, y)
df <- data.frame(x=x, y=y)
library(ggplot2)
ggplot(df, aes(x=x, y=y)) + geom_point()
library(tidyverse)
read_csv("../Datasets/iris.csv")
sin(pi)
bucket123 <- read_csv("../Datasets/iris.csv")
View(bucket123)
rm(bucket123)
1:5
pi
2 * pi
steps <- 1:100
length(steps)
steps
steps * 2
steps * (2 * pi / 100)
x <- steps * (2 * pi / 100)
y <- sin(x)
plot(x, y, type="line")
abline(y=0)
abline(h=0)
## useful! ctrl-r
steps <- 0:100
steps
x <- steps * (2 * pi / 100)
y <- sin(x)
plot(x, y)
plot(x, y, type="l")
savehistory()
abline(h=0)
abline(v=pi, col="red")
?read_delim
whatever <- 5
whatever <- c(pi, 5, 20)
whatever
whatever = c(pi, 5, 20)
whatever <- c(pi, 5, "asdf")
whatever
5 + 5
"5" + 5
as.numeric("5") + 5
5 + 5
2*6
2**4
2e5
5/6
5/6
c(TRUE, FALSE, TRUE)
logics <- c(TRUE, FALSE, TRUE)
c("asdasdf", "oi8qw13987123")
c(12, 3, 5)
letters
letters * 2
foo <- c(2, 5, 6)
2 > 3
5 > 3
foo * 2
foo > 3
fool <- foo > 3
fool
which(fool)
TRUE + 5
sum(fool)
savehistory()
