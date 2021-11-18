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
a <- c(1, 7, 9)
a
c
c <- 2
a + c
a
c()
c(1, 2, 3, 4, a)
x <- 1:10
x
y <- 5
x
y
x * y
x/y
x + y
vec1 <- 1:10
vec2 <- 20:30
vec1 + vec2
x
y
y <- c(1,2)
x * y
length(vec1)
length(vec2)
c(1:10, 15, 20, 100)
c(1) + c(2)
1 + 2
seq(0, 2*pi, length.out=100)
?factor
fac <- c("male", "male", "female", "female", "male")
fac
fac <- factor(fac)
fac
fac + 2
as.numeric(fac) + 2
weight <- c(16, 17, 21, 23, 15)
t.test(weight ~ fac)
fac <- c("male", "male", "female", " female", "male")
factor(fac)
fac
factor(c(1,2,3))
factor(c(1,2,4))
original <- c(1,2,4)
fac <- factor(original)
original + 3
as.numeric(fac) + 3
as.numeric(fac)
# asdfasdfkj asdkjfkasdfjasdf
savehistory()
knitr::opts_chunk$set(echo = TRUE)
summary(cars)
x <- 1:7
x
y <- frac_init * 2^x
frac_init <- 1/100
x <- 1:7
y <- frac_init * 2^x
y
plot(x, y)
plot(x, y, type="l")
frac_init <- 1/100
x <- 1:7
y <- frac_init * 2^x
plot(x, y, type="l")
frac_init <- 1/100
x <- 1:7
y <- frac_init * 2^x
plot(x, y, type="l")
frac_init <- 1/100
x <- 1:7
y <- frac_init * 2^x
plot(x, y, type="l")
frac_init <- 1/100
x <- 1:7
y <- frac_init * 2^x
plot(x, y, type="l")
abline(h=.5)
plot(x, y, type="l", lty=2, bty="n")
x <- seq(1, 7, length.out=100)
y <- frac_init * 2^x
plot(x, y, type="l", lty=2, bty="n")
plot(x, y, type="l", lty=2, bty="n", xlab="Day", ylab="Fraction of pond covered", main="Lily pond")
abline(h=.5, col="grey")
ggplot(df, aes(x=x, y=y)) + geom_line()
x
y
plot(x, y)
df <- data.frame(x=x, y=y)
ggplot(df, aes(x=x, y=y)) + geom_line()
ggplot(df, aes(x=x, y=y)) + geom_line() + theme_bw() + xlab("Day") + ylab("Fraction of pond covered") +
ggtitle("Lily pond")
??abline
?geom_abline
ggplot(df, aes(x=x, y=y)) + geom_line() + theme_bw() + xlab("Day") + ylab("Fraction of pond covered") +
ggtitle("Lily pond") + geom_hline(.5)
ggplot(df, aes(x=x, y=y)) + geom_line() + theme_bw() + xlab("Day") + ylab("Fraction of pond covered") +
ggtitle("Lily pond") + geom_hline(y=.5)
ggplot(df, aes(x=x, y=y)) + geom_line() + theme_bw() + xlab("Day") + ylab("Fraction of pond covered") +
ggtitle("Lily pond") + geom_hline(yintercept =.5)
ggplot(df, aes(x=x, y=y)) + geom_line() + theme_bw() + xlab("Day") + ylab("Fraction of pond covered") +
ggtitle("Lily pond") + geom_hline(yintercept =.5, color="grey")
frac_init <- 1/100
x <- seq(1, 7, length.out=100)
y <- frac_init * 2^x
plot(x, y, type="l", lty=2, bty="n",
xlab="Day", ylab="Fraction of pond covered",
main="Lily pond")
abline(h=.5, col="grey")
frac_init <- 1/100
x <- seq(1, 7, length.out=100)
y <- frac_init * 2^x
plot(x, y, type="l", lty=2, bty="n",
xlab="Day", ylab="Fraction of pond covered",
main="Lily pond")
abline(h=.5, col="grey")
library(ggplot2)
df <- data.frame(x=x, y=y)
ggplot(df, aes(x=x, y=y)) + geom_line() + theme_bw() + xlab("Day") + ylab("Fraction of pond covered") +
ggtitle("Lily pond") + geom_hline(yintercept =.5, color="grey")
frac_init <- 1/100
x <- seq(1, 7, length.out=100)
y <- frac_init * 2^x
plot(x, y, type="l", lty=2, bty="n",
xlab="Day", ylab="Fraction of pond covered",
main="Lily pond")
abline(h=.5, col="grey")
frac_init <- 1/100
x <- seq(1, 7, length.out=100)
y <- frac_init * 2^x
plot(x, y, type="l", lty=2, bty="n",
xlab="Day", ylab="Fraction of pond covered",
main="Lily pond")
abline(h=.5, col="grey")
x <- seq(1, 7, length.out=100)
frac_init <- 1/100
x <- seq(1, 7, length.out=100)
y <- frac_init * 2^x
plot(x, y, type="l", lty=2, bty="n",
xlab="Day", ylab="Fraction of pond covered",
main="Lily pond")
abline(h=.5, col="grey")
library(ggplot2)
df <- data.frame(x=x, y=y)
ggplot(df, aes(x=x, y=y)) + geom_line() + theme_bw() + xlab("Day") + ylab("Fraction of pond covered") +
ggtitle("Lily pond") + geom_hline(yintercept =.5, color="grey")
frac_init <- 1/100
x <- seq(1, 7, length.out=100)
y <- frac_init * 2^x
plot(x, y, type="l", lty=2, bty="n",
xlab="Day", ylab="Fraction of pond covered",
main="Lily pond")
abline(h=.5, col="grey")
library(ggplot2)
df <- data.frame(x=x, y=y)
ggplot(df, aes(x=x, y=y)) + geom_line() + theme_bw() + xlab("Day") + ylab("Fraction of pond covered") +
ggtitle("Lily pond") + geom_hline(yintercept =.5, color="grey")
frac_init <- 1/100
x <- seq(1, 7, length.out=100)
y <- frac_init * 2^x
plot(x, y, type="l", lty=2, bty="n",
xlab="Day", ylab="Fraction of pond covered",
main="Lily pond")
abline(h=.5, col="grey")
library(ggplot2)
df <- data.frame(x=x, y=y)
ggplot(df, aes(x=x, y=y)) + geom_line() + theme_bw() + xlab("Day") + ylab("Fraction of pond covered") +
ggtitle("Lily pond") + geom_hline(yintercept =.5, color="grey")
frac_init <- 1/100
x <- seq(1, 7, length.out=100)
y <- frac_init * 2^x
plot(x, y, type="l", lty=2, bty="n",
xlab="Day", ylab="Fraction of pond covered",
main="Lily pond")
abline(h=.5, col="grey")
plot(x, y, type="l", lty=3, bty="n",
xlab="Day", ylab="Fraction of pond covered",
main="Lily pond")
plot(x, y, type="l", lty=3, bty="n",
xlab="Day", ylab="Fraction of pond covered",
main="Lily pond", col="red")
y2 <- frac_init * 1.5^x
line(x, y2, col="blue", lty=2)
lines(x, y2, col="blue", lty=2)
abline(h=.5, col="grey")
plot(x, y, type="l", lty=3, bty="n",
xlab="Day", ylab="Fraction of pond covered",
main="Lily pond", col="red", log="y")
y2 <- frac_init * 1.5^x
lines(x, y2, col="blue", lty=2)
plot(x, y)
x <- 1:7
x
y <- frac_init * 2^x
y[3]
y
y[1:2]
y[ c(1, 3, 5) ]
y[ -2 ]
y[ -c(1, 3, 5) ]
pond_surface_covered <- function(init_pond_surface, day=0) {
## "**" and "^" do the same thing
ret <- init_pond_surface * 2^day
return(ret)
}
pond_surface_covered(1/100, 3)
pond_surface_covered(1/100, c(1, 2, 5))
View(pond_surface_covered)
View(pond_surface_covered)
rnorm(5)
plot(density(rnorm(1000)))
rnorm(5)
runif(5)
plot(density(runif(1000)))
d <- "uniform"
d == "uniform"
d == "Uniform"
randsamp <- function(n, d="uniform") {
if(d == "uniform") {
ret <- runif(n)
} else if(d == "normal") {
ret <- rnorm(n)
} else {
stop("I don't know this distribution!")
}
return(ret)
}#
View(randsamp)
randsamp(10, d="normal")
randsamp(10, d="uniform")
randsamp(10)
?log
?rnorm
randsamp(10, d="beta")
stop("In the name of R")
m <- matrix(1:18, ncol=3, nrow=6)
# compare with
m <- matrix(1:18, ncol=3, nrow=6, byrow=TRUE)
dim(m)
ncol(m)
nrow(m)
m <- matrix(1:18, ncol=3, nrow=6)
m
m[, 2:3]
m <- matrix(1:18, ncol=3, nrow=6, byrow = TRUE)
m
m[2:3,]
m[2:3, 1:2]
m[ ,3]
m[1, ]
m
m[ , c(1,3)]
sel <- c(1,3)
sel
m[ , sel]
m[ , c(TRUE, FALSE, TRUE)]
dim(m)
ncol(m)
nrow(m)
dim(m[,2:3])
dim(m[, 3])
m
colnames(m) <- c("one", "two", "three")
m
rownames(m) <- letters[1:6]
m
m[,2:3]
m[, 3:2]
m[, 3]
my_first_list <- list()
my_first_list
my_first_list[[1]] <- pi
my_first_list
my_first_list[[2]] <- "The Value of Pi"
my_first_list
names(my_first_list) <- c("TheValue", "TheDescription")
my_first_list
my_first_list$TheValue
t.test(weight ~ fac)
weight <- c(16, 17, 21, 23, 15)
fac <- factor(c("male", "male", "female", " female", "male"))
fac
t.test(weight ~ fac)
fac <- factor(c("male", "male", "female", "female", "male"))
t.test(weight ~ fac)
res <- t.test(weight ~ fac)
res
res$p.value
?format.pval
fac <- c("male", "male", "female", "female", "male")
res <- t.test(weight ~ fac)
names <- c("January", "Bill")
lastn <- c("Weiner", "Gates")
age   <- c(1001, 64)
d <- data.frame(names=names, last_names=lastn, age=age)
d
View(print.data.table)
View(print.data.frame)
rm(print.data.frame)
rm(print.data.table)
rm(print.tbl)
df
d
d$age
d$last_names
d$names
d[1, ]
d[,2]
read_csv("../Datasets/iris.csv")
iris <- read_csv("../Datasets/iris.csv")
iris$X1
iris
iris[ , 1]
i1 <- read_csv("../Datasets/iris.csv")
i1
i1$Species
i1$Sepal Length
i1$`Sepal Length`
i2 <- read.csv("../Datasets/iris.csv")
i2
i1 <- as.data.frame(read_csv("../Datasets/iris.csv"))
i1
i1 <- read_csv("../Datasets/iris.csv")
rownames(i1) <- i1$X1
i1
rownames_to_column(i1)
c(1, 1, 2, 3, 45, 1, 2)
unique(c(1, 1, 2, 3, 45, 1, 2))
unique(i1$Species)
summary(i1$`Sepal Length`)
summary(i1$`Petal?Length`)
summary(i1$Species)
summary(factor(i1$Species))
class(factor(i1$Species))
class(i1$Species)
class(i1$`Sepal Length`)
class(1:10)
class(df)
class(list())
i1
readxl_example("deaths.xls")
library(readxl)
readxl_example("deaths.xls")
read_excel(readxl_example("deaths.xls"))
read_csv("../Datasets/iris.csv")
foo <- read_excel("../Datasets/cars.xlsx")
foo
savehistory(file="../Scripts/lecture02_script.R")
