# matrices

mtx <- matrix(1:18, nrow=3, byrow=TRUE)
nrow(mtx)
ncol(mtx)
dim(mtx)

mtx

mtx[ 1, ]
mtx[ , 1 ]
mtx[1:2 , 1:2]
mtx * 2
t(mtx)

mtx[ 1, 1]  <- 99
mtx
mtx[ 1, 1] <- "whatever"
mtx[ 1, 1]  <- 99
mtx
mtx <- matrix(as.numeric(mtx), nrow=3)

v <- c(1:10)
v
v[1] <- "whatever"
v
as.numeric(v)

colnames(mtx) <- LETTERS[1:ncol(mtx)]
n_rows <- nrow(mtx)
rownames(mtx) <- letters[1:n_rows]

mtx[ "b", ]
mtx[ , c("A", "C")]

mtx


v <- 1:10

names(v) <- LETTERS[1:length(v)]
v
v[ c("E", "I", "J") ]
v[ c("X")]



l <- list(1, "A", matrix(0, nrow=3, ncol=3))
l
l[[1]]  
l[[2]]
l[[3]]
l <- list(one=1, letterA="A", justAMatrix=matrix(0, nrow=3, ncol=3))
## not an element, but a list!
l[1]
l
l[[1]]
l[["letterA"]]
l$letterA

names(l)
names(l) <- c("foo", "bar", "baz")
l

names <- c("January", "Bill")
lastn <- c("Weiner", "Gates")
age   <- c(1001, 64)
df <- data.frame(names=names, ages=age, last_names=lastn)
df

## one row – it is a data frame!
df[1, ]
df$ages
df[ , 1]
df[ , 1:2]
df$wealth <- c(-10, 1e10)
dim(df)

tib <- as_tibble(df)
dim(tib)

read_tsv("../RcrashCourse2021/Datasets/iris.tsv")
myiris <- read_tsv("../RcrashCourse2021/Datasets/iris.tsv")
View(myiris)
myiris
myiris$Row <- NULL
myiris

myiris2 <- read_csv("../RcrashCourse2021/Datasets/iris.csv")

fname <- readxl_example("deaths.xlsx")
deaths <- read_excel(fname, skip=4, n_max=10)
deaths


